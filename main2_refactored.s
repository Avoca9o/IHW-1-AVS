	.file	"main2_copy.c"
	.intel_syntax noprefix
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 3999996
a:
	.zero	3999996
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 3999996
b:
	.zero	3999996
	.text
	.globl	fill
	.type	fill, @function
fill:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx					# использование регистра процессора rbx
	mov	edx, edi
	mov	eax, esi
	mov	ebx, 0
	jmp	.L2
.L4:
	movsx	rcx, ebx
	lea	rsi, 0[0+rcx*4]
	lea	rcx, a[rip]
	mov	ecx, DWORD PTR [rsi+rcx]
	movsx	rsi, ebx
	lea	rdi, 0[0+rsi*4]
	lea	rsi, b[rip]
	mov	DWORD PTR [rdi+rsi], ecx
	movsx	rcx, ebx
	lea	rsi, 0[0+rcx*4]
	lea	rcx, b[rip]
	mov	ecx, DWORD PTR [rsi+rcx]
	test	ecx, ecx
	jns	.L3
	movsx	rcx, ebx
	lea	rsi, 0[0+rcx*4]
	lea	rcx, b[rip]
	mov	DWORD PTR [rsi+rcx], eax
.L3:
	add	ebx, 1
.L2:
	cmp	ebx, edx
	jl	.L4
	nop
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	fill, .-fill
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r12					# использование регистра процессора r12
	push	rbx					# использование регистра процессора rbx
	mov	r12d, edi
	mov	ebx, 0
	jmp	.L6
.L7:
	movsx	rax, ebx
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	ebx, 1
.L6:
	cmp	ebx, r12d
	jl	.L7
	mov	edi, 10
	call	putchar@PLT
	nop
	pop	rbx					# освобождение регистра процессора
	pop	r12					# освобождение регистра процессора
	pop	rbp
	ret
	.size	print_array, .-print_array
	.section	.rodata
	.align 8
.LC1:
	.string	"not enough space or empty array"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r13					# использование регистра процессора r13
	push	r12					# использование регистра процессора r12
	push	rbx					# использование регистра процессора rbx
	sub	rsp, 24
	mov	r13d, edi
	mov	QWORD PTR -40[rbp], rsi
	cmp	r13d, 1000000
	jg	.L9
	cmp	r13d, 1
	jne	.L10
.L9:
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	r12d, eax
	sub	r13d, 1
	mov	ebx, 0
	jmp	.L12
.L14:
	movsx	rax, ebx
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	movsx	rdx, ebx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, a[rip]
	mov	DWORD PTR [rcx+rdx], eax
	movsx	rax, ebx
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	r12d, eax
	jge	.L13
	movsx	rax, ebx
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	r12d, DWORD PTR [rdx+rax]
.L13:
	add	ebx, 1
.L12:
	cmp	ebx, r13d
	jl	.L14
	mov	esi, r12d
	mov	edi, r13d
	call	fill
	mov	edi, r13d
	call	print_array
	mov	eax, 0
.L11:
	add	rsp, 24
	pop	rbx					# освобождение регистра процессора
	pop	r12					# освобождение регистра процессора
	pop	r13					# освобождение регистра процессора
	pop	rbp
	ret
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
