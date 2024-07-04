
.text
.globl inicio

#Legenda de registradores
#t0 = tamanhoVetor
#t1 = iterador
#t2 = A
#t3 = *A
#t4 = B
#t5 = *B
#t6 = C
#t7 = *C
#t8 = D
#t9 = *D

inicio:
	la $t0, tamanhoVetor
	lw $t0, 0($t0)
	
	la $t1, iterador
	lw $t1, 0($t1)
	
	la $t3, A
	la $t5, B
	la $t7, C
	la $t9, D

loop:
	# Loop que percorre até o fim do vetor

	lw	$s0, 0($t3) # A
	lw	$s1, 0($t5) # B
	
	add	$s0, $s0, $s1	# Guarda no s0 (A): A+B
	sw	$s0 ($t7)	# Guarda no C ($t7): A
	
	blt	$s0, $zero, pula
	# Aqui somar
	
	pula:
	lw	$s0, 0($t3) # A
	lw	$s1, 0($t5) # B
	
	sub	$s0, $s0, $s1	# Guarda no s0 (A): A-B
	sw	$s0 ($t9)	# Guarda no D ($t9): A
	
	blt	$s0, $zero, pula2
	# Aqui somar
	
	pula2:		
	
	#Adição de endereços
	add $t3, $t3, 4
	add $t5, $t5, 4
	add $t7, $t7, 4
	add $t9, $t9, 4
	#Adição de endereços
	
	# Adição do iterador
	add	$t1, $t1, 1

	# Compara iterador ($t1) com tamanhoVetor ($t0)
	blt 	$t1, $t0, loop
	

multiplicacao:

	

fim: j fim

	
.data
tamanhoVetor: .word 8		
iterador: .word	0		
A: .word 10 20 30 40 50 60 70 80	
B: .word 5 10 15 20 25 30 35 40	
C: .word 0 0 0 0 0 0 0 0	
D: .word 0 0 0 0 0 0 0 0
somaPositivosC: .word 0
somaPositivosD: .word 0 			
