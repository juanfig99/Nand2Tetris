// Filename = calc.tst

load calc.asm,
output-file calc.out,
compare-to calc.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2 RAM[4]%D2.6.2 RAM[1024]%D2.6.2;

set RAM[0] 14, // Set test arguments
set RAM[1] 5,
set RAM[2] 1,  
set RAM[3] 0; // Test that program initialized to 0
repeat 1000 {
  ticktock;
}
set RAM[0] 14,   // Restore arguments in case program used them as loop counter
set RAM[1] 5,
set RAM[2] 1,
output;

set PC 0,
set RAM[0] 15, // Set test arguments
set RAM[1] 4,
set RAM[2] 2,  
set RAM[3] 0; // Test that program initialized to 0
repeat 1000 {
  ticktock;
}
set RAM[0] 15,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 2,
output;

set PC 0,
set RAM[0] -15,  // Set test arguments
set RAM[1] -4,
set RAM[2] 3,  
set RAM[3] 0; // Test that program initialized to 0
repeat 1000 {
  ticktock;
}
set RAM[0] -15,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 3,
output;

set PC 0,
set RAM[0] 14, // Set test arguments
set RAM[1] 4,
set RAM[2] 4,  
set RAM[3] 0; // Test that program initialized to 0
repeat 1000 {
  ticktock;
}
set RAM[0] 14,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 4,
output;

// check if they handle incorrect inputs

set PC 0,
set RAM[0] -15,
set RAM[1] -4,
set RAM[2] 3,  
set RAM[3] 0; 
repeat 1000 {
  ticktock;
}
set RAM[0] -15,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 3,
output;