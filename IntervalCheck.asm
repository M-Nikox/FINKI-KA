#Внесете број од тастатура. Ако бројот се наоѓа во интервалот [-5, 105) или е поголем од 105050 или пак е помал или еднаков со -70999, тогаш на екран напишете „во интервал“.Во спротивно, напишете „надвор од интервал“.

.data
in_interval: .asciiz "vo interval"
outside_interval: .asciiz "nadvor od interval"
num1: .word -70999
num2: .word 105050

.text
.globl main
main:
    li $v0, 5
    syscall
    move $t0, $v0
    
    lw $t1, num1
    slt $t2, $t0, $t1
    beq $t2, $1, true
    
    slti $t2, $t0, -5
    bne $t2, $0, false
    
    lw $t1, num2
    slt $t2, $t1, $t0
    bne $t2, $0, false
    
    
true:
    la $a0, in_interval
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall
    
false:
    la $a0, outside_interval
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall
