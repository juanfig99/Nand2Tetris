//NAME: Juan Figueroa
//UIN: 626003173

// File name: calc.asm

// The program develops a calculator application. 
// The operands a and b are integer numbers stored in RAM[0] (R0) and RAM[1] (R1), respectively.
// The operation choice c is stored in RAM[2] (R2), respectively
// if c == 1, do a + b
// if c == 2, do a - b
// if c == 3, do a * b
// if c == 4, do a / b
// For Addition and Subtraction operations the operands a and b can be positive or negative.
// For Multiplication operation only ONE operand can be negative.
// For Division operation BOTH operands must be positive and must be greater than 0.
// Store the final result (quotient for Division) in RAM[3] (R3). Only the Division operation 
// stores the remainder in RAM[4] (R4).


// Put your code below this line
@1024
M = 0
@2
D = M

D = D-1
@doADD
D;JEQ

D = D-1
@doSUB
D;JEQ

D = D-1
@doMULT
D;JEQ

D = D-1
@doDIV
D;JEQ

@end
0;JMP

(doADD)
	@0
	D = M
	@1
	D = D+M
	@3
	M = D
	@end
	0;JMP

(doSUB)
	@0
	D = M
	@1
	D = D-M
	@3
	M = D
	@end
	0;JMP

(doMULT)
	//check to see if both ops are negative, then opfail. Else, proceed
	@numNegative
	M = 0
	
	@0
	D = M
	@checkNegative0
	D;JLT
	
	(backUp)
	@1
	D = M
	@checkNegative1
	D;JLT
	
	@checkWhich
	0;JMP
	
	(checkNegative0)
		@numNegative
		M = M+1
		@backUp
		0;JMP
	(checkNegative1)
		@numNegative
		M = M+1
	
	@numNegative
	D = M
	D = D-1
	@opFAIL
	D-1;JEQ
	
	//run check to see which operand is negative
	(checkWhich)
		@0
		D = M
		@ay
		D;JLT
		@1
		D = M
		@be
		D;JLT
	
	//both checks failed, so both are positive
	//put a and b into respective vars
	@0
	D = M
	@aTest
	M = D
	@1
	D = M
	@bTest
	M = D
	@start
	0;JMP
	
	(ay)
		@1
		D = M
		@aTest
		M = D
		@0
		D = M
		@bTest
		M = D
		@start
		0;JMP
	(be)
		@0
		D = M
		@aTest
		M = D
		@1
		D = M
		@bTest
		M = D
	
	(start)
	@j
	M = 1
	@multSum
	M = 0
	
	//now loop
	(multLOOP)
		@j
		D = M
		@aTest
		D = D-M
		// if loop doesnt run, switch to JGE
		@contMULT
		D;JGT
		
		@bTest
		D = M
		
		@multSum
		M = D+M
		
		@j
		M = M+1
		@multLOOP
		0;JMP
		
	(contMULT)
		@multSum
		D = M
		@3
		M = D
		@end
		0;JMP

(doDIV)
	//check if either R0 or R1 are negative
	@0
	D = M
	@opFAIL
	D;JLE
	@1
	D = M
	@opFAIL
	D;JLE
	
	//check if a < b
	@0
	D = M
	@1
	D = D-M
	@aLTb
	D;JLT
	
	@0
	D = M
	@quotient
	M = D
	
	@1
	D = M
	@remainder
	M = D		//might need to change to D-1
	
	@k
	M = 0
	
	//now LOOP
	(divLOOP)
		@quotient
		D = M
		@remainder
		D = D-M
		@contDIV
		D;JLT
		
		@remainder
		D = M
		@quotient
		M = M-D
		
		@k
		M = M+1
		
		@divLOOP
		0;JMP
		
	(contDIV)
		@k
		D = M
		@3
		M = D
		@quotient
		D = M
		@4
		M = D
		@end
		0;JMP
	
	(aLTb)
		@0
		D = M
		@4
		M = D
		@3
		M = 0
		
(end)
@end
0;JMP

(opFAIL)
	@3
	M = 0
	@4
	M = 0
	@1024
	M = -1
	@end
	0;JMP