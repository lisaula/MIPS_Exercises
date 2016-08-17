;$a0 = s1
;$a1 = s2

main:
	#set $t0 = 99
	sb $t0, 0($gp)
	#set $t0 = 100
	sb $t0, 1($gp)
	#set $t0 = 99
	sb $t0, 2($gp)
	#set $t0 = 101
	sb $t0, 3($gp)
	move $a0, $gp
	addi $t0, $gp, 2
	move $a1, $t0
	jal strcmp
	#show $v0 signed decimal
	#stop

strcmp:
	#set $s0 = 0
	#set $s1 = 0
while:
	add $t0, $s0, $a0
	lb  $t1, 0($t0)
	beq $t1, $zero, end_while
	add $t0, $s1, $a1
	lb  $t2, 0($t0)
	bne $t2, $t1, end_while
	#show $a0 hex
	#show $a1 hex
	addiu $s0, $s0, 1
	addiu $s1, $s1, 1
	j while

end_while:
	add $t0, $s0, $a0
	lbu $t1, 0($t0)
	add $t0, $s1, $a1
	lbu $t2, 0($t0)
	#show $t0 hex
	#show $t0 hex

	#show $t0 signed decimal
	#show $t1 signed decimal
	sub $v0, $t1, $t2
	jr $ra