

addi $1, $zero, 0x1
addi $2, $zero, 0x2
addi $3, $zero, 0x3
addi $4, $zero, 0x4
addi $5, $zero, 0x5
addi $6, $zero, 0x6
addi $7, $zero, 0x7
addi $8, $zero, 0x8
addi $9, $zero, 0x9
addi $10, $zero, 0xa
addi $11, $zero, 0xb
addi $12, $zero, 0xc
addi $13, $zero, 0xd
addi $14, $zero, 0xe
addi $15, $zero, 0xf


## GETTING THE ADDRESS OF THE DATA MEMORY (0x10010000)
addi $16, $zero, 0x1001
sll $31, $16, 16

## CHECK DATA MEMORY CONTROLLER
sw $15, 0($31)
sw $1, 4($31)
lw $20, 0($31)
nop
nop
nop
nop
nop
nop
nop

## LOAD-TO-USE
lw $2, 4($31)
and $4, $2, $5
or $4, $2, $5
and $4, $2, $5
or $4, $2, $5

nop
nop

lw $1, 0($31)
sw $1, 8($31)


beq $zero, $1, HERE
beq $1, $1, HERE 
nop
nop
HERE:
addi $17, $17, 1
j HERE



