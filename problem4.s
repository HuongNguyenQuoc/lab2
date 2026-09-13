@ Cau 4: Tinh tong cac phan tu trong ma tran
.syntax unified

@ Doan du lieu
.data
matrix:	.word	 5, -3,  12,  7		@ hang 0
	.word	-8, 20,   1,  0		@ hang 1
	.word	 9,  4, -15,  6		@ hang 2
	.word	10, -2,   3, 25		@ hang 3
.equ ROWS, 4                @ so hang
.equ COLS, 4                @ so cot

@ Doan ma lenh
.text
.global _start
_start:
    MOV R0, #0         @ R0 = sum = 0
    LDR R1, =matrix    @ R1 = dia chi dau ma tran
    MOV R6, #COLS @ R6 = so cot (de nhan)
    MOV R2, #0         @ R2 = i = 0 (chi so hang)

row_loop:
    MOV R3, #0        @ R3 = j = 0 (chi so cot), moi hang bat dau lai tu cot 0

col_loop:
    MUL R4, R2, R6 @ R4 = i * COLS
    ADD R4, R4, R3 @ R4 = i * COLS + j (chi so phan tu)
    LDR R5, [R1 , R4, LSL #2] @ R5 = phan tu tai R1 + R4*4
    ADD R0, R0, R5 @ sum = sum + R5
    ADD R3, R3, #1 @ j = j + 1
    CMP R3, #COLS @ so sanh j voi so cot
    BLT col_loop @ j < COLS thi sang cot tiep

    ADD R2, R2, #1 @ i = i + 1
    CMP R2, #ROWS @ so sanh i voi so hang
    BLT row_loop @ i < ROWS thi sang hang tiep

done:    
    MOV R7, #1        @ syscall exit
    SVC #0          @ goi he dieu hanh, R0 = tong
