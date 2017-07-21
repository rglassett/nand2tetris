// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// initialize product to 0
@R2
M=0

// terminate if any inputs are 0
@R0
D=M
@End
D;JEQ

@R1
D=M
@End
D;JEQ

// add R0 to R2 for R1 repetitions
@R1
D=M
@additionsRemaining
M=D

(Loop)

@additionsRemaining
D=M
@End
D;JEQ

@R0
D=M
@R2
M=D+M

@additionsRemaining
M=M-1
@Loop
0;JMP

// infinite loop to signal the program is done
(End)
@End
0;JMP
