
	@ Taylor Stephenson: PA4-1: 10-22-2018: adds all values between two values
	
	.extern printf
	.extern scanf
	.global main
	.func main
main:
	PUSH	{LR}
	LDR	R2, =startval 	@ get addr of startval
	LDR	R2, [R2]	@ Load startval -> R2
	LDR	R3, =endval	@ get addr of endval
	LDR	R3, [R3]	@ Load endval -> R3
	@-------------
	@ Your code begins here
	@ Your code must put the final answer
	@ in R1.
	@-------------
	MOV	R1, #0		@ puts 0 in R1
_loop:
	CMP	R2, R3		@ If R2<=R3
	ADDLE	R1, R1, R2	@ Add R2 to R1 and then
	ADDLE	R2, R2, #1	@ Add 1 to R2
	BLE	_loop		@ reiterate loop
	
	
	@-------------
	@ Do NOT alter code past this line.
	@-------------
	LDR	R0, =out
	BL	printf
	POP	{PC}
	
.data
startval:	.word 1
endval:		.word 5
out:		.asciz "%d\n"
