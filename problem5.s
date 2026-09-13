@ Cau 5: Dem so phan tu duong, am trong ma tran (cach don gian nhat)
	.syntax unified

@ ===== Doan du lieu =====
	.data
matrix:	.word	 5, -3,  12,  7		@ hang 0
	.word	-8, 20,   1,  0		@ hang 1
	.word	 9,  4, -15,  6		@ hang 2
	.word	10, -2,   3, 25		@ hang 3
	.equ	SIZE, 16			@ so phan tu = 4 hang x 4 cot

@ ===== Doan ma lenh =====
	.text
	.global	_start
_start:
	MOV	R8, #0		@ R8 = dem so duong = 0
	MOV	R9, #0		@ R9 = dem so am = 0
	LDR	R1, =matrix	@ R1 = dia chi dau ma tran
	MOV	R3, #SIZE	@ R3 = count = 16

loop:	LDR	R5, [R1], #4	@ R5 = phan tu tai R1, roi R1 += 4
	CMP	R5, #0		@ so sanh phan tu voi 0
	ADDGT	R8, R8, #1	@ R5 > 0 thi dem duong += 1
	ADDLT	R9, R9, #1	@ R5 < 0 thi dem am += 1
	SUBS	R3, R3, #1	@ count -= 1, cap nhat co
	BGT	loop		@ count > 0 thi lap lai

done:	MOV	R0, R8		@ R0 = so phan tu duong (ma thoat)
	MOV	R7, #1		@ syscall exit
	SVC	#0		@ goi he dieu hanh
