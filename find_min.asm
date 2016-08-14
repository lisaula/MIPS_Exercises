.data 
	array: .word 25,4,9,2,50
	size: .word 5
	cmin: .word 25
	
.text
main:
	la $a0, array
	lw $a1, size
	lw $a2, cmin	
	jal find_min
	
	#print
	li $v0, 1
	move $a0, $a2
	syscall
	
	#exit
	li $v0, 10
	syscall
	
find_min:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	slti $t0, $a1, 2
	beq $t0, $zero, else
	lw $t0, 0($a0)
	slt $t1, $t0, $a2
	beq $t1, $zero, else
	add $a2, $zero, $t0
	
else:
	add $a0, $a0, 4
	addi  $a1, $a1, -1
	jal find_min
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	
	