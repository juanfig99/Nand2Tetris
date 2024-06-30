//Starter Test stimulus file for AddSub10 

load AddSub10.hdl,
output-file AddSub10.out,
compare-to AddSub10.cmp,
output-list a%B1.10.1 b%B1.10.1 sub%B1.1.1 out%B1.10.1 overflow%B4.1.4;

set a %B0000000000,
set b %B0000000000,
set sub 0,
eval,
output;

//fill in more test cases here to thoroughly check correctness of your chip
set a %B0110001000,
set b %B0011110001,
set sub 0,
eval,
output;

set a %B1000000000,
set b %B0000000011,
set sub 0,
eval,
output;

set a %B1000000000,
set b %B0000000011,
set sub 1,
eval,
output;

set a %B0110001000,
set b %B0011110001,
set sub 1,
eval,
output;

set a %B0110001110,
set b %B0111111111,
set sub 0,
eval,
output;

set a %B0110001110,
set b %B0111111111,
set sub 1,
eval,
output;

set a %B1000001000,
set b %B0000011111,
set sub 1,
eval,
output;

set a %B0000000000,
set b %B0000000000,
set sub 1,
eval,
output;