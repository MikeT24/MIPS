nop

lw $0, 0($0)
lw $2, 32($0)	## Memory is byte alligned
lw $4, 36($0)	## Memory is byte alligned
add $2, $2, $4
and $3, $2, $4
lw $5, 40($0)
or $7, $5, $0
lw $6, 8($0)
or $7, $7, $6
slt $10, $0, $7
slt $11, $7, $0 
addi $31, $0, -1
beq $7, $0, FAR
J LABEL1
LABEL2: 
beq $0, $0, LABEL2
LABEL1: J $14, LABEL2


