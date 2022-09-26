.data
	sirb16: .space 100
	sirb2: .space 400
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s"
	formatPrintf2: .asciz "%d "
	formatPrintf3: .asciz "%c "
	formatPrintn: .asciz "\n"
	numar: .long 0
	var: .long 0
	letmessage: .asciz "let "
	addmessage: .asciz "add "
	submessage: .asciz "sub "
	divmessage: .asciz "div "
	mulmessage: .asciz "mul "
	minus: .asciz "-"
	indexSb2: .long 0
	indexinstr: .long 0
.text

.global main

main:
	//citire sirul initial in baza 16
	pushl $sirb16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $sirb16, %edi
	movl $sirb2, %esi
	xorl %ecx, %ecx

et_for:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je transl2
	
	cmp $48, %al
	je cifra0
	cmp $49, %al
	je cifra1
	cmp $50, %al
	je cifra2
	cmp $51, %al
	je cifra3
	cmp $52, %al
	je cifra4
	cmp $53, %al
	je cifra5
	cmp $54, %al
	je cifra6
	cmp $55, %al
	je cifra7
	cmp $56, %al
	je cifra8
	cmp $57, %al
	je cifra9
	cmp $65, %al
	je cifraA
	cmp $66, %al
	je cifraB
	cmp $67, %al
	je cifraC
	cmp $68, %al
	je cifraD
	cmp $69, %al
	je cifraE
	cmp $70, %al
	je cifraF
	
cont:
	incl %ecx
	jmp et_for
	
cifra0:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont

cifra1:
//1-0001
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra2:
//2-0010
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra3:
//3-0011
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont	
	
cifra4:
//4-0100
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra5:
//5-0101
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra6:
//6-0110
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra7:
//7-0111
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra8:
//8-1000
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifra9:
//9-1001
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraA:
//A-1010
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraB:
//B-1011
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraC:
//C-1100
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraD:
//D-1101
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraE:
//E-1110
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cifraF:
//F-1111
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont



transl2:	
	movl $sirb2, %edi
	xorl %ecx, %ecx
	movl %ecx, indexinstr

et_for2:
	movl indexinstr, %ecx
	movb (%edi, %ecx,1), %al
	cmp $0, %al
	je exit

	xorl %edx, %edx
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je operatie
	jmp intreg_variabila
	
intreg_variabila:
	incl %ecx
	movl $0, var
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je variabila
	jmp intreg

variabila:
	movl $1, var
	jmp intreg

intreg:	
	movl $0, numar
	addl $1, %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je negativ
	jmp pozitiv
	
negativ:
	pushl %ecx
		
	pushl $minus
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	jmp pozitiv

pozitiv:	
	addl $1, %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_128
	jmp bit5
	
add_128:
	addl $128, numar
	jmp bit5
		
bit5:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_64
	jmp bit6

add_64:
	addl $64, numar
	jmp bit6
	
bit6:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_32
	jmp bit7

add_32:
	addl $32, numar
	jmp bit7
	
bit7:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_16
	jmp bit8

add_16:
	addl $16, numar
	jmp bit8

bit8:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_8
	jmp bit9

add_8:
	addl $8, numar
	jmp bit9
	
bit9:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_4
	jmp bit10

add_4:
	addl $4, numar
	jmp bit10
	

bit10:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_2
	jmp bit11

add_2:
	addl $2, numar
	jmp bit11
	
bit11:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $49, %al
	je add_1
	jmp cont2

add_1:
	addl $1, numar
	jmp cont2
	
cont2:	
	cmp $1, var
	je printc

	pushl numar
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	
	jmp et_for2
	
printc:
	pushl numar
	pushl $formatPrintf3
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	
	jmp et_for2
	
operatie:
	addl $8, %ecx
	movb (%edi, %ecx,1), %al
	cmp $48, %al
	je let_add_sub_mul
	jmp div	
div:
	//printf
	pushl $divmessage
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	addl $12, indexinstr
	jmp et_for2

let_add_sub_mul:
	incl %ecx
	movb (%edi, %ecx, 1), %al
	cmp $48, %al
	je let_add
	jmp sub_mul

sub_mul:
	incl %ecx
	movb (%edi, %ecx,1), %al
	cmp $48, %al
	je sub
	jmp mul

let_add:
	incl %ecx
	movb (%edi, %ecx, 1), %al
	cmp $48, %al
	je let
	jmp add

sub:
	//printf
	pushl $submessage
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	jmp et_for2

mul:
	//printf
	pushl $mulmessage
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	jmp et_for2

let:
	//printf
	pushl $letmessage
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	jmp et_for2

add:
	//printf
	pushl $addmessage
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	addl $12, indexinstr
	jmp et_for2		
					
exit:
	pushl $0
	call fflush
	popl %ebx
	
	pushl $formatPrintn
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
