; programma di somma elementi di un array terminato del "tappo" 0

	.orig	x3000
	lea	r0,array	; insert address in r0
	and 	r2,r2,#0	; r0 = 0
Ciclo	ldr	r1,r0,#0	; get the data from the memory
	brz	fine		;end the cycle
	add 	r2,r2,r1	;get total
	add	r0,r0,#1	; move to the next the cell
	brnzp 	Ciclo		; go back up to ciclo
fine    st	r2,result	;save the r2 in the memory

stoqui	brnzp	stoqui		;move on the same will it won't translate the next line that isn't a code 

;data area

array	.fill	15
	.fill	-27
	.fill	13
	.fill	5
	.fill	0

result	.blkw	1

	.end