/* Printing two floating point numbers */
	
	.global	main
	.func main
main:
	SUB SP, SP, #16		@ Make space on stack
	
	LDR R1, =pi		@ Get addr of pi
	VLDR S14, [R1]
	VCVT.F64.F32 D3, S14	@ pi is now in S14 and D3

	LDR R1, =radius		@ Get addr of radius
	VLDR S15, [R1]
	VCVT.F64.F32 D4, S15	@ radius is now in S15 and D4

	@@@@@@@@@@@@@@@@@@@
	@@ Here you compute area and circumference
	@@ Using the VFP instructions
	@@ If you want to reuse the code below to print
	@@ your results, circumference should be in D2
	@@ and area in D1
	@@@@@@@@@@@@@@@@@@@

	VMOV.F64.F64 D2, D3	@ you will want to delete this
	VMOV.F64.F64 D1, D4	@ you will want to delete this
	
	LDR R0, =string		@ point R0 to string
	VMOV R2, R3, D2		@ first value
	VSTR D1, [SP]		@ second on stack
	BL printf		
	ADD SP, SP, #16		@ restore stack

	MOV R7, #1		@ Exit Syscall
	SWI 0	

	.data
pi:	.float 3.1415
radius:	.float 2.5
string:	.asciz "circumference of circle: %f, area: %f\n"

