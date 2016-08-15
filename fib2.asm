main:
	#set $a0 = 10
	jal fibonacci
	move $t0, $v0
	#show $t0
	#stop

;$a0 = n
fibonacci:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp);$a0
	sw $s1, 8($sp);ret vlue fib(n-1)
	
	addi $t0, $zero, 1
	slt $t1, $t0, $a0
	beq $t1, $zero, return_n

	move $s0, $a0
	addi $a0, $a0, -1
	jal fibonacci
	
	move $a0, $s0
	move $s1, $v0
	addi $a0, $a0, -2
	jal fibonacci
	move $t0, $s1
	
	add $v0, $v0, $t0
	j epilogo

return_n:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)

	add $v0, $zero, $a0

	addi $sp, $sp, 12
	jr $ra

epilogo:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra

