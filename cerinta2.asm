.data
	instructiune: .space 200
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%d\n"
	delimitator: .asciz " \n"
	res: .space 4
	atoiRes: .long 0
	result: .space 4
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
.text

.global main

main:

	//citire
	pushl $instructiune
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	// strtok( instructiune, " ")
	pushl $delimitator
	pushl $instructiune
	call strtok
	popl %ebx
	popl %ebx
	
	//atoi
	pushl %eax
	call atoi
	popl %ebx
	
	//punem primul nr pe stiva
	pushl %eax
	
loop:
	//strtok(NULL, " ")
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	
	//if res == NULL go to exit
	cmp $0, %eax
	je exit
	movl %eax, res
	
	// atoi(res)
	pushl res
	call atoi
	popl %ebx
	
	movl %eax, atoiRes
	
	xorl %ecx, %ecx
	
	//if atoiRes == 0 => operatie
	//else nr_intreg
	cmp $0, atoiRes
	je operatie
	jmp nr_intreg
	
nr_intreg:
	pushl atoiRes
	jmp loop

operatie:
	//strcmp(sir1,sir2)
	pushl res
	pushl $add
	call strcmp
	popl %ebx
	popl %ebx
		
	cmp $0, %eax
	je et_add

	pushl res
	pushl $sub
	call strcmp
	popl %ebx
	popl %ebx
		
	cmp $0, %eax
	je et_sub
	
	pushl res
	pushl $mul
	call strcmp
	popl %ebx
	popl %ebx
		
	cmp $0, %eax
	je et_mul
	
	pushl res
	pushl $div
	call strcmp
	popl %ebx
	popl %ebx
		
	cmp $0, %eax
	je et_div
	
		
et_add:
//suma ultimelor 2 nr din stiva
	popl %eax
	popl %ebx
	addl %ebx, %eax
	pushl %eax
	jmp loop
	
et_div:
//impartirea ultimelor 2 nr din stiva
	xorl %edx, %edx
	popl %ebx
	popl %eax
	divl %ebx
	pushl %eax
	jmp loop

et_mul:
//produsul ultimelor 2 nr din stiva
	popl %eax
	popl %ebx
	mull %ebx
	pushl %eax
	jmp loop

et_sub:
//diferenta ultimelor 2 nr din stiva
	popl %ebx
	popl %eax
	subl %ebx, %eax
	pushl %eax
	jmp loop
	
exit:

	popl %eax

	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	pushl $0
	call fflush
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80






