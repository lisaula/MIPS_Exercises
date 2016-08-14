main:
	#set memory word 0($gp) = [55, 44, 20, 99, 3]
	move $a0, $gp
    #set $a1 = 5
	jal insertion_sort
	j print

;$a0 = array
;$a1 = size
insertion_sort:
	addi $t0, $zero, 1 ;i
for:
	slt $t1, $t0, $a1
	beq $t1, $zero, end_funct
	sll $t1, $t0, 2
	add $t1, $a0, $t1
	lw $t2, 0($t1) ; temp
	addi $t1, $t0, -1 ; j

while:	
	slt $t6, $t1, $zero ; j >=0
	bne $t6, $zero, end_while

	sll $t3, $t1, 2
	add $t7, $a0, $t3
	lw $t4, 0($t7) ; a[j]
	slt $t5, $t2, $t4 ; temp < a[j]
	beq $t5, $zero, end_while

	;swapping
	sll $t5, $t1, 2
	add $t5, $a0, $t5
	addi $t5, $t5, 4;a[j+1]
	sw $t4, 0($t5) ; a[j+1] = a[j]
	;#show $t4
	addi $t1, $t1, -1
	j while
end_while:
	sll $t5, $t1, 2
	add $t5, $a0, $t5
	addi $t5, $t5, 4;a[j+1]
	sw $t2, 0($t5)

	addi $t0, $t0, 1
	j for

end_funct:
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













