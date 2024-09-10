
nop
addi $1, $zero, 0x1
addi $15, $zero, 0xf
add $16, $1, $15

## GETTING THE ADDRESS OF THE DATA MEMORY (0x10010000)
#addi $16, $zero, 0x1001
#sll $31, $16, 16

j TEST
addi $t2, $t2, 0xff
addi $t3, $t3, 0xde
nop
nop

HERE:
addi $17, $17, 1
j HERE

TEST: 
add $2, $1, $1
nop
nop
nop
nop
beq $zero, $zero, TEST
or $t4, $zero, $16
addi $t5, $zero, 0xde
addi $t6, $zero, 0xad

