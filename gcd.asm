//NAME: Juan Figueroa
//UIN: 626003173

// File name: gcd.asm

// This program calculates the greatest common divisor (gcd) of two given 
// non-negative integers, which are stored in RAM[0] (R0) and RAM[1] (R1). 
// The gcd is stored in RAM[2] (R2).


@0
D = M
@1
D = D-M
@setLarger
D;JLT

@1
D = M
@x
M = D
@0
D = M
@y
M = D

@Start
0;JMP

(setLarger)
	@1
	D = M
	@y
	M = D
	@0
	D = M
	@x
	M = D

(Start)
	@x
	D = M
	@xPlus
	M = D
	@y
	D = M-D
	@remainder
	M = D

(GCD)
	//once remainder is equal to zero, break from loop//
	@remainder
	D = M
	@gcdCont
	D;JEQ
	////////////////////////////////////////////////////
	
	@y
	D = M
	@xPlus
	D = M-D
	@gcdCont
	D;JEQ
	@changeGCD
	D;JGT
	
	@x
	D = M
	@xPlus
	M = M+D
	@GCD
	0;JMP
	
	
	(changeGCD)
		//calc remainder
		@x
		D = M
		@xPlus
		D = M-D
		@y
		D = M-D
		@remainder
		M = D
		
		//put y <- x
		@x
		D = M
		@y
		M = D
		
		
		//put x <- remainder
		@remainder
		D = M
		@x
		M = D
		
		//reset remainder and xplus
		@y
		D = M
		@x
		D = D-M
		@remainder
		M = D
		@x
		D = M
		@xPlus
		M = D
	
	@GCD
	0;JMP
	
(gcdCont)		
	@x
	D = M
	@2
	M = D
	
(end)
	@end
	0;JMP