#$a0 = key
#$a1 = **leaf

#struct node = 12 bytes

.data
	nodeA: .word 5, 0x10008888, 0x10008900
	leaf: .word nodeA
.text

main:
	la   $a1, leaf
#	la   $a1, ($t0)
	addi $a0, $zero, 10
	jal insert
	
	move $a0, $v0
	
	li $v0, 1
	lw $t0, 0($a1)
	lw $a0, 0($t0)
	#addi $a0, $a0, 0
	syscall
	
	li $v0, 10
	syscall
	
insert:
	addi $sp, $sp, -8
	sw   $ra, 0($sp)
	sw   $s0, 4($sp)

	lw  $t0, 0($a1) #*leaf
	bne $t0, $zero, else_if

	add $s0, $a0, $zero

	li   $v0, 9 #syscall for allocation
	addi $a0, $zero, 12 
	syscall

	move $a0, $s0

	sw $v0, 0($a1) #*leaf = malloc
	sw $a0, 0($v0)
	sw $zero, 4($v0)
	sw $zero, 8($v0)
	j epilogo

else_if:
	lw  $t1, 0($t0) #key value
	slt $t2, $a0, $t1
	beq $t2, $zero, else_if_right
	move $s0, $a1
	addi $a1, $t0, 4
	jal insert
	j epilogo

else_if_right:
	lw $t1, 0($t0) #key value
	slt $t2, $t1, $a0
	beq $t2, $zero, epilogo
	move $s0, $a1
	addi $a1, $t0, 8
	jal insert

epilogo:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	move $a1, $s0
	
	addi $sp, $sp, 8
	jr $ra