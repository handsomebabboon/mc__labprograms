	AREA PROG,CODE,READONLY
NUMBER RN 1
SUM RN 2

ENTRY
	MOV NUMBER,#1
	MOV SUM,#1
	
LOOP
	ADD NUMBER,NUMBER,#1
	ADD SUM,SUM,NUMBER
	
	CMP NUMBER,#5
	BNE LOOP
STOP B STOP
	END