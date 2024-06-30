//complement.asm

//NAME: Juan Figueroa
//UIN: 626003173 

//This asm checks whether two numbers a and b are complements;
//that is, each bit active in a is inactive b, and vice-versa.
//Other ways of saying this are:
// (a & b) = 0 and (a | b) = 0b111..., where & is bitwise AND and | is bitwise OR
// (a + b) = -1
//The two numbers are given in RAM[0] and RAM[1]
//and the result will be stored to RAM[2].
//The result should be 1 if a and b are complements,
//and 0 if they are not.
//Write your code below.
///////////////////////////////////////////////////////////////////////////////

@0
D = M
@1
D = D + M	// D equal to RAM[0]+RAM[1] 
D = D + 1	// D+1, so complement will be D=0

@LABEL1
D;JEQ
@LABEL2
D;JNE

(LABEL1)
@2
M = 1
@end
0;JMP

(LABEL2)
@2
M = 0

(end)
@end
0;JMP