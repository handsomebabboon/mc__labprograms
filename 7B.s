	AREA PROG,CODE,READONLY
LOWERNIBBLE			RN 1
UPPERNIBBLE			RN 2
RADIX				RN 3
LOWERNIBBLEMASK		RN 4
UPPERNIBBLEMASK		RN 5
RESULT				RN 6
NUMBYTES			RN 7
BYTES				RN 8

ENTRY				
	MOV RADIX,#10
	MOV UPPERNIBBLEMASK,#0xF0
	MOV LOWERNIBBLEMASK,#0X0F
	MOV RESULT,#0
	MOV NUMBYTES,#4
	
	LDR R0,=NUMBER
	ADD R0,NUMBYTES
	SUB R0,#1
	
LOOP
	LDRB BYTES,[R0]
	SUB R0,R0,#1
	AND UPPERNIBBLE,UPPERNIBBLEMASK,BYTES
	AND LOWERNIBBLE,LOWERNIBBLEMASK,BYTES
	
	LSR UPPERNIBBLE,#4
	
	MLA RESULT,RADIX,RESULT,UPPERNIBBLE
	MLA RESULT,RADIX,RESULT,LOWERNIBBLE
	SUBS NUMBYTES,NUMBYTES,#1
	BNE LOOP
GO B GO
NUMBER		DCD	 0x00000127
	END
	