nop

lw $0, 0($1)
lw $2, 32($1)	## Memory is byte alligned
lw $4, 36($1)	## Memory is byte alligned
add $2, $2, $4
and $3, $2, $4
lw $5, 40($1)
or $7, $5, $0
lw $6, 8($1)
or $7, $7, $6
slt $10, $0, $7
slt $11, $7, $0 
addi $31, $0, -1
beq $7, $0, FAR
j LABEL1
LABEL2: 
beq $0, $0, LABEL2
LABEL1: 
j LABEL2

FAR:
addi $zero $zero, 1


