nop


add $1, $0, $0
addi $2, $0, 36
lw $3, 0($1)
LOOP: 
addi $1, $1, 4
lw $4, 0($1)
slt $5, $4, $3
beq $5, $0, SLT
add $3, $4, $0
SLT:
beq $1, $2, EXIT
j LOOP
EXIT:
sw $3, 4($1)

END:
addi $0, $0, 0
j END
