;Scrivere un sottoprogramma che riceve in R1 e R2 due numeri num1 e num2 in complemento a due, li
;confronta, restituisce in R0 la seguente indicazione:
;R0 = -1 se num1 < num2
;R0 = 0 se num1 = num2
;R0 = +1 se num1 > num2
	.orig	x3000
;qui codice del main
	and	r1,r1,#0
	add	r1,r1,#10
	and	r2,r2,#0
	add	r2,r2,#13
	jsr 	ese1v1
stoqui 	brnzp 	stoqui

;qui dati del main

;**************************
;QUI codice

ese1v1	st	r3,salvaR3	;save the value of R3 in the memory so i can use it 
	
	and	r3,r3,#0
	
	and 	r0,r0,#0

	not	r2,r2		;negative of the number
	add	r2,r2,#1

	add	r3,r1,r2	;add the r1 and r2

	brz	zero
	brp	posi
	brn	nega

posi  	add	r0,r0,#2
nega	add	r0,r0,#-1
zero	ld	r3,salvaR3	;load the value back to R3
	ret

;dati del sottoprogramma
salvaR3	.blkw	1



	.end