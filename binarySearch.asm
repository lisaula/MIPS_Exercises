main:
	#set memory word 0($gp) = [55, 44, 20, 99, 3]
	move $a0, $gp
    #set $a1 = 0
    #set $a2 = 4
    #set $a3 = 99
	jal binarysearch
	#show $v0 signed decimal
	#stop

binarysearch:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp); l
	sw $s1, 8($sp); r

	slt $t0, $a2, $a1
	bne $t0, $zero, return_minus
	sub $t0, $a2, $a1
	srl $t0, $t0, 1
	add $t0, $t0, $a1; mid

	sll $t1, $t0, 2
	add $t1, $a0, $t1 ; &arr[mid]
	lw $t2, 0($t1); arr[mid]

	bne $t2, $a3, second_if
	addi $v0, $t0, 0
	j epilogo

second_if:
	slt $t3, $a3, $t2
	beq $t3, $zero, return_recursive
	move $s0, $a1
	move $s1, $a2
	addi $a2, $t0, -1
	jal binarysearch
	j epilogo

return_recursive:
	move $s0, $a1
	move $s1, $a2
	addi $a1, $t0, -1
	jal binarysearch
	j epilogo

return_minus:
	addi $v0, $zero, -1

epilogo:
	lw $ra, 0($sp)
	lw $s0, 4($sp); l
	lw $s1, 8($sp); r
	addi $sp, $sp, 12

	jr $ra


