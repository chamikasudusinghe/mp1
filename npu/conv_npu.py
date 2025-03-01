import numpy as np
import math

import neuronxcc.nki as nki
import neuronxcc.nki.language as nl
import neuronxcc.nki.isa as nisa
from neuronxcc.nki import baremetal

# Constants
CHANNEL_TILE = 128
OUTPUT_TILE = 2
INPUT_TILE = OUTPUT_TILE + 2  # Adjusted for filter overlap

"""
A convolution kernel that you need to implement.

Parameters:
    X: the input tensor
    W: the weights of the convolution filters.
    bias: the biases of the convolution filters.

expect: X.shape == [batch_size, in_channels, input_height, input_width]
expect: W.shape == [out_channels, in_channels, filter_height, filter_width]
expect: bias.shape == [out_channels]
expect: filter_height == filter_width
expect: input_channels % 128 == 0
expect: output_channels % 128 == 0

out_height = input_height - filter_height + 1
out_width = input_width - filter_width + 1

out_pool_height = out_height
out_pool_width = out_width

The shape of the output should be [batch_size, out_channels, out_pool_height, out_pool_width]

"""

@nki.jit
def conv2d(X, W, bias):

    batch_size, in_channels, input_height, input_width = X.shape
    out_channels, in_channels_, filter_height, filter_width = W.shape
    out_channels_ = bias.shape[0]

    assert (
        in_channels_ == in_channels and out_channels_ == out_channels
    ), f"Shape mismatch. {in_channels}, {in_channels_}, {out_channels}, {out_channels_}"

    out_height = input_height - filter_height + 1
    out_width = input_width - filter_width + 1

    # out_pool_height = out_height
    # out_pool_width = out_width
    
    # Can assume multiple of 128 to avoid using mask
    assert in_channels % 128 == 0

    # Can assume one PSUM bank can at least fit one row of the pixels
    assert nl.tile_size.gemm_moving_fmax >= out_width

    # Initialize output array
    X_out = nl.ndarray(
        shape=(batch_size, out_channels, out_height, out_width),
        dtype=X.dtype,
        buffer=nl.hbm,
    )

    # Various tiling dimensions (You may want to define more of them)
    # c_in_pmax = nl.tile_size.pmax
    n_tiles_c_in = in_channels // CHANNEL_TILE
    n_tiles_c_out = out_channels // CHANNEL_TILE
    n_tiles_h = out_height // OUTPUT_TILE

    # Preallocate weight storage
    W_preprocessed = nl.ndarray(
        shape=(filter_height, filter_width, n_tiles_c_out, n_tiles_c_in, nl.par_dim(CHANNEL_TILE), CHANNEL_TILE),
        dtype=W.dtype,
        buffer=nl.sbuf
    )

    # Load full blocks of weights
    for oc in nl.affine_range(n_tiles_c_out):
        oc_idx = nl.ds(oc * CHANNEL_TILE, CHANNEL_TILE)
        for ic in nl.affine_range(n_tiles_c_in):
            ic_idx = nl.ds(ic * CHANNEL_TILE, CHANNEL_TILE)
            # Load full contiguous block first
            W_block = nl.load(W[oc_idx, ic_idx, :, :])
            # Loop over filter dimensions to extract 2D slices
            for f_height in nl.affine_range(filter_height):
                for f_width in nl.affine_range(filter_width):
                    W_preprocessed[f_height, f_width, oc, ic] = nisa.nc_transpose(W_block[:, :, f_height, f_width])

    # Process the images in batches
    for b in nl.affine_range(batch_size):
        for tile_height in nl.affine_range(n_tiles_h):

            # Load input tiles into SBUF
            X_in = nl.ndarray(
                shape=(n_tiles_c_in, nl.par_dim(CHANNEL_TILE), INPUT_TILE, input_width),
                dtype=X.dtype,
                buffer=nl.sbuf
            )
            
            for ic in nl.affine_range(n_tiles_c_in):
                X_in[ic, :, :, :] = nl.load(X[b, nl.ds(ic * CHANNEL_TILE, CHANNEL_TILE), nl.ds(tile_height * OUTPUT_TILE, INPUT_TILE), :])

            for oc in nl.affine_range(n_tiles_c_out):
                out_tile = nl.zeros(
                    shape=(nl.par_dim(CHANNEL_TILE), OUTPUT_TILE, out_width),
                    dtype=X_out.dtype,
                    buffer=nl.sbuf
                )

                # Compute convolution using matrix multiplications
                for oc_row in nl.affine_range(OUTPUT_TILE):
                    psum = nl.zeros((nl.par_dim(CHANNEL_TILE), out_width), dtype=nl.float32, buffer=nl.psum)
                    for i, j in np.ndindex(filter_height, filter_width):
                        for ic in nl.affine_range(n_tiles_c_in):
                            x_window = X_in[ic, :, oc_row + i, j:j + out_width]
                            w_tile = W_preprocessed[i, j, oc, ic, :, :]
                            psum += nl.matmul(w_tile, x_window, transpose_x=True)
                    out_tile[:, oc_row, :] = psum
                    
                # Bias addition
                bias_add = nl.load(bias[nl.ds(oc * CHANNEL_TILE, CHANNEL_TILE)]).reshape((CHANNEL_TILE, 1))
                out_tile = nisa.tensor_scalar(out_tile, np.add, bias_add)
                nl.store(X_out[b, nl.ds(oc * CHANNEL_TILE, CHANNEL_TILE),tile_height * OUTPUT_TILE:tile_height * OUTPUT_TILE + OUTPUT_TILE, :], out_tile)

    return X_out

