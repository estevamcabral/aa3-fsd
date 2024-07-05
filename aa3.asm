
.text
.globl inicio

#Legenda de registradores

#t0 = tamanhoVetor
#t1 = iterador

#t2 = *A
#t3 = *B
#t4 = *C
#t5 = *D

#t6 = somaPositivosC
#t7 = somaPositivosD
#t8 = MS

#s0 = Valor percorrido de A
#s1 = Valor percorrido de B

inicio:
	la $t0, tamanhoVetor
	lw $t0, 0($t0)
	
	la $t1, iterador
	lw $t1, 0($t1)
	
	la $t2, A
	la $t3, B
	la $t4, C
	la $t5, D
	
	la $t6, somaPositivosC
	lw $t6, 0($t6)
	
	la $t7, somaPositivosD
	lw $t7, 0($t7)
	
	la $t8, MS
	lw $t8, 0($t8)
	
loop:
	lw	$s0, 0($t2) 		# A
	lw	$s1, 0($t3) 		# B
	
	somaVetor:
	add	$s0, $s0, $s1		# Guarda no s0 (A): A+B
	sw	$s0  ($t4)		# Guarda no C ($t4): $s0 que cont�m o resultado de A+B
	
	blt	$s0, $zero, pulaSomaC	# Se n�mero for negativo, n�o � adicionado ele na soma total de C
	
	acumulaPositivosC:
	add	$t6, $t6, $s0		# Soma e salva sequencialmente
	sw	$t6, somaPositivosC
	
	pulaSomaC:
	lw	$s0, 0($t2) 		# A
	lw	$s1, 0($t3) 		# B
	
	subtraiVetor:
	sub	$s0, $s0, $s1		# Guarda no s0 (A): A-B
	sw	$s0 ($t5)		# Guarda no D ($t5): $s0 que cont�m o resultado de A-B

	blt	$s0, $zero, pulaSomaD	# Se n�mero for negativo, n�o � adicionado ele na soma total de D
	
	acumulaPositivosD:		
	add	$t7, $t7, $s0		# Soma e salva sequencialmente
	sw	$t7, somaPositivosD

	pulaSomaD:	
	addi 	$t2, $t2, 4		# Adi��o de endere�os
	addi 	$t3, $t3, 4
	addi 	$t4, $t4, 4
	addi 	$t5, $t5, 4
	addi 	$t1, $t1, 1		# Adi��o do iterador
	
	blt	$t1, $t0, loop		# Compara iterador ($t1) com tamanhoVetor ($t0) para gerar o loop
	
multiplicacao:
	mul	$t8, $t6, $t7		# Sub-rotina que realiza a multiplica��o final e salva
	sw	$t8, MS
	
fim: j fim

.data
tamanhoVetor:   .word 8		
iterador: 	.word 0		
A: 		.word 11 2 3 4 5 6 7 8	
B: 		.word 9 10 11 12 13 14 15 16	
C: 		.word 0 0 0 0 0 0 0 0	
D: 		.word 0 0 0 0 0 0 0 0
somaPositivosC: .word 0
somaPositivosD: .word 0
MS:		.word 0