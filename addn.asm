//addn.asm

//NAME: Juan Figueroa
//UIN: 626003173 

//This asm computes the sum of n numbers
//Assuming RAM[0] stores the value n (how many numbers to sum)
//and the numbers are stored in consecutive addresses starting at address 1.
//The result will be stored in RAM[0], overwriting the original value of n.
//It may be useful to use variables when solving this problem.
//Write your code below.
///////////////////////////////////////////////////////////////////////////////
@0
D = M
@n
M = D

@i
M = 1

@sum
M = 0

(sumloop)
	@i
	D = M
	@n
	D = D-M		//i-n
	
	@cont
	D;JGT
	
	@i
	D = M
	A = D
	D = M
	
	@sum
	M = D+M
	
	@i
	M = M+1
	
	@sumloop
	0;JMP
	
(cont)
@sum
D = M
@0
M = D

(end)
@end
0;JMP