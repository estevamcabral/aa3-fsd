
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
	add	$t1, $t1, 1
	blt 	$t1, $t0, loop
	
	
adicaoDeVetores:

	
	
	add $t3, $t3, 4
	add $t5, $t5, 4
	add $t7, $t7, 4
	add $t9, $t9, 4
	
.data
tamanhoVetor: .word 8		#t0
iterador: .word 0		#t1
A: .word 2 3 4 5 6 7 8 9	
B: .word 2 3 4 5 6 7 8 9	
C: .word 0 0 0 0 0 0 0 0	
D: .word 0 0 0 0 0 0 0 0 			
