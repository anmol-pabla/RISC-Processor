.data
arr: .word 18, 100, 1, 3, 7, 9, 2, 7, 3, 0	
size: .word 10    	
size_minus_1: .word 9              
space:	.asciiz " "		  


.text
main:
	la $s0, arr					# load address of arr into s0
	addi $s1, $zero, 0			# outer loop counter
	addi $s2, $zero, 0			# inner loop counter
	lw $s3, size_minus_1 				

    loop:
        sll $t3, $s2, 2					# multiply s2 by 2 
        add $t3, $s0, $t3 				# add the address of arr to t3
        lw $t4, 0($t3)  				# load adjacent elements
        lw $t5, 4($t3) 					
        slt $t6, $t4, $t5				
        bne $t6, $zero, update          # update inner loop counter if items in correct order else swap
        sw $t5, 0($t3) 					# swap
        sw $t4, 4($t3)

    update:	
        addi $s2, $s2, 1				
        sub $s4, $s3, $s1 				
        bne  $s2, $s4, loop				# if not reached sorted portion continue loop
        addi $s1, $s1, 1 				# otherwise add 1 to outer counter and set inner counter to 0
        addi $s2, $zero, 0 					
        bne  $s1, $s3, loop				# next iteration if outer condition valid
        


    print_loop_prep:
        la	$t0, arr
        lw	$t1, size
        li	$t2, 0
    print_loop:
        bge	$t2, $t1, print_end
        li	$v0, 1
        lw	$a0, 0($t0)
        syscall
        li	$v0, 4
        la	$a0, space
        syscall
        addi	$t0, $t0, 4
        addi	$t2, $t2, 1
        j	print_loop
    print_end:
        li $v0, 10					
        syscall