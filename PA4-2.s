	@ Factorial
	@ Taylor Stephenson: PA4-2: 10-22-2018: does some factorials

	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	LDR	R0, =prompt	@ Get address of prompt
	BL	printf		@ Print prompt to screen
	LDR	R0, =in		@ Get addr of input format string
	LDR	R1, =n		@ Get addr of n
	BL	scanf		@ Put value in n using scanf
	LDR	R0, =n		@ Addr of n into R0
	LDR	R0, [R0]	@ n is now in R0
	@-------------
	@ Your code goes here.  Put n! in R2
	@-------------
	MOV	R2, #1		@ initialize R2
	CMP	R0, #0		@ checks if n is 0
	MOVEQ	R2, #1		@ factorial is 1

lorp:
	CMP	R0, #1		@ checks if n is greater than
	MULGE	R2, R0, R2	@ or equal to 1. if so, mul R0 by R2 into R2
	SUBGE	R0, R0, #1	@ subtracts 1 from R0
	BGE	lorp		@ lorp



	@-------------
	@ Do NOT alter code past this line.
	@-------------
	MOV	R1, R2
	LDR	R0, =out
	BL 	printf
	POP	{PC}
	
.data
n:	.word 0
prompt:	.asciz "Enter n: "
in:	.asciz "%d"
out:	.asciz "factorial is: %d\n"

