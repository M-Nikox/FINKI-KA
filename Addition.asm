.data
.text
.globl main

main:
    li $s0, 5
    li $s1, -100
    li $t0, 0
    li $t1, 0
    
loop:
    andi $t2, $s1, 1
    
    beq $t2, 1, add
    
    sll $s0, $s0, 1
    
    sll $s1, $s1, 1
    addi $t0, $t0, 1
    

    bne $t0, 32, loop
    
    li $v0, 1
    move $a0, $t1
    syscall  
    
    li $v0, 10
    syscall  
    
add:
    add $t1, $t1, $s0
    
    sll $s0, $s0, 1
    
    sll $s1, $s1, 1
    addi $t0, $t0, 1
    
    bne $t0, 32, loop
    
    li $v0, 1
    move $a0, $t1
    syscall  
    
    li $v0, 10
    syscall  
