;$a0 = *arr
;$a1 = izq
;$a2 = der


;$t0 = i
;$t1 = j 
;$t2 = p (el pivote)

main:
	#set memory word 0($gp) = [55, 44, 20, 99, 3]
	move $a0, $gp
	add  $a1, $zero, $zero
	addi $a2, $zero, 4
	jal quicksort

	j print

quicksort:

prologue:
	addi $sp, $sp, -16
	sw  $ra, 0($sp)
	sw  $a0, 4($sp)
	sw  $a1, 8($sp)
	sw  $a2, 12($sp)

	add $t0, $zero, $a1; i
	add $t1, $zero, $a2; j

begin_quicksort:
	add $t2, $t0, $t1
	srl $t2, $t2, 1
	sll $t2, $t2, 2
	add $t3, $t2, $a0
	lw  $t2, 0($t3); p

while:
	slt $t3, $t1, $t0; j > i
	bne $t3, $zero, end_while

arri_while:
	sll $t3, $t0, 2
	add $t3, $t3, $a0
	lw  $t4, 0($t3) ; arr[i]
	slt $t5, $t4, $t2 
	beq $t5, $zero, arrj_while
	addi $t0, $t0, 1
	j arri_while

arrj_while:
	sll $t3, $t1, 2
	add $t3, $t3, $a0
	lw  $t4, 0($t3); arr[j]
	slt $t5, $t2, $t4
	beq $t5, $zero, begin_if
	addi $t1, $t1, -1
	j arrj_while

begin_if:
	slt $t3, $t1, $t0
	bne $t3, $zero, while
	
	sll $t3, $t0, 2
	add $t3, $t3, $a0; &arr[i]
	lw  $t4, 0($t3); tmp

	sll $t5, $t1, 2
	add $t5, $t5, $a0; &arr[j]
	lw  $t6, 0($t5); arr[j]

	sw  $t6, 0($t3); arr[i] = arr[j]
	sw  $t4, 0($t5); arr[j] = tmp
	
	addi $t0, $t0, 1
	addi $t1, $t1, -1

	j while

end_while:
	slt $t3, $a1, $t1
	beq $t3, $zero, der_if

	add $a2, $t1, $zero
	lw  $s0, 12($sp) 
	jal quicksort

der_if:
	add $a2, $s0, $zero
	slt $t3, $t0, $a2
	beq $t3, $zero, end_func

	add $a1, $t0, $zero
	jal quicksort

end_func:
	lw $ra, 0($sp)
	addi $sp, $sp, 16
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
