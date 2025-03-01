	.file	"gemm_cpu.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1864:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1864:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	_Z10fillRandomPfi._omp_fn.0, @function
_Z10fillRandomPfi._omp_fn.0:
.LFB2660:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	8(%rbp), %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L4
.L7:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L9
	movq	0(%rbp), %rcx
	movslq	%edx, %rdx
	decl	%eax
	addq	%rdx, %rax
	leaq	(%rcx,%rdx,4), %rbp
	leaq	4(%rcx,%rax,4), %rbx
	.p2align 4,,10
	.p2align 3
.L6:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	sarq	$34, %rdx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	subl	%edx, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2ssl	%eax, %xmm1, %xmm0
	addq	$4, %rbp
	vmovss	%xmm0, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L6
.L9:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	incl	%eax
	xorl	%edx, %edx
	jmp	.L7
	.cfi_endproc
.LFE2660:
	.size	_Z10fillRandomPfi._omp_fn.0, .-_Z10fillRandomPfi._omp_fn.0
	.p2align 4
	.type	_Z10initializePfi._omp_fn.0, @function
_Z10initializePfi._omp_fn.0:
.LFB2661:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	8(%rbp), %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L12
.L14:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L15
	decl	%eax
	leaq	4(,%rax,4), %r8
	movq	0(%rbp), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movslq	%edx, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 16
	leaq	(%rax,%rdx,4), %rdi
	xorl	%esi, %esi
	movq	%r8, %rdx
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memset@PLT
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	incl	%eax
	xorl	%edx, %edx
	jmp	.L14
	.cfi_endproc
.LFE2661:
	.size	_Z10initializePfi._omp_fn.0, .-_Z10initializePfi._omp_fn.0
	.p2align 4
	.type	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0, @function
_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0:
.LFB2662:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$192, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	movq	24(%rdi), %rax
	movq	32(%rdi), %rbx
	movq	%rdi, 160(%rsp)
	movl	(%rbx), %esi
	movq	%rbx, 24(%rsp)
	movl	%esi, 108(%rsp)
	movq	%rax, 32(%rsp)
	movl	(%rax), %eax
	movl	%eax, 172(%rsp)
	testl	%eax, %eax
	jle	.L17
	leal	63(%rax), %ebx
	sarl	$6, %ebx
	testl	%esi, %esi
	jle	.L17
	leal	63(%rsi), %r13d
	movl	%r13d, %r15d
	sarl	$6, %r15d
	imull	%r15d, %ebx
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	xorl	%edx, %edx
	movl	%ebx, %eax
	divl	%r12d
	movq	160(%rsp), %rsi
	cmpl	%edx, %ecx
	movl	%eax, %ebx
	jb	.L20
.L34:
	movl	%ecx, %eax
	imull	%ebx, %eax
	addl	%edx, %eax
	leal	(%rbx,%rax), %edx
	cmpl	%edx, %eax
	jnb	.L17
	xorl	%edx, %edx
	divl	%r15d
	movl	40(%rsi), %edi
	movq	16(%rsi), %r14
	movq	8(%rsi), %r13
	movq	(%rsi), %rsi
	movl	%edi, 104(%rsp)
	movq	%rsi, 72(%rsp)
	sall	$6, %edx
	sall	$6, %eax
	movl	%edx, 128(%rsp)
	movl	%eax, 120(%rsp)
	testl	%edi, %edi
	jle	.L17
	decl	%ebx
	movl	%ebx, 16(%rsp)
	leaq	176(%rsp), %rbx
	movq	%rbx, 8(%rsp)
	leal	64(%rax), %ebx
	cltq
	movq	%rax, 80(%rsp)
	movslq	172(%rsp), %rax
	movl	$0, 64(%rsp)
	movq	%rax, 144(%rsp)
	leaq	4(%rsi), %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, 112(%rsp)
	leaq	180(%rsp), %rbx
	movq	%rbx, (%rsp)
	movl	%edx, %ebx
.L21:
	leal	64(%rbx), %eax
	cmpl	%eax, 108(%rsp)
	movl	%eax, 116(%rsp)
	movq	8(%rsp), %rax
	movl	112(%rsp), %esi
	cmovl	24(%rsp), %rax
	movl	%esi, 20(%rsp)
	movq	%rax, 88(%rsp)
	movl	172(%rsp), %eax
	movl	$0, 124(%rsp)
	cmpl	%esi, %eax
	movq	(%rsp), %rsi
	movl	$0, 132(%rsp)
	cmovl	32(%rsp), %rsi
	imull	%ebx, %eax
	movq	%rsi, 96(%rsp)
	xorl	%r12d, %r12d
	movl	%eax, 68(%rsp)
	cltq
	addq	80(%rsp), %rax
	movq	%rax, 56(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movl	116(%rsp), %eax
	movl	112(%rsp), %ebx
	movl	%eax, 176(%rsp)
	movl	%ebx, 180(%rsp)
	movq	88(%rsp), %rax
	movq	96(%rsp), %rbx
	movl	(%rax), %eax
	movl	(%rbx), %ebx
	movl	%ebx, 140(%rsp)
	cmpl	%eax, 128(%rsp)
	jge	.L26
	movl	120(%rsp), %esi
	cmpl	%ebx, %esi
	jge	.L26
	movq	48(%rsp), %rdi
	movslq	124(%rsp), %rdx
	movq	72(%rsp), %r11
	subl	128(%rsp), %eax
	leaq	(%rdx,%rdi), %rcx
	decl	%eax
	leaq	(%r11,%rcx,4), %r9
	addq	%rdi, %rax
	movq	40(%rsp), %rcx
	addq	%rdx, %rax
	subl	%esi, %ebx
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 152(%rsp)
	leal	-1(%rbx), %eax
	movl	%eax, 160(%rsp)
	movl	%ebx, %eax
	shrl	$3, %eax
	movl	%esi, %edi
	leal	-1(%rax), %esi
	movl	%ebx, %eax
	andl	$-8, %eax
	movl	%eax, 168(%rsp)
	addl	%edi, %eax
	movslq	%r12d, %r11
	movl	%eax, 136(%rsp)
	addq	80(%rsp), %r11
	incq	%rsi
	movq	56(%rsp), %r8
	movl	68(%rsp), %r10d
	leaq	(%r14,%r11,4), %rcx
	salq	$5, %rsi
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	$6, 160(%rsp)
	vmovss	(%r9), %xmm1
	jbe	.L45
	leaq	0(%r13,%r8,4), %rdx
	vbroadcastss	%xmm1, %ymm2
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L30:
	vmovups	(%rdx,%rax), %ymm0
	vfmadd213ps	(%rcx,%rax), %ymm2, %ymm0
	vmovups	%ymm0, (%rcx,%rax)
	addq	$32, %rax
	cmpq	%rax, %rsi
	jne	.L30
	movl	168(%rsp), %eax
	cmpl	%ebx, %eax
	je	.L31
	movl	136(%rsp), %edx
.L27:
	movl	%ebx, %edi
	subl	%eax, %edi
	leal	-1(%rdi), %r15d
	cmpl	$2, %r15d
	jbe	.L32
	leaq	(%r11,%rax), %r15
	leaq	(%r14,%r15,4), %r15
	vmovups	(%r15), %xmm3
	addq	%r8, %rax
	vbroadcastss	%xmm1, %xmm0
	vfmadd132ps	0(%r13,%rax,4), %xmm3, %xmm0
	movl	%edi, %eax
	andl	$-4, %eax
	addl	%eax, %edx
	vmovups	%xmm0, (%r15)
	cmpl	%eax, %edi
	je	.L31
.L32:
	leal	(%r12,%rdx), %eax
	cltq
	leaq	(%r14,%rax,4), %rdi
	leal	(%r10,%rdx), %eax
	cltq
	vmovss	0(%r13,%rax,4), %xmm0
	movl	140(%rsp), %r15d
	vfmadd213ss	(%rdi), %xmm1, %xmm0
	leal	1(%rdx), %eax
	vmovss	%xmm0, (%rdi)
	cmpl	%eax, %r15d
	jle	.L31
	leal	(%r12,%rax), %edi
	addl	%r10d, %eax
	cltq
	vmovss	0(%r13,%rax,4), %xmm0
	movslq	%edi, %rdi
	leaq	(%r14,%rdi,4), %rdi
	vfmadd213ss	(%rdi), %xmm1, %xmm0
	addl	$2, %edx
	vmovss	%xmm0, (%rdi)
	cmpl	%edx, %r15d
	jle	.L31
	leal	(%r12,%rdx), %eax
	cltq
	leaq	(%r14,%rax,4), %rax
	vmovss	(%rax), %xmm4
	addl	%r10d, %edx
	movslq	%edx, %rdx
	vfmadd132ss	0(%r13,%rdx,4), %xmm4, %xmm1
	vmovss	%xmm1, (%rax)
.L31:
	addq	$4, %r9
	addl	172(%rsp), %r10d
	addq	144(%rsp), %r8
	cmpq	%r9, 152(%rsp)
	jne	.L29
.L26:
	incl	132(%rsp)
	movl	108(%rsp), %esi
	addl	172(%rsp), %r12d
	addl	%esi, 124(%rsp)
	movl	132(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	jne	.L22
	movl	16(%rsp), %ebx
	cmpl	%ebx, 64(%rsp)
	je	.L42
	movl	116(%rsp), %ebx
	cmpl	%ebx, 108(%rsp)
	jle	.L46
.L23:
	movl	116(%rsp), %eax
	incl	64(%rsp)
	movl	%eax, 128(%rsp)
	movl	%eax, %ebx
	jmp	.L21
.L42:
	vzeroupper
.L17:
	movq	184(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L47
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
	movl	120(%rsp), %edx
	xorl	%eax, %eax
	jmp	.L27
.L46:
	movl	112(%rsp), %eax
	movl	$0, 116(%rsp)
	movl	%eax, 120(%rsp)
	addl	$64, %eax
	movl	%eax, 112(%rsp)
	movslq	20(%rsp), %rax
	movq	%rax, 80(%rsp)
	jmp	.L23
.L20:
	incl	%ebx
	xorl	%edx, %edx
	jmp	.L34
.L47:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2662:
	.size	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0, .-_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2666:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r12
	testq	%r12, %r12
	je	.L54
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L50
	movsbl	67(%r12), %esi
.L51:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L51
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L51
.L54:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2666:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z10fillRandomPfi
	.type	_Z10fillRandomPfi, @function
_Z10fillRandomPfi:
.LFB2111:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%esi, 8(%rsp)
	movq	%rdi, (%rsp)
	xorl	%edx, %edx
	movq	%rsp, %rsi
	leaq	_Z10fillRandomPfi._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L59
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2111:
	.size	_Z10fillRandomPfi, .-_Z10fillRandomPfi
	.p2align 4
	.globl	_Z10initializePfi
	.type	_Z10initializePfi, @function
_Z10initializePfi:
.LFB2112:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movl	%esi, 8(%rsp)
	movq	%rdi, (%rsp)
	xorl	%edx, %edx
	movq	%rsp, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L64
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L64:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2112:
	.size	_Z10initializePfi, .-_Z10initializePfi
	.section	.rodata._ZN3Ref8checkRefEPf.str1.1,"aMS",@progbits,1
.LC0:
	.string	"fail at: "
.LC1:
	.string	", values: "
.LC2:
	.string	" vs. "
	.section	.text._ZN3Ref8checkRefEPf,"axG",@progbits,_ZN3Ref8checkRefEPf,comdat
	.align 2
	.p2align 4
	.weak	_ZN3Ref8checkRefEPf
	.type	_ZN3Ref8checkRefEPf, @function
_ZN3Ref8checkRefEPf:
.LFB2113:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	vmovss	(%rsi), %xmm0
	vucomiss	72(%rdi), %xmm0
	jp	.L79
	jne	.L79
	vmovss	76(%rdi), %xmm0
	leaq	4(%rsi), %rax
	vucomiss	4(%rsi), %xmm0
	jp	.L80
	jne	.L80
	vmovss	8(%rsi), %xmm0
	leaq	8(%rsi), %rax
	vucomiss	80(%rdi), %xmm0
	jp	.L81
	jne	.L81
	vmovss	12(%rsi), %xmm0
	leaq	12(%rsi), %rax
	vucomiss	84(%rdi), %xmm0
	jp	.L82
	jne	.L82
	vmovss	16(%rsi), %xmm0
	leaq	16(%rsi), %rax
	vucomiss	88(%rdi), %xmm0
	jp	.L83
	jne	.L83
	vmovss	20(%rsi), %xmm0
	leaq	20(%rsi), %rax
	vucomiss	92(%rdi), %xmm0
	jp	.L84
	jne	.L84
	vmovss	24(%rsi), %xmm0
	leaq	24(%rsi), %rax
	vucomiss	96(%rdi), %xmm0
	jp	.L85
	jne	.L85
	vmovss	28(%rsi), %xmm0
	leaq	28(%rsi), %rdx
	vucomiss	100(%rdi), %xmm0
	jp	.L95
	movl	$1, %eax
	jne	.L95
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L79:
	.cfi_restore_state
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L66:
	leaq	_ZSt4cout(%rip), %r13
	movl	$9, %edx
	movq	%r13, %rdi
	leaq	.LC0(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r13
	movl	$10, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%r13, %rdi
	vcvtss2sd	(%rbx), %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r13
	movl	$5, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%r13, %rdi
	vcvtss2sd	72(%rbp,%r12,4), %xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r12
	testq	%r12, %r12
	je	.L97
	cmpb	$0, 56(%r12)
	je	.L77
	movsbl	67(%r12), %esi
.L78:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	movl	$10, %esi
	cmpq	%rdx, %rax
	je	.L78
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L78
.L80:
	movq	%rax, %rbx
	movl	$1, %r12d
	jmp	.L66
.L81:
	movq	%rax, %rbx
	movl	$2, %r12d
	jmp	.L66
.L82:
	movq	%rax, %rbx
	movl	$3, %r12d
	jmp	.L66
.L83:
	movq	%rax, %rbx
	movl	$4, %r12d
	jmp	.L66
.L84:
	movq	%rax, %rbx
	movl	$5, %r12d
	jmp	.L66
.L85:
	movq	%rax, %rbx
	movl	$6, %r12d
	jmp	.L66
.L95:
	movq	%rdx, %rbx
	movl	$7, %r12d
	jmp	.L66
.L97:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2113:
	.size	_ZN3Ref8checkRefEPf, .-_ZN3Ref8checkRefEPf
	.text
	.p2align 4
	.globl	_Z11gemm_cpu_o0PfS_S_iii
	.type	_Z11gemm_cpu_o0PfS_S_iii, @function
_Z11gemm_cpu_o0PfS_S_iii:
.LFB2114:
	.cfi_startproc
	endbr64
	testl	%r8d, %r8d
	jle	.L109
	movl	%ecx, %r11d
	testl	%ecx, %ecx
	jle	.L109
	testl	%r9d, %r9d
	jle	.L109
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	-1(%r9), %eax
	salq	$2, %rax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movslq	%r8d, %r13
	movq	%rsi, %r10
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	leaq	4(%r12,%rax), %r14
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	0(,%r13,4), %rdi
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movslq	%r9d, %rbx
	movq	$-4, %r9
	salq	$2, %rbx
	xorl	%r12d, %r12d
	subq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L101:
	movq	%r14, %rsi
	movq	%rbp, %rcx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L104:
	vmovss	(%rcx), %xmm0
	leaq	(%r9,%rsi), %rax
	movq	%r10, %rdx
	.p2align 4,,10
	.p2align 3
.L102:
	vmovss	(%rax), %xmm1
	addq	$4, %rax
	vfmadd231ss	(%rdx), %xmm1, %xmm0
	addq	%rdi, %rdx
	vmovss	%xmm0, (%rcx)
	cmpq	%rax, %rsi
	jne	.L102
	incl	%r8d
	addq	%rdi, %rcx
	addq	%rbx, %rsi
	cmpl	%r8d, %r11d
	jne	.L104
	incq	%r12
	addq	$4, %r10
	addq	$4, %rbp
	cmpq	%r13, %r12
	jne	.L101
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L109:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE2114:
	.size	_Z11gemm_cpu_o0PfS_S_iii, .-_Z11gemm_cpu_o0PfS_S_iii
	.p2align 4
	.globl	_Z11gemm_cpu_o1PfS_S_iii
	.type	_Z11gemm_cpu_o1PfS_S_iii, @function
_Z11gemm_cpu_o1PfS_S_iii:
.LFB2115:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, -48(%rsp)
	testl	%ecx, %ecx
	jle	.L136
	testl	%r9d, %r9d
	jle	.L136
	movl	%r8d, %r13d
	testl	%r8d, %r8d
	jle	.L136
	movslq	%r9d, %rax
	movq	%rdx, %r12
	salq	$2, %rax
	movl	%r8d, %edx
	shrl	$3, %edx
	movq	%rax, -64(%rsp)
	leal	-1(%r9), %eax
	salq	$2, %rax
	movq	%rsi, %r11
	movl	%r8d, %ebx
	leal	-1(%rdx), %esi
	movq	$-4, %rdx
	leaq	4(%rdi,%rax), %rdi
	andl	$-8, %ebx
	subq	%rax, %rdx
	movl	%r8d, %eax
	andl	$7, %eax
	movq	%rdi, -8(%rsp)
	movl	%ebx, -32(%rsp)
	leal	-1(%r8), %edi
	leaq	4(%r11), %rbx
	movl	%edi, -28(%rsp)
	movq	%rbx, -16(%rsp)
	movq	%rdi, -88(%rsp)
	movl	%eax, -36(%rsp)
	movslq	%r8d, %rbx
	leaq	4(%r12), %rdi
	decl	%eax
	movl	$0, -44(%rsp)
	movq	%rbx, -24(%rsp)
	movq	%rdi, -80(%rsp)
	movq	%rdx, -72(%rsp)
	movl	%eax, -40(%rsp)
	incq	%rsi
	salq	$5, %rsi
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L114:
	movq	-88(%rsp), %rdi
	movslq	%r14d, %r15
	leaq	(%rdi,%r15), %rdx
	movq	-80(%rsp), %rdi
	movq	-72(%rsp), %r8
	leaq	(%rdi,%rdx,4), %rdi
	movq	%rdi, -56(%rsp)
	addq	-8(%rsp), %r8
	leaq	(%r12,%r15,4), %rax
	xorl	%edi, %edi
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L123:
	movq	-16(%rsp), %rbx
	leaq	0(,%rdi,4), %rcx
	leaq	(%rbx,%rcx), %r9
	movq	%rax, %rdx
	subq	%r9, %rdx
	vmovss	(%r8), %xmm1
	cmpq	$24, %rdx
	jbe	.L115
	movl	-28(%rsp), %ebx
	cmpl	$2, %ebx
	jbe	.L115
	cmpl	$6, %ebx
	jbe	.L124
	addq	%r11, %rcx
	vbroadcastss	%xmm1, %ymm2
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L117:
	vmovups	(%rcx,%rdx), %ymm0
	vfmadd213ps	(%rax,%rdx), %ymm2, %ymm0
	vmovups	%ymm0, (%rax,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rsi
	jne	.L117
	movl	-32(%rsp), %edx
	cmpl	%r13d, %edx
	je	.L122
	cmpl	$2, -40(%rsp)
	movl	-36(%rsp), %ebx
	movl	%edx, %ecx
	jbe	.L119
.L116:
	leaq	(%r15,%rcx), %r9
	leaq	(%r12,%r9,4), %r9
	vmovups	(%r9), %xmm3
	addq	%rdi, %rcx
	vbroadcastss	%xmm1, %xmm0
	vfmadd132ps	(%r11,%rcx,4), %xmm3, %xmm0
	movl	%ebx, %ecx
	andl	$-4, %ecx
	addl	%ecx, %edx
	vmovups	%xmm0, (%r9)
	cmpl	%ecx, %ebx
	je	.L122
.L119:
	leal	(%r14,%rdx), %ecx
	movslq	%ecx, %rcx
	leaq	(%r12,%rcx,4), %r9
	leal	(%r10,%rdx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%r11,%rcx,4), %xmm0
	leal	1(%rdx), %ecx
	vfmadd213ss	(%r9), %xmm1, %xmm0
	vmovss	%xmm0, (%r9)
	cmpl	%ecx, %r13d
	jle	.L122
	leal	(%r14,%rcx), %r9d
	addl	%r10d, %ecx
	movslq	%ecx, %rcx
	vmovss	(%r11,%rcx,4), %xmm0
	movslq	%r9d, %r9
	leaq	(%r12,%r9,4), %r9
	vfmadd213ss	(%r9), %xmm1, %xmm0
	addl	$2, %edx
	vmovss	%xmm0, (%r9)
	cmpl	%edx, %r13d
	jle	.L122
	leal	(%r14,%rdx), %ecx
	movslq	%ecx, %rcx
	leaq	(%r12,%rcx,4), %rcx
	vmovss	(%rcx), %xmm4
	addl	%r10d, %edx
	movslq	%edx, %rdx
	vfmadd132ss	(%r11,%rdx,4), %xmm4, %xmm1
	vmovss	%xmm1, (%rcx)
.L122:
	addq	$4, %r8
	addl	%r13d, %r10d
	addq	-24(%rsp), %rdi
	cmpq	-8(%rsp), %r8
	jne	.L123
	incl	-44(%rsp)
	movq	-64(%rsp), %rbx
	addl	%r13d, %r14d
	addq	%rbx, -8(%rsp)
	movl	-44(%rsp), %eax
	cmpl	%eax, -48(%rsp)
	jne	.L114
	vzeroupper
.L136:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	.cfi_restore_state
	movq	-56(%rsp), %r9
	leaq	(%r11,%rcx), %rdx
	movq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L121:
	vmovss	(%rdx), %xmm0
	addq	$4, %rcx
	vfmadd213ss	-4(%rcx), %xmm1, %xmm0
	addq	$4, %rdx
	vmovss	%xmm0, -4(%rcx)
	cmpq	%r9, %rcx
	jne	.L121
	jmp	.L122
.L124:
	movl	%r13d, %ebx
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L116
	.cfi_endproc
.LFE2115:
	.size	_Z11gemm_cpu_o1PfS_S_iii, .-_Z11gemm_cpu_o1PfS_S_iii
	.p2align 4
	.globl	_Z11gemm_cpu_o2PfS_S_iii
	.type	_Z11gemm_cpu_o2PfS_S_iii, @function
_Z11gemm_cpu_o2PfS_S_iii:
.LFB2116:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rax
	movslq	%r8d, %rdi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, -76(%rsp)
	movl	%edi, 32(%rsp)
	movl	%r9d, -100(%rsp)
	testl	%edi, %edi
	jle	.L173
	testl	%r9d, %r9d
	jle	.L173
	testl	%ecx, %ecx
	jle	.L173
	movq	%rsi, %r15
	movl	%edi, %esi
	sall	$6, %esi
	movl	%esi, -104(%rsp)
	movq	%rdx, %r14
	movslq	%esi, %rsi
	movslq	%r9d, %rdx
	movq	%rdi, 8(%rsp)
	addq	$4, %rax
	salq	$2, %rdi
	kmovq	%rsi, %k0
	leaq	0(,%rdx,4), %rsi
	movq	%rsi, -64(%rsp)
	movq	%rdi, (%rsp)
	movq	$0, -48(%rsp)
	movq	$0, -32(%rsp)
	movq	%rax, -120(%rsp)
.L141:
	movq	-32(%rsp), %rbx
	movl	32(%rsp), %edi
	movl	%ebx, %eax
	addl	$64, %eax
	cmpl	%edi, %eax
	cmovg	%edi, %eax
	movl	%ebx, -80(%rsp)
	movl	%eax, %r12d
	subl	%ebx, %eax
	leal	-1(%rax), %edi
	movl	%eax, -4(%rsp)
	movl	%edi, 36(%rsp)
	movl	%eax, %edi
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r13
	movl	%edi, %eax
	andl	$-8, %edi
	subl	%edi, %eax
	movl	%edi, %esi
	movl	%eax, -20(%rsp)
	addl	%ebx, %esi
	decl	%eax
	movl	%ebx, -108(%rsp)
	movl	%edi, -12(%rsp)
	movl	%esi, -16(%rsp)
	movq	%rbx, -56(%rsp)
	movq	$0, -96(%rsp)
	movl	$0, -40(%rsp)
	movl	%eax, -24(%rsp)
.L158:
	movq	-96(%rsp), %rdi
	movl	-100(%rsp), %esi
	movl	%edi, %eax
	addl	$64, %eax
	cmpl	%esi, %eax
	cmovg	%esi, %eax
	movl	%edi, %edx
	cmpl	%edi, %eax
	jle	.L142
	cmpl	-108(%rsp), %r12d
	jle	.L142
	subl	%edx, %eax
	decl	%eax
	leaq	(%rax,%rdi), %rdx
	movq	-120(%rsp), %rdi
	notq	%rax
	leaq	(%rdi,%rdx,4), %rdi
	movq	%rdi, 16(%rsp)
	movq	-56(%rsp), %rdi
	salq	$2, %rax
	leaq	(%r15,%rdi,4), %rdi
	movq	%rdi, -72(%rsp)
	movl	$0, -8(%rsp)
	movl	$0, -36(%rsp)
	movq	%rax, -88(%rsp)
	.p2align 4,,10
	.p2align 3
.L146:
	movslq	-8(%rsp), %rdx
	movq	-32(%rsp), %rax
	movq	-88(%rsp), %rdi
	addq	%rdx, %rax
	movq	-56(%rsp), %r11
	movl	-40(%rsp), %r10d
	movq	-72(%rsp), %rsi
	movq	%rax, 24(%rsp)
	addq	16(%rsp), %rdi
	leaq	(%r14,%rax,4), %rax
	leaq	(%r14,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L150:
	leaq	4(%rsi), %rcx
	movq	%rax, %rdx
	subq	%rcx, %rdx
	vmovss	(%rdi), %xmm1
	cmpq	$24, %rdx
	jbe	.L161
	cmpl	$2, 36(%rsp)
	jbe	.L161
	cmpl	$6, 36(%rsp)
	jbe	.L159
	vbroadcastss	%xmm1, %ymm2
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L148:
	vmovups	(%rsi,%rdx), %ymm0
	vfmadd213ps	(%rax,%rdx), %ymm2, %ymm0
	vmovups	%ymm0, (%rax,%rdx)
	addq	$32, %rdx
	cmpq	%r13, %rdx
	jne	.L148
	movl	-12(%rsp), %ecx
	cmpl	%ecx, -4(%rsp)
	je	.L155
	cmpl	$2, -24(%rsp)
	movl	-20(%rsp), %ebx
	movl	-16(%rsp), %edx
	jbe	.L153
.L147:
	movq	24(%rsp), %r8
	vbroadcastss	%xmm1, %xmm0
	addq	%rcx, %r8
	leaq	(%r14,%r8,4), %r8
	vmovups	(%r8), %xmm3
	addq	%r11, %rcx
	vfmadd132ps	(%r15,%rcx,4), %xmm3, %xmm0
	movl	%ebx, %ecx
	andl	$-4, %ecx
	addl	%ecx, %edx
	vmovups	%xmm0, (%r8)
	cmpl	%ecx, %ebx
	je	.L155
.L153:
	movl	-8(%rsp), %ebx
	leal	(%rbx,%rdx), %ecx
	movslq	%ecx, %rcx
	leaq	(%r14,%rcx,4), %r8
	leal	(%r10,%rdx), %ecx
	movslq	%ecx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	leal	1(%rdx), %ecx
	vfmadd213ss	(%r8), %xmm1, %xmm0
	vmovss	%xmm0, (%r8)
	cmpl	%r12d, %ecx
	jge	.L155
	leal	(%rbx,%rcx), %r8d
	addl	%r10d, %ecx
	movslq	%ecx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	movslq	%r8d, %r8
	leaq	(%r14,%r8,4), %r8
	vfmadd213ss	(%r8), %xmm1, %xmm0
	addl	$2, %edx
	vmovss	%xmm0, (%r8)
	cmpl	%r12d, %edx
	jge	.L155
	leal	(%rbx,%rdx), %ecx
	movslq	%ecx, %rcx
	leaq	(%r14,%rcx,4), %rcx
	vmovss	(%rcx), %xmm4
	addl	%r10d, %edx
	movslq	%edx, %rdx
	vfmadd132ss	(%r15,%rdx,4), %xmm4, %xmm1
	vmovss	%xmm1, (%rcx)
.L155:
	addq	$4, %rdi
	addq	(%rsp), %rsi
	addl	32(%rsp), %r10d
	addq	8(%rsp), %r11
	cmpq	16(%rsp), %rdi
	jne	.L150
	incl	-36(%rsp)
	movq	-64(%rsp), %rsi
	addq	%rsi, 16(%rsp)
	movl	-36(%rsp), %eax
	movl	32(%rsp), %esi
	addl	%esi, -8(%rsp)
	cmpl	%eax, -76(%rsp)
	jne	.L146
.L142:
	addq	$64, -96(%rsp)
	movl	-104(%rsp), %edi
	addl	%edi, -40(%rsp)
	movq	-96(%rsp), %rax
	kmovq	%k0, %rdi
	addq	%rdi, -56(%rsp)
	cmpl	%eax, -100(%rsp)
	jg	.L158
	addq	$64, -32(%rsp)
	subq	$256, -48(%rsp)
	movq	-32(%rsp), %rax
	cmpl	%eax, 32(%rsp)
	jg	.L141
	vzeroupper
.L173:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	.cfi_restore_state
	movq	-48(%rsp), %rbx
	movq	-32(%rsp), %rdx
	leaq	(%rsi,%rbx), %rcx
	.p2align 4,,10
	.p2align 3
.L145:
	vmovss	(%rcx,%rdx,4), %xmm0
	vfmadd213ss	(%r9,%rdx,4), %xmm1, %xmm0
	vmovss	%xmm0, (%r9,%rdx,4)
	incq	%rdx
	cmpl	%edx, %r12d
	jg	.L145
	jmp	.L155
.L159:
	movl	-4(%rsp), %ebx
	movl	-80(%rsp), %edx
	xorl	%ecx, %ecx
	jmp	.L147
	.cfi_endproc
.LFE2116:
	.size	_Z11gemm_cpu_o2PfS_S_iii, .-_Z11gemm_cpu_o2PfS_S_iii
	.p2align 4
	.globl	_Z11gemm_cpu_o3PfS_S_iii
	.type	_Z11gemm_cpu_o3PfS_S_iii, @function
_Z11gemm_cpu_o3PfS_S_iii:
.LFB2117:
	.cfi_startproc
	endbr64
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movl	%r8d, 12(%rsp)
	movl	%r9d, 8(%rsp)
	vmovq	%rdi, %xmm1
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rax
	vmovdqa	%xmm0, 16(%rsp)
	vmovq	%rax, %xmm0
	leaq	8(%rsp), %rax
	vpinsrq	$1, %rax, %xmm0, %xmm0
	movl	%ecx, 56(%rsp)
	movq	%rdx, 32(%rsp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	16(%rsp), %rsi
	leaq	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0(%rip), %rdi
	vmovdqu	%xmm0, 40(%rsp)
	call	GOMP_parallel@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L179
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L179:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2117:
	.size	_Z11gemm_cpu_o3PfS_S_iii, .-_Z11gemm_cpu_o3PfS_S_iii
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Usage: mp1 <M> <N> <K>"
.LC8:
	.string	"checking "
.LC9:
	.string	"gemm_cpu_o0"
.LC10:
	.string	": check ref failed!"
.LC11:
	.string	"gemm_cpu_o1"
.LC12:
	.string	"gemm_cpu_o2"
.LC13:
	.string	"gemm_cpu_o3"
.LC15:
	.string	"Time taken for GEMM (CPU,"
.LC16:
	.string	"): "
.LC18:
	.string	"ms"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB19:
	.section	.text.startup,"ax",@progbits
.LHOTB19:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2118:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	leaq	-232(%rbp), %rdx
	vmovq	%rdx, %xmm2
	pushq	%r14
	leaq	-240(%rbp), %rdx
	vmovq	%rdx, %xmm4
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	leaq	-176(%rbp), %r15
	vmovq	%r15, %xmm6
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$384, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-228(%rbp), %rax
	vpinsrq	$1, %rax, %xmm2, %xmm1
	leaq	-236(%rbp), %rax
	vpinsrq	$1, %rax, %xmm4, %xmm3
	leaq	-128(%rbp), %rax
	vpinsrq	$1, %rax, %xmm6, %xmm5
	movq	%rax, -304(%rbp)
	vmovdqa	%xmm1, -336(%rbp)
	vmovdqa	%xmm3, -384(%rbp)
	vmovdqa	%xmm5, -400(%rbp)
	cmpl	$2, %edi
	jg	.L181
	leaq	_ZSt4cout(%rip), %r12
	movl	$22, %edx
	leaq	.LC3(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$1, %eax
.L180:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L208
	addq	$384, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L181:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r14
	movq	%rax, -368(%rbp)
	movl	%eax, -276(%rbp)
	call	strtol@PLT
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, -296(%rbp)
	movl	%eax, -284(%rbp)
	movl	%r14d, %ebx
	call	strtol@PLT
	imull	%eax, %ebx
	movq	%rax, -312(%rbp)
	movl	%eax, -288(%rbp)
	movslq	%ebx, %r12
	movabsq	$2305843009213693950, %rax
	cmpq	%rax, %r12
	ja	.L183
	leaq	0(,%r12,4), %r13
	movq	%r13, %rdi
	call	_Znam@PLT
	movq	%rax, -264(%rbp)
	testq	%r12, %r12
	je	.L185
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	xorl	%esi, %esi
	call	memset@PLT
.L185:
	movl	-312(%rbp), %r12d
	movabsq	$2305843009213693950, %rax
	imull	-296(%rbp), %r12d
	movslq	%r12d, %r13
	cmpq	%rax, %r13
	ja	.L183
	leaq	0(,%r13,4), %r14
	movq	%r14, %rdi
	call	_Znam@PLT
	vmovq	-264(%rbp), %xmm7
	movq	%rax, -272(%rbp)
	vpinsrq	$1, %rax, %xmm7, %xmm7
	movq	%rax, %rdi
	vmovdqa	%xmm7, -416(%rbp)
	testq	%r13, %r13
	je	.L186
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
.L186:
	movl	-368(%rbp), %eax
	imull	-296(%rbp), %eax
	movl	%eax, -280(%rbp)
	movslq	%eax, %r14
	movabsq	$2305843009213693950, %rax
	cmpq	%rax, %r14
	ja	.L183
	leaq	0(,%r14,4), %rdx
	movq	%rdx, %rdi
	movq	%rdx, -424(%rbp)
	call	_Znam@PLT
	movq	%rax, %r13
	testq	%r14, %r14
	je	.L187
	movq	-424(%rbp), %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L187:
	movq	-264(%rbp), %rax
	movl	%ebx, -216(%rbp)
	leaq	_Z10fillRandomPfi._omp_fn.0(%rip), %r14
	leaq	-224(%rbp), %rbx
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movq	%rax, -224(%rbp)
	call	GOMP_parallel@PLT
	movq	-272(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	%r12d, -216(%rbp)
	movq	%rax, -224(%rbp)
	call	GOMP_parallel@PLT
	movl	$32, %edi
	call	_Znam@PLT
	movq	%rax, %r14
	movq	%r14, %rdi
	xorl	%eax, %eax
	movl	$8, %ecx
	rep stosl
	vmovaps	.LC4(%rip), %ymm0
	movq	.LC7(%rip), %rax
	vmovaps	%ymm0, -176(%rbp)
	vmovaps	.LC5(%rip), %ymm0
	leaq	_ZSt4cout(%rip), %r12
	vmovaps	%ymm0, -144(%rbp)
	vmovaps	.LC6(%rip), %ymm0
	movl	$9, %edx
	leaq	.LC8(%rip), %rsi
	movq	%r12, %rdi
	movq	%rax, -80(%rbp)
	vmovaps	%ymm0, -112(%rbp)
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC9(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	$8, -216(%rbp)
	movq	%r14, -224(%rbp)
	call	GOMP_parallel@PLT
	movq	-304(%rbp), %rsi
	movq	%r15, %rdi
	movl	$3, %r9d
	movl	$2, %r8d
	movl	$4, %ecx
	movq	%r14, %rdx
	call	_Z11gemm_cpu_o0PfS_S_iii
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	_ZN3Ref8checkRefEPf
	testb	%al, %al
	je	.L209
.L188:
	movl	$9, %edx
	leaq	.LC8(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC11(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	$8, -216(%rbp)
	movq	%r14, -224(%rbp)
	call	GOMP_parallel@PLT
	movq	-304(%rbp), %rsi
	movq	%r15, %rdi
	movl	$3, %r9d
	movl	$2, %r8d
	movl	$4, %ecx
	movq	%r14, %rdx
	call	_Z11gemm_cpu_o1PfS_S_iii
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	_ZN3Ref8checkRefEPf
	testb	%al, %al
	je	.L210
.L189:
	movl	$9, %edx
	leaq	.LC8(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC12(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	$8, -216(%rbp)
	movq	%r14, -224(%rbp)
	call	GOMP_parallel@PLT
	movq	-304(%rbp), %rsi
	movq	%r15, %rdi
	movl	$3, %r9d
	movl	$2, %r8d
	movl	$4, %ecx
	movq	%r14, %rdx
	call	_Z11gemm_cpu_o2PfS_S_iii
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	_ZN3Ref8checkRefEPf
	testb	%al, %al
	je	.L211
.L190:
	movl	$9, %edx
	leaq	.LC8(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC13(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	$8, -216(%rbp)
	movq	%r14, -224(%rbp)
	call	GOMP_parallel@PLT
	vmovdqa	-400(%rbp), %xmm3
	leaq	-248(%rbp), %rax
	movq	%rax, -200(%rbp)
	xorl	%ecx, %ecx
	leaq	-244(%rbp), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0(%rip), %rdi
	movl	$2, -248(%rbp)
	movl	$3, -244(%rbp)
	movl	$4, -184(%rbp)
	movq	%r14, -208(%rbp)
	movq	%rax, -192(%rbp)
	vmovdqa	%xmm3, -224(%rbp)
	call	GOMP_parallel@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	_ZN3Ref8checkRefEPf
	testb	%al, %al
	je	.L212
.L191:
	movq	%r14, %rdi
	call	_ZdaPv@PLT
	movl	-312(%rbp), %r9d
	movl	-296(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	call	_Z11gemm_cpu_o0PfS_S_iii
	movl	$2, %r15d
.L192:
	movl	-280(%rbp), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	%eax, -216(%rbp)
	movq	%r13, -224(%rbp)
	call	GOMP_parallel@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	-288(%rbp), %r9d
	movl	-284(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	movq	%rax, %r14
	call	_Z11gemm_cpu_o0PfS_S_iii
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	decl	%r15d
	vdivsd	.LC14(%rip), %xmm0, %xmm0
	vaddsd	-320(%rbp), %xmm0, %xmm7
	vmovsd	%xmm7, -320(%rbp)
	jne	.L197
	movl	$25, %edx
	leaq	.LC15(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC9(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	.LC17(%rip), %xmm3
	movq	%r12, %rdi
	vmulsd	-320(%rbp), %xmm3, %xmm0
	movl	$2, %r15d
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r14
	movl	$2, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r14, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	-312(%rbp), %r9d
	movl	-296(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	call	_Z11gemm_cpu_o1PfS_S_iii
.L193:
	movl	-280(%rbp), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	%eax, -216(%rbp)
	movq	%r13, -224(%rbp)
	call	GOMP_parallel@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	-288(%rbp), %r9d
	movl	-284(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	movq	%rax, %r14
	call	_Z11gemm_cpu_o1PfS_S_iii
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	decl	%r15d
	vdivsd	.LC14(%rip), %xmm0, %xmm0
	vaddsd	-344(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, -344(%rbp)
	jne	.L198
	movl	$25, %edx
	leaq	.LC15(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC11(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	.LC17(%rip), %xmm7
	movq	%r12, %rdi
	vmulsd	-344(%rbp), %xmm7, %xmm0
	movl	$2, %r15d
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r14
	movl	$2, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r14, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	-312(%rbp), %r9d
	movl	-296(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	call	_Z11gemm_cpu_o2PfS_S_iii
.L194:
	movl	-280(%rbp), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	%eax, -216(%rbp)
	movq	%r13, -224(%rbp)
	call	GOMP_parallel@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	-288(%rbp), %r9d
	movl	-284(%rbp), %r8d
	movl	-276(%rbp), %ecx
	movq	-272(%rbp), %rsi
	movq	-264(%rbp), %rdi
	movq	%r13, %rdx
	movq	%rax, %r14
	call	_Z11gemm_cpu_o2PfS_S_iii
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	decl	%r15d
	vdivsd	.LC14(%rip), %xmm0, %xmm0
	vaddsd	-352(%rbp), %xmm0, %xmm2
	vmovsd	%xmm2, -352(%rbp)
	jne	.L199
	movl	$25, %edx
	leaq	.LC15(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$11, %edx
	leaq	.LC12(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	.LC17(%rip), %xmm4
	movq	%r12, %rdi
	vmulsd	-352(%rbp), %xmm4, %xmm0
	movl	$2, %r15d
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r14
	movl	$2, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r14, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	-296(%rbp), %eax
	vmovdqa	-416(%rbp), %xmm5
	movl	%eax, -240(%rbp)
	movl	-312(%rbp), %eax
	vmovdqa	-384(%rbp), %xmm6
	movl	%eax, -236(%rbp)
	movl	-368(%rbp), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0(%rip), %rdi
	movl	%eax, -184(%rbp)
	movq	%r13, -208(%rbp)
	vmovdqa	%xmm5, -224(%rbp)
	vmovdqu	%xmm6, -200(%rbp)
	call	GOMP_parallel@PLT
.L195:
	movl	-280(%rbp), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	_Z10initializePfi._omp_fn.0(%rip), %rdi
	movl	%eax, -216(%rbp)
	movq	%r13, -224(%rbp)
	call	GOMP_parallel@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r14
	movl	-284(%rbp), %eax
	movq	-264(%rbp), %rcx
	movl	%eax, -232(%rbp)
	movl	-288(%rbp), %eax
	vmovdqa	-336(%rbp), %xmm6
	movl	%eax, -228(%rbp)
	movl	-276(%rbp), %eax
	xorl	%edx, %edx
	movl	%eax, -184(%rbp)
	movq	-272(%rbp), %rax
	movq	%rcx, -224(%rbp)
	movq	%rbx, %rsi
	xorl	%ecx, %ecx
	leaq	_Z11gemm_cpu_o3PfS_S_iii._omp_fn.0(%rip), %rdi
	movq	%rax, -216(%rbp)
	vmovdqu	%xmm6, -200(%rbp)
	movq	%r13, -208(%rbp)
	call	GOMP_parallel@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r14, %rax
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm1, %xmm0
	decl	%r15d
	vdivsd	.LC14(%rip), %xmm0, %xmm0
	vaddsd	-360(%rbp), %xmm0, %xmm3
	vmovsd	%xmm3, -360(%rbp)
	jne	.L200
	movq	%r12, %rdi
	movl	$25, %edx
	leaq	.LC15(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	movl	$11, %edx
	leaq	.LC13(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$3, %edx
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	.LC17(%rip), %xmm7
	movq	%r12, %rdi
	vmulsd	-360(%rbp), %xmm7, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %r12
	movl	$2, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movq	-264(%rbp), %rdi
	call	_ZdaPv@PLT
	movq	-272(%rbp), %rdi
	call	_ZdaPv@PLT
	movq	%r13, %rdi
	call	_ZdaPv@PLT
	xorl	%eax, %eax
	jmp	.L180
.L197:
	movl	$1, %r15d
	jmp	.L192
.L200:
	movl	$1, %r15d
	jmp	.L195
.L199:
	movl	$1, %r15d
	jmp	.L194
.L198:
	movl	$1, %r15d
	jmp	.L193
.L209:
	movl	$11, %edx
	leaq	.LC9(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$19, %edx
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L188
.L212:
	leaq	_ZSt4cerr(%rip), %r15
	movq	%r15, %rdi
	movl	$11, %edx
	leaq	.LC13(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rdi
	movl	$19, %edx
	leaq	.LC10(%rip), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L191
.L211:
	movl	$11, %edx
	leaq	.LC12(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$19, %edx
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L190
.L210:
	movl	$11, %edx
	leaq	.LC11(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$19, %edx
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L189
.L208:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB2118:
.L183:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE2118:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE19:
	.section	.text.startup
.LHOTE19:
	.p2align 4
	.type	_GLOBAL__sub_I__Z10fillRandomPfi, @function
_GLOBAL__sub_I__Z10fillRandomPfi:
.LFB2659:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbp, %rsi
	leaq	__dso_handle(%rip), %rdx
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2659:
	.size	_GLOBAL__sub_I__Z10fillRandomPfi, .-_GLOBAL__sub_I__Z10fillRandomPfi
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10fillRandomPfi
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC4:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.long	1084227584
	.long	1086324736
	.long	1088421888
	.long	1090519040
	.align 32
.LC5:
	.long	1091567616
	.long	1092616192
	.long	1093664768
	.long	1094713344
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.align 32
.LC6:
	.long	1084227584
	.long	1086324736
	.long	1102053376
	.long	1105199104
	.long	1111752704
	.long	1115684864
	.long	1117257728
	.long	1120403456
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	1120796672
	.long	1124597760
	.align 8
.LC14:
	.long	0
	.long	1093567616
	.align 8
.LC17:
	.long	0
	.long	1071644672
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
