

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
lw $14, 0($31)
##USE CASE OF DATA FORWARDING 
add $1, $2, $2
add $4, $1, $5
add $6, $1, $7
add $8, $1, $9
add $4, $1, $5


## SECOND USE CASE
add $1, $1, $2
add $1, $1, $3
add $1, $1, $4



or $17, $1, $15
and $17, $1, $15
slt $17, $1, $3
slt $17, $3, $1
sub $17, $15, $14
xor $17, $1, $15
srl $17, $15, 2
sra $17, $15, 2
sll $17, $15, 24
abs $17, $15

ori $17, $15, 1
andi $17, $15, 1
xori $17, $15, 1

#sw $15, 0($15)
#lw $17, 0($15)
nop
nop


beq $zero, $1, HERE
beq $1, $1, HERE 
nop
nop
HERE:
addi $17, $17, 1
j HERE



