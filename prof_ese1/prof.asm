;Scrivere un sottoprogramma che riceve in R1 e R2 due numeri num1 e num2 in complemento a due, li
;confronta, restituisce in R0 la seguente indicazione:
;R0 = -1 se num1 < num2
;R0 = 0 se num1 = num2
;R0 = +1 se num1 > num2
	.orig	x3000
;qui codice del main
	lea	r1,num1
	lea	r2,num2

	jsr 	ese1v1

	lea	r1,num1
	lea	r2,num1
	jsr 	ese1v1

	lea	r1,num2
	lea	r2,num1
	jsr 	ese1v1
stoqui 	brnzp 	stoqui

;qui dati del main
num1 	.fill 	47
num2 	.fill 	-79
;**************************
;QUI codice

ese1v1	
	ldr 	r1,r1,#0
	ldr	r2,r2,#0
	not	r0,r2		;negative of the number
	add	r0,r0,#1

	add	r0,r1,r0	;add the r1 and r2
	
	brn	min
	brz 	ugu
	brp	mag

min	and	r0,r0,#0
	add	r0,r0,#-1
	ret

ugu	
;and	r0,r0,#0	non serve
	ret	

mag	and	r0,r0,#0
	add	r0,r0,#1
	ret

;dati del sottoprogramma

	.end