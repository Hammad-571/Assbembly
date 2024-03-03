	.orig x3000
	ld r0,num1
	ld r1,num2
	jsr sottop
	st r0,spazio1
	st r1,spazio2
stoqui	brnzp stoqui



spazio1	.blkw 1
spazio2	.blkw 1
num1	.fill x8000
num2	.fill -1
;----------------------------------------------------

sottop	add r0,r0,#0			
	brz ris1
	brp p2				;if r0 is positive
	brn p3				;if r0 is negative

ris1	add r1,r1,r0
	and r0,r0,#0
	brnzp fine

;if r0 is positive

p2	add r1,r1,#0
	brz ris1
	brp ris2			
	brn ris1

;if r0 is negative

p3	add r1,r1,#0
	brz ris1			
	brp ris1
	brn ris3			

;if r0 and r1 are positive 

ris2	add r1,r1,r0			;both are positive and the sum is negative then over flow
	brn risf1
	and r0,r0,#0
	brnzp fine

;both are positive and the sum is negative then over flow
	
risf1	and r0,r0,#0
	add r0,r0,#1
	brnzp fine

;if r0 and r1 are negative 

ris3	add r1,r1,r0			
	brp risf2
	and r0,r0,#0
	brnzp fine

;both are negative and the sum is positive then underflow
	
risf2	and r0,r0,#0
	add r0,r0,#-1
	brnzp fine

fine	ret
	.end