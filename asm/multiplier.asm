#Basic Init
nop
addi $1, $zero, 0xf
addi $2, $zero, 0x2
addi $3, $zero, 0xff

# Filling pipe with independent multiplications - these are should not be stalled
# Multiplications in this MIPS get stored in register $31
mult $2, $2
mult $1, $2
mult $3, $1
mult $zero, $zero
mult $3, $2
mult $3, $3
# Write port hazard due to B2B 
addi $6, $30, 1 # Should be stalled - Write register port is busy
nop
nop

# Stalling instructions with dependency in the destination 
# Addi wants to use the destination register of the multiplication
mult $2, $2
addi $6, $31, 1 #Should be stalled -- Result should be diferent than previous addi
add $6, $31, $2
nop
nop

# Write port structural Hazard -- w/ clean pipe
mult $3, $5
nop
addi $5, $3, 1  #This should be stalled - Write register port is busy
add $5, $3, $5
nop
nop

# Hazard in destination port -- The result of the addi should be stored after the multiplication
mult $3, $2
addi $31, $zero, 1 #This needs to be stalled to be correctly written back and stored in registers 
add $10, $4, $6 
nop
nop

## Independent operation -- this should not be stalled
mult $1, $2
add $4, $5, $6
nop
nop
nop
nop

# Branch Interruption -- this will be taken, mult should be cancelled/not started
beq $zero, $zero, HERE
mult $2, $31 # This should not finish executing
add $1, $1, $1	#This should not execute
add $1, $1, $1	#This should not execute
add $1, $1, $1	#This should not execute
add $1, $1, $1	#This should not execute

HERE: 
addi $2, $2, 1 # Should land here infinitely 
nop	
j HERE	

