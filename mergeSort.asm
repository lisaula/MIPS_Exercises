main:
	#set memory word 0($gp) = [55, 44, 20, 99, 3]
	move $a0, $gp
	add  $a1, $zero, $zero
	addi $a2, $zero, 4
	jal mergeSort

	j print


;$a0 = *arr
;$a1 = l
;$a2 = r
;$a3 es para merge
;$a3 = m

mergeSort:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)

	#show $a2
	;#show $a1
	slt $t0, $a1, $a2
	beq $t0, $zero, end_func

	sub $t0, $a2, $a1
	;#show $t0
	srl $t0, $t0, 1
	add $t1, $t0, $a1 ; m = l+(r-l)/2
	sw  $t1, 12($sp) ;save m for future calls
	;#show $t1
	add $a2, $t0, $zero
	jal mergeSort

	lw $t2, 8($sp)
	addi $a2, $t2, 0
	#show $a2
	lw $t0, 12($sp)
	;#show $t0
	addi $a1, $t0, 1
	jal mergeSort
	;#show $a1
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $a3, 12($sp)
	jal merge

end_func:
	lw   $ra, 0($sp)
	addi $sp, $sp, 16

	jr $ra

merge:
	#show memory word $sp
	addi $t0, $a1, 1
	sub $t0, $a3, $t0 ; n1
	sub $t1, $a2, $a3; n2

	sll $t2, $t0, 2
	#show $sp hex
	sub $sp, $sp, $t2 
	add $t2, $sp, $zero ; &l[n1]

	sll $t3, $t1, 2
	sub $sp, $sp, $t3
	#show memory word $sp
	add $t3, $sp, $zero ; &R[n2]

	#show $t3
	addi $t4, $zero, 0 ; i  
for_left:
	slt $t5, $t4, $t0
	beq $t5, $zero, for_right
	add $t5, $a1, $t4
	sll $t5, $t5,2
	add $t5, $a0, $t5
	lw $t6, 0($t5) ; arr[l + i]
	sll $t5, $t4, 2
	add $t5, $t5, $t2
	sw $t6, 0($t5) 
	#show $t5
	addi $t4, $t4, 1
	j for_left

	addi $t4, $zero, 0 ; i 
for_right:
	slt $t5, $t4, $t1
	beq $t5, $zero, end_for
	add $t5, $a3, $t4
	addi $t5, $t5, 1
	sll $t5, $t5, 2
	add $t5, $a0, $t5
	lw  $t6, 0($t5) ;arr[m + 1+ j]
	sll $t5, $t4, 2
	#show $t3
	add $t5, $t3, $t5
	#show $t5
	sw  $t6, 0($t5)

	addi $t4, $t4, 1
	j for_right

end_for:
	addi $t4, $zero, 0; i
	addi $t5, $zero, 0; j
	addi $t6, $a1, 0 ; k

while_merge:
	slt $t7, $t4, $t0
	beq $t7, $zero, while_left
	slt $t7, $t5, $t1
	beq $t7, $zero, while_left
	sll $t7, $t4, 2
	add $t7, $t2, $t7
	lw $t8, 0($t7); l[i]

	sll $t7, $t5, 2
	add $t7, $t3, $t7
	lw $t9, 0($t7) ; r[j]

	slt $t7, $t9, $t8 ; if condition
	bne $t7, $zero, else
	sll $t7, $t6, 2
	add $t7, $a0, $t7
	sw $t8, 0($t7)
	addi $t4, $t4, 1
	j add_k

else:
	sll $t7, $t6, 2
	add $t7, $a0, $t7
	sw $t9, 0($t7)
	addi $t5, $t5, 1

add_k:
	addi $t6, $t6, 1
	j while_merge

while_left:
	slt $t7, $t4, $t0
	beq $t7, $zero, while_right
	sll $t7, $t4, 2
	add $t7, $t2, $t7
	lw $t8, 0($t7); l[i]

	sll $t7, $t6, 2
	add $t7, $a0, $t7

	sw $t8, 0($t7)

	addi $t4, $t4, 1
	addi $t6, $t6, 1
	j while_left


while_right:
	slt $t7, $t5, $t1
	beq $t7, $zero, end_merge

	sll $t7, $t5, 2
	add $t7, $t3, $t7
	lw $t8, 0($t7); r[j]

	sll $t7, $t6, 2
	add $t7, $a0, $t7

	sw $t8, 0($t7)
	addi $t5, $t5, 1
	addi $t6, $t6, 1
	j while_right

end_merge:
	sll $t2, $t0, 2
	add $sp, $sp, $t2

	sll $t3, $t1, 2
	add $sp, $sp, $t3
	j print
	#show memory word $sp
	jr $ra

print:
	move $t0, $gp
    #set $t1 = 5
	addi $t2, $zero, 0

print_for:
    #show memory word 0($t0)
	
	addi $t2, $t2, 1
	addi $t0, $t0, 4
	bne $t1, $t2, print_for

print_end_for:
	#stop
