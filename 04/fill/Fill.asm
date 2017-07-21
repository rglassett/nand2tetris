// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(Main)

// draw all addresses between SCREEN and 24576 (KEYBOARD)
@24576
D=A
@SCREEN
D=D-A
@drawsRemaining
M=D

// start the cursor at SCREEN
@SCREEN
D=A
@cursor
M=D

// check keyboard input and branch to either Fill or Clear
@24576
D=M
@Fill
D;JGT
@Clear
D;JEQ

(Fill)
@fillValue
M=-1

@Draw
0;JMP

(Clear)
@fillValue
M=0

@Draw
0;JMP

(Draw)
@fillValue
D=M

@cursor
A=M
M=D
@cursor
M=M+1

@drawsRemaining
M=M-1
D=M

@Draw
D;JGT

@Main
0;JMP
