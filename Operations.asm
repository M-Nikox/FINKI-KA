# Data segment
.data
A: .word 1, 3, 5, 7, 9, 10, 11, 12, 13, 15
i: .word 10
j: .word 14

# Text segment
.text
.globl main
main:

    lw $t0, i      # Load i into $t0
    lw $t1, j      # Load j into $t1
    lw $t2, A      # Load the base address of A into $t2

    andi $t1, $t1, 3    # j = j & 3

    #A[i+1] = A[i/2] + j%4
    srl $t0, $t0, 1    # i/2
    add $t0, $t0, $t2  # A[i/2]
    add $t1, $t1, $t2  # j%4
    lw $t3, 4($t2)     # A[i+1]
    add $t3, $t0, $t1  # A[i+1] = A[i/2] + j%4
    sw $t3, 4($t2)

    #isprintaj go j
    move $a0, $t1
    li $v0, 1
    syscall

    #isprintaj go A[i+1]
    lw $a0, 4($t2)
    li $v0, 1
    syscall

    #izlezi od programa
    li $v0, 10
    syscall
