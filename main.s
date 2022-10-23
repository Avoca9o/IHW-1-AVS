	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 3999996
a:							# массив a
	.zero	3999996
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 3999996
b:							# массив b
	.zero	3999996
	.section	.rodata
	.align 8
.LC0:
	.string	"not enough space or empty array"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 999999		# проверяет argc >= 1000000
	jg	.L2
	cmp	DWORD PTR -20[rbp], 0			# проверяет argc == 0
	jne	.L3
.L2:
	lea	rax, .LC0[rip]				# печатает "not enougn space or empty array"
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0					# return 0
	jmp	.L4
.L3:
	mov	DWORD PTR -12[rbp], 0			# int i = 0
	mov	rax, QWORD PTR -32[rbp]			# int mx = atoi(argv[0]) (50-52)
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -20[rbp]			# int sz = argc - 1;
	sub	eax, 1
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -12[rbp], 0			# i = 0, начало цикла
	jmp	.L5
.L7:
	mov	eax, DWORD PTR -12[rbp]			# a[i] = atoi(argv[i + 1]);
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, a[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	DWORD PTR -8[rbp], eax			# проверяет a[i] > mx
	jge	.L6
	mov	eax, DWORD PTR -12[rbp]			# mx = a[i];
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	DWORD PTR -8[rbp], eax
.L6:
	add	DWORD PTR -12[rbp], 1
.L5:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -4[rbp]			# првоерка i < sz
	jl	.L7
	mov	DWORD PTR -12[rbp], 0			# i = 0
	jmp	.L8					# ++i
.L10:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -12[rbp]			# b[i] = a[i]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, b[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax				# проверка b[i] < 0
	jns	.L9
	mov	eax, DWORD PTR -12[rbp]			# b[i] = mx
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, b[rip]
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR [rcx+rdx], eax
.L9:
	add	DWORD PTR -12[rbp], 1
.L8:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L10
	mov	DWORD PTR -12[rbp], 0			# i = 0, начало цикла
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -12[rbp]			# printf("%d ", b[i]);
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1
.L11:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L12
	mov	edi, 10
	call	putchar@PLT				# printf("\n");
	mov	eax, 0
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
