.data
	instructiune: .space 200
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%d\n"
	delimitator: .asciz " \n"
	res: .space 4
	atoiRes: .long 0
	len: .space 4
	result: .space 4
	
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	let: .asciz "let"

	a: .asciz "a"
	b: .asciz "b"
	c: .asciz "c"
	d: .asciz "d"
	e: .asciz "e"
	f: .asciz "f"
	g: .asciz "g"
	h: .asciz "h"
	i: .asciz "i"
	j: .asciz "j"
	k: .asciz "k"
	l: .asciz "l"
	m: .asciz "m"
	n: .asciz "n"
	o: .asciz "o"
	p: .asciz "p"
	q: .asciz "q"
	r: .asciz "r"
	s: .asciz "s"
	t: .asciz "t"
	u: .asciz "u"
	v: .asciz "v"
	w: .asciz "w"
	x: .asciz "x"
	y: .asciz "y"
	z: .asciz "z"

	cnt_a: .long 0
	cnt_b: .long 0
	cnt_c: .long 0
	cnt_d: .long 0
	cnt_e: .long 0
	cnt_f: .long 0
	cnt_g: .long 0
	cnt_h: .long 0
	cnt_i: .long 0
	cnt_j: .long 0
	cnt_k: .long 0
	cnt_l: .long 0
	cnt_m: .long 0
	cnt_n: .long 0
	cnt_o: .long 0
	cnt_p: .long 0
	cnt_q: .long 0
	cnt_r: .long 0
	cnt_s: .long 0
	cnt_t: .long 0
	cnt_u: .long 0
	cnt_v: .long 0
	cnt_w: .long 0
	cnt_x: .long 0
	cnt_y: .long 0
	cnt_z: .long 0

	val_a: .long 0
	val_b: .long 0
	val_c: .long 0
	val_d: .long 0
	val_e: .long 0
	val_f: .long 0
	val_g: .long 0
	val_h: .long 0
	val_i: .long 0
	val_j: .long 0
	val_k: .long 0
	val_l: .long 0
	val_m: .long 0
	val_n: .long 0
	val_o: .long 0
	val_p: .long 0
	val_q: .long 0
	val_r: .long 0
	val_s: .long 0
	val_t: .long 0
	val_u: .long 0
	val_v: .long 0
	val_w: .long 0
	val_x: .long 0
	val_y: .long 0
	val_z: .long 0
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
	
	
loop:
	movl %eax, res
	
	//if res == NULL go to exit
	cmp $0, res
	je exit
	
	// atoi(res)
	pushl res
	call atoi
	popl %ebx
	
	movl %eax, atoiRes
	
	xorl %ecx, %ecx
	
	//if atoiRes == 0 => operatie/variabila
	//else nr_intreg
	cmp $0, atoiRes
	je operatie_variabila
	jmp nr_intreg
	
cont:
	//strtok(NULL, " ")
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	jmp loop
	
nr_intreg:
	pushl atoiRes
	jmp cont

operatie_variabila:
	//strlen
	pushl res
	call strlen
	popl %ebx
	
	movl %eax, len
	
	cmp $1, len
	je variabila
	
	//strcmp(sir1,sir2)
	pushl res
	pushl $let
	call strcmp
	popl %ebx
	popl %ebx
		
	cmp $0, %eax
	je et_let
	
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

variabila:
	//verificam fiecare litera; strcmp (res, "a")
	pushl res
	pushl $a
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_a
	
	pushl res
	pushl $b
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_b
	
	pushl res
	pushl $c
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_c
	
	pushl res
	pushl $d
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_d
	
	pushl res
	pushl $e
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_e
	
	pushl res
	pushl $f
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_f
	
	pushl res
	pushl $g
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_g
	
	pushl res
	pushl $h
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_h
	
	pushl res
	pushl $i
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_i
	
	pushl res
	pushl $j
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_j
	
	pushl res
	pushl $k
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_k
	
	pushl res
	pushl $l
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_l
	
	pushl res
	pushl $m
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_m
	
	pushl res
	pushl $n
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_n
	
	pushl res
	pushl $o
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_o
	
	pushl res
	pushl $p
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_p
	
	pushl res
	pushl $q
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_q
	
	pushl res
	pushl $r
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_r
	
	pushl res
	pushl $s
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_s
	
	pushl res
	pushl $t
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_t
	
	pushl res
	pushl $u
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_u
	
	pushl res
	pushl $v
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_v
	
	pushl res
	pushl $w
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_w
	
	pushl res
	pushl $x
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_x
	
	pushl res
	pushl $y
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_y
	
	pushl res
	pushl $z
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je semnalizat_z
	
semnalizat_a:
	addl $1, cnt_a
	cmp $2, cnt_a
	jge valoare_a
	jmp cont
	
semnalizat_b:
	addl $1, cnt_b
	cmp $2, cnt_b
	jge valoare_b
	jmp cont
	
semnalizat_c:
	addl $1, cnt_c
	cmp $2, cnt_c
	jge valoare_c
	jmp cont
	
semnalizat_d:
	addl $1, cnt_d
	cmp $2, cnt_d
	jge valoare_d
	jmp cont
	
semnalizat_e:
	addl $1, cnt_e
	cmp $2, cnt_e
	jge valoare_e
	jmp cont
	
semnalizat_f:
	addl $1, cnt_f
	cmp $2, cnt_f
	jge valoare_f
	jmp cont
	
semnalizat_g:
	addl $1, cnt_g
	cmp $2, cnt_g
	jge valoare_g
	jmp cont
	
semnalizat_h:
	addl $1, cnt_h
	cmp $2, cnt_h
	jge valoare_h
	jmp cont
	
semnalizat_i:
	addl $1, cnt_i
	cmp $2, cnt_i
	jge valoare_i
	jmp cont
	
semnalizat_j:
	addl $1, cnt_j
	cmp $2, cnt_j
	jge valoare_j
	jmp cont
	
semnalizat_k:
	addl $1, cnt_k
	cmp $2, cnt_k
	jge valoare_k
	jmp cont
	
semnalizat_l:
	addl $1, cnt_l
	cmp $2, cnt_l
	jge valoare_l
	jmp cont
	
semnalizat_m:
	addl $1, cnt_m
	cmp $2, cnt_m
	jge valoare_m
	jmp cont
	
semnalizat_n:
	addl $1, cnt_n
	cmp $2, cnt_n
	jge valoare_n
	jmp cont
	
semnalizat_o:
	addl $1, cnt_o
	cmp $2, cnt_o
	jge valoare_o
	jmp cont
	
semnalizat_p:
	addl $1, cnt_p
	cmp $2, cnt_p
	jge valoare_p
	jmp cont
	
semnalizat_q:
	addl $1, cnt_q
	cmp $2, cnt_q
	jge valoare_q
	jmp cont
	
semnalizat_r:
	addl $1, cnt_r
	cmp $2, cnt_r
	jge valoare_r
	jmp cont
	
semnalizat_s:
	addl $1, cnt_s
	cmp $2, cnt_s
	jge valoare_s
	jmp cont
	
semnalizat_t:
	addl $1, cnt_t
	cmp $2, cnt_t
	jge valoare_t
	jmp cont
	
semnalizat_u:
	addl $1, cnt_u
	cmp $2, cnt_u
	jge valoare_u
	jmp cont
	
semnalizat_v:
	addl $1, cnt_v
	cmp $2, cnt_v
	jge valoare_v
	jmp cont
	
semnalizat_w:
	addl $1, cnt_w
	cmp $2, cnt_w
	jge valoare_w
	jmp cont
	
semnalizat_x:
	addl $1, cnt_x
	cmp $2, cnt_x
	jge valoare_x
	jmp cont
	
semnalizat_y:
	addl $1, cnt_y
	cmp $2, cnt_y
	jge valoare_y
	jmp cont
	
semnalizat_z:
	addl $1, cnt_z
	cmp $2, cnt_z
	jge valoare_z
	jmp cont

valoare_a:
	pushl val_a
	jmp cont
	
valoare_b:
	pushl val_b
	jmp cont
	
valoare_c:
	pushl val_c
	jmp cont
	
valoare_d:
	pushl val_d
	jmp cont
	
valoare_e:
	pushl val_e
	jmp cont
	
valoare_f:
	pushl val_f
	jmp cont
	
valoare_g:
	pushl val_g
	jmp cont
	
valoare_h:
	pushl val_h
	jmp cont
	
valoare_i:
	pushl val_i
	jmp cont
	
valoare_j:
	pushl val_j
	jmp cont
	
valoare_k:
	pushl val_k
	jmp cont
	
valoare_l:
	pushl val_l
	jmp cont
	
valoare_m:
	pushl val_m
	jmp cont
	
valoare_n:
	pushl val_n
	jmp cont
	
valoare_o:
	pushl val_o
	jmp cont
	
valoare_p:
	pushl val_p
	jmp cont
	
valoare_q:
	pushl val_q
	jmp cont
	
valoare_r:
	pushl val_r
	jmp cont
	
valoare_s:
	pushl val_s
	jmp cont
	
valoare_t:
	pushl val_t
	jmp cont
	
valoare_u:
	pushl val_u
	jmp cont
	
valoare_v:
	pushl val_v
	jmp cont
	
valoare_w:
	pushl val_w
	jmp cont
	
valoare_x:
	pushl val_x
	jmp cont
	
valoare_y:
	pushl val_y
	jmp cont
	
valoare_z:
	pushl val_z
	jmp cont
et_let:
//variabila ia valoarea ultimului(nr)
//verificam cnt urile si daca avem 1, punem ultima din stiva in val_a
	cmp $1, cnt_a
	je atribuire_a
	
	cmp $1, cnt_b
	je atribuire_b
	
	cmp $1, cnt_c
	je atribuire_c
	
	cmp $1, cnt_d
	je atribuire_d
	
	cmp $1, cnt_e
	je atribuire_e
	
	cmp $1, cnt_f
	je atribuire_f
	
	cmp $1, cnt_g
	je atribuire_g
	
	cmp $1, cnt_h
	je atribuire_h
	
	cmp $1, cnt_i
	je atribuire_i
	
	cmp $1, cnt_j
	je atribuire_j
	
	cmp $1, cnt_k
	je atribuire_k
	
	cmp $1, cnt_l
	je atribuire_l
	
	cmp $1, cnt_m
	je atribuire_m
	
	cmp $1, cnt_n
	je atribuire_n
	
	cmp $1, cnt_o
	je atribuire_o
	
	cmp $1, cnt_p
	je atribuire_p
	
	cmp $1, cnt_q
	je atribuire_q
	
	cmp $1, cnt_r
	je atribuire_r
	
	cmp $1, cnt_s
	je atribuire_s
	
	cmp $1, cnt_t
	je atribuire_t
	
	cmp $1, cnt_u
	je atribuire_u
	
	cmp $1, cnt_v
	je atribuire_v
	
	cmp $1, cnt_w
	je atribuire_w
	
	cmp $1, cnt_x
	je atribuire_x
	
	cmp $1, cnt_y
	je atribuire_y
	
	cmp $1, cnt_z
	je atribuire_z

atribuire_a:
	popl %eax
	movl %eax, val_a
	jmp cont
	
atribuire_b:
	popl %eax
	movl %eax, val_b
	jmp cont
	
atribuire_c:
	popl %eax
	movl %eax, val_c
	jmp cont
	
atribuire_d:
	popl %eax
	movl %eax, val_d
	jmp cont
	
atribuire_e:
	popl %eax
	movl %eax, val_e
	jmp cont
	
atribuire_f:
	popl %eax
	movl %eax, val_f
	jmp cont
	
atribuire_g:
	popl %eax
	movl %eax, val_g
	jmp cont
	
atribuire_h:
	popl %eax
	movl %eax, val_h
	jmp cont
	
atribuire_i:
	popl %eax
	movl %eax, val_i
	jmp cont
	
atribuire_j:
	popl %eax
	movl %eax, val_j
	jmp cont
	
atribuire_k:
	popl %eax
	movl %eax, val_k
	jmp cont
	
atribuire_l:
	popl %eax
	movl %eax, val_l
	jmp cont
	
atribuire_m:
	popl %eax
	movl %eax, val_m
	jmp cont
	
atribuire_n:
	popl %eax
	movl %eax, val_n
	jmp cont
	
atribuire_o:
	popl %eax
	movl %eax, val_o
	jmp cont
	
atribuire_p:
	popl %eax
	movl %eax, val_p
	jmp cont
	
atribuire_q:
	popl %eax
	movl %eax, val_q
	jmp cont
	
atribuire_r:
	popl %eax
	movl %eax, val_r
	jmp cont
	
atribuire_s:
	popl %eax
	movl %eax, val_s
	jmp cont
	
atribuire_t:
	popl %eax
	movl %eax, val_t
	jmp cont
	
atribuire_u:
	popl %eax
	movl %eax, val_u
	jmp cont
	
atribuire_v:
	popl %eax
	movl %eax, val_v
	jmp cont
	
atribuire_w:
	popl %eax
	movl %eax, val_w
	jmp cont
	
atribuire_x:
	popl %eax
	movl %eax, val_x
	jmp cont
	
atribuire_y:
	popl %eax
	movl %eax, val_y
	jmp cont
	
atribuire_z:
	popl %eax
	movl %eax, val_z
	jmp cont
		
et_add:
//suma ultimelor 2 nr din stiva
	popl %eax
	popl %ebx
	addl %ebx, %eax
	pushl %eax
	jmp cont
	
et_div:
//impartirea ultimelor 2 nr din stiva
	xorl %edx, %edx
	popl %ebx
	popl %eax
	divl %ebx
	pushl %eax
	jmp cont

et_mul:
//produsul ultimelor 2 nr din stiva
	popl %eax
	popl %ebx
	mull %ebx
	pushl %eax
	jmp cont

et_sub:
//diferenta ultimelor 2 nr din stiva
	popl %ebx
	popl %eax
	subl %ebx, %eax
	pushl %eax
	jmp cont
	
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






