	AREA PROG,CODE,READONLY
ONES		RN 1
ZEROS		RN 3
NUM			RN 4
ENTRY
	MOV NUM,#0xAA
	MOV ZEROS,#0
	MOV ONES,#0
	MOV R5,#0x40000000
LOOP
	LSRS NUM,#1
	ADDCS ONES,#1
	ADDCC ZEROS,#1
	CMP NUM,#0
	BNE LOOP
	STR ZEROS,[R5]
	STR ONES,[R5,#4]
GO B GO
	END