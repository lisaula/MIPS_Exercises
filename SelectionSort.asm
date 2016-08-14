.data
	array: .word 25,30,6,8,4,9
	size: .word 6

.text
la $a0, array
lw $a1, size
jal selectionSort

la $t0, array

#imprimir 
lw $a0, 0($t0)
li $v0, 1
syscall

lw $a0, 4($t0)
li $v0, 1
syscall

lw $a0, 8($t0)
li $v0, 1
syscall

lw $a0, 12($t0)
li $v0, 1
syscall

lw $a0, 16($t0)
li $v0, 1
syscall

lw $a0, 20($t0)
li $v0, 1
syscall

#exit
li $v0, 10
syscall

selectionSort:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
 
    slti $t0, $a1, 2
    bne $t0, $zero, end_if
    addi $t0, $zero, 0 #int minIndex = 0
    addi $t1, $zero, 1 #int index = 1
 
For:
	slt $t3, $t1, $a1
        beq $t3, $zero, end_for
        sll $t2, $t1, 2
        add $t2, $a0, $t2
        lw $t3, 0($t2)
        sll $t2, $t0, 2
        add $t2, $a0, $t2
        lw $t4, 0($t2)
        slt $t2, $t3, $t4
        beq $t2, $zero, add_index
        add $t0, $zero, $t1
 
add_index:
            addi $t1, $t1, 1
            j For
 
end_for:
        lw $t1, 0($a0) #int temp = array[0]
        sll $t2, $t0, 2
        add $t3, $a0, $t2 #minIndex offset
        lw $t2, 0($t3)
        sw $t2, 0($a0)
        sw $t1, 0($t3)
        add $a0, $a0, 4
        subi $a1, $a1, 1
        jal selectionSort
 
end_if:
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra