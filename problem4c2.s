@ Cau 4: Tinh tong cac phan tu trong ma tran (cach don gian nhat)
	.syntax unified

@ ===== Doan du lieu =====
	.data
matrix:	.word	 5, -3,  12,  7		@ hang 0
	.word	-8, 20,   1,  0		@ hang 1
	.word	 9,  4, -15,  6		@ hang 2
	.word	10, -2,   3, 25		@ hang 3
.equ SIZE, 16            @ so phan tu = 4 hang x 4 cot

@ Doan ma lenh
.text
.global _start
_start:
    MOV R0, #0         @ R0 = sum = 0
    LDR R1, =matrix    @ R1 = dia chi dau ma tran
    MOV R3, #SIZE      @ R3 = count = 16

loop: 
    LDR R5, [R1], #4 @ R5 = element at R1, then R1 += 4
    ADD R0, R0, R5 @ sum = sum + R5
    SUBS R3, R3, #1 @ count -= 1, update count
    BGT loop @ if count > 0 then repeat

done:
    MOV R7, #1        @ syscall exit
    SVC #0          @ call operating system, R0 = sum
    