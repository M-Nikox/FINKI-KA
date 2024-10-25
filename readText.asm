#Incredibly fun problem from Lab 5&6, question 7. You have to create a readText procedure which reads an array of characters and will write to a memory location given as an argument. Read until you find '\0'
#Then write another procedure called symmetry which will check if the text is symmetrical. The procedure needs to return 1 if it is and 0 if it is not.
#Finally write the main program which will allocate space for 50 characters and will call readText, make sure it enters the allocated memory. Then call symmetry, print the result.

read_string:
    li $t1, 0
    
read_char:
    li $v0, 8
    syscall
    move $t0, $v0
    
    beq $t0, $zero, end_read_string
    
    addu $t2, $a0, $t1   
    sb $t0, ($t2)        
    addi $t1, $t1, 1     
    j read_char         
    
end_read_string:
    sb $zero, ($t2)      
    jr $ra               

symmetry:
    li $t1, 0
    move $t2, $zero
    
    la $t0, end_str
    subu $t0, $t0, $a0
    
check_symmetry:
    subu $t3, $t0, $t1
    addu $t3, $a0, $t3
    sb $zero, ($t3)
    
    lb $t1, -100($t2)
    bne $t2, $t3, not_symmetrical
    
    addi $t1, $t1, 1
    blt $t1, $t0, check_symmetry
    
    li $v0, 1
    jr $ra     
    
not_symmetrical:
    li $v0, 0
    jr $ra
    
end_str:
    .asciiz "\0"
    
.text
main:
    li $a0, 50
    li $v0, 9
    syscall
    
    la $a0, msg
    li $v0, 4
    syscall
    
    move $a1, $v0  
    jal readText
    
    move $a0, $v0   
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall
