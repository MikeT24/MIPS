

addi $1, $zero, 0x1
addi $15, $zero, 0xf

## GETTING THE ADDRESS OF THE DATA MEMORY (0x10010000)
#addi $16, $zero, 0x1001
#sll $31, $16, 16

j TEST

beq $zero, $1, HERE
beq $1, $1, HERE 
nop
nop

HERE:
addi $17, $17, 1
j HERE

TEST: 
add $2, $1, $1

