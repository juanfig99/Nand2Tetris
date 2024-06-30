//NAME: Juan Figueroa
//UIN: 626003173

// File name: palin.asm

// The program develops a Palindrome checker application. 
// The input to the program is a 5 digit integer A and is stored in RAM[0] (R0).
// A helper value of 10 is stored in RAM[8] (R8) by virtue of the tst file command.
// Number A is a positive integer.
// A has exactly 5 digits and no more no less.

// Program functions as follows: 
// Extract the individual digits from number A and store them in R2-R6 registers in that order.
// Result of 1 is stored in R1 if the number A is a Palindrome else result of 0 is stored in R1


//set end of algo variable, a, to 4
@4
D = A
@a
M = D
@baseAddress
M = 1
@j
M = 1
@0
D = M
@decRepOfR0
M = D

(palinLOOP)
	@a
	D = M
	@lastCheck
	D;JLT
	
	@decRepOfR0
	D = M
	@copyDROR0
	M = D
	@mod
	M = 0
	
	
	(mod10)
		@copyDROR0
		D = M
		@8
		D = D-M
		
		//might need to change this back to JLE
		@innerModCont
		D;JLT				
		
		//check if copy is GT 10000
		@10000
		D = A
		@copyDROR0
		D = M-D
		@checkGT10000
		D;JGT
		
		//check if copy is GT 1000
		@1000
		D = A
		@copyDROR0
		D = M-D
		@checkGT1000
		D;JGT
		
		//check if copy is GT 100
		@100
		D = A
		@copyDROR0
		D = M-D
		@checkGT100
		D;JGT
		
		//check if copy is GT 10
		@10
		D = A
		@copyDROR0
		D = M-D
		@checkGT10
		D;JGE
		
		(checkGT10000)
			@10000
			D = A
			@copyDROR0
			M = M-D
			@mod10
			0;JMP
		(checkGT1000)
			@1000
			D = A
			@copyDROR0
			M = M-D
			@mod10
			0;JMP
		(checkGT100)
			@100
			D = A
			@copyDROR0
			M = M-D
			@mod10
			0;JMP
		(checkGT10)
			@10
			D = A
			@copyDROR0
			M = M-D
			@mod10
			0;JMP
	
	(innerModCont)
	@copyDROR0
	D = M
	@mod
	M = D
	
	@baseAddress
	D = M
	@j
	D = D+M
	@temp
	M = D
	@mod
	D = M
	@temp
	A = M
	M = D
	
	@mod
	D = M
	@decRepOfR0
	M = M-D
	D = M
	
	@q
	M = D
	@count
	M = 0
	
	(div10)
		@q
		D = M
		@8
		D = D-M
		@innerDivCont
		D;JLT
		
		@8
		D = M
		
		@q
		D = M-D
		M = D
		
		@count
		M = M+1
		
		@div10
		0;JMP
	
	(innerDivCont)
		@count
		D = M
		@decRepOfR0
		M = D
		
	
	//end of loop, go back up
	@a
	M = M-1
	@j
	M = M+1
	@palinLOOP
	0;JMP
	
//lastly, check to see if R2 and R6 are the same and check if R3 and R5 are the same

(lastCheck)
@2
D = M
@6
D = D-M
@notEqual
D;JNE
@3
D = M
@5
D = D-M
@notEqual
D;JNE

@1
M = 1
@end
0;JMP

(notEqual)
	@1
	M = 0
	
(end)
@end
0;JMP