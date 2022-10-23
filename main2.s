	.file	"main2.c"
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
fill:							# функция fill - принимает на вход два параметра - размер массива а и максимальный элемент в нем, заполняет массив b согласно условию
	endbr64
	push	rbp					# добавление регистра, выделение 
	mov	rbp, rsp				# места для параметров и локальных переменных функции
	mov	DWORD PTR -20[rbp], edi			# передача размера массива (int n). Этот параметр из регистра edi копируется в регистр rbp (который сейчас на вершине стека)
	mov	DWORD PTR -24[rbp], esi			# передача макс. элемента (int mx). Этот параметр из регистра esi копируется в регистр rbp (который, опять же, на вершине стека)
	mov	DWORD PTR -4[rbp], 0			# i = 0, начало цикла
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, b[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jns	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, b[rip]
	mov	eax, DWORD PTR -24[rbp]
	mov	DWORD PTR [rcx+rdx], eax
.L3:
	add	DWORD PTR -4[rbp], 1			# ++i (внутри цикла)
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]			# проверка i < n (внутри цикла)
	jl	.L4
	nop
	nop
	pop	rbp					# освобождение места после выполнения функции
	ret						# выход из функции fill
	.size	fill, .-fill
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:						# функция print_array - печатает через пробел все элементы массива b. принимает на вход только размер массива n
	endbr64
	push	rbp					# добавление регистра, выделение 
	mov	rbp, rsp				# места для параметров и локальных переменных функции
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi			# передача размера массива b (int n). В основной программе это параметр sz, который хранится в регистре edi, откуда в свою очередь копируется в регистр rbp (который на вершине стека)
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L7
	mov	edi, 10
	call	putchar@PLT
	nop
	leave						# освобождение выделенного места
	ret						# выход из функции
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
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 1000000
	jg	.L9
	cmp	DWORD PTR -20[rbp], 1
	jne	.L10
.L9:
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	mov	DWORD PTR -12[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, a[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	DWORD PTR -8[rbp], eax
	jge	.L13
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	DWORD PTR -8[rbp], eax
.L13:
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jl	.L14
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -12[rbp]
	mov	esi, edx
	mov	edi, eax
	call	fill
	mov	eax, DWORD PTR -12[rbp]
	mov	edi, eax
	call	print_array
	mov	eax, 0
.L11:
	leave
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
