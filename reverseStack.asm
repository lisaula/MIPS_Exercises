#node = {int a, struct node *next}

#struct node = 12 bytes

#$a0 = *ptrArbol
#$a1 = valor

insertarNodo:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)

	lw $t0, 
	bne $a0, $zero, else
	move $s0, 
	li   $v0, 9 #syscall for allocation
	addi $a0, $zero, 8
	syscall

	move $a0, $s0	
