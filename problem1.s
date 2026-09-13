@ Cau 1: Tinh tong cac phan tu trong chuoi so
.syntax unified

@ ===== Doan du lieu =====
.data
nums: .word 5, -3, 12, 7, -8, 20, 1, 0, 9, 4 @ mang 10 phan tu, moi phan tu 4 byte
.equ MAX, 10 @ so phan tu

@ ===== Doan ma lenh =====
.text
.global _start
_start:
    MOV R0, #0 @ R0 = sum = 0

    LDR R1, =nums @ R1 = dia chi dau mang
    MOV R2, #0 @ R2 = offset = 0
    LDR R3, =MAX @ R3 = count = 10

do1:
    LDR R4, [R1, R2] @ R4 = phan tu tai (R1 + R2)
    ADD R0, R0, R4 @ sum += R4
    ADD R2, R2, #4 @ offset += 4
    SUBS R3, R3, #1 @ count -= 1, cap nhat co
    BGT do1 @ count > 0 thi lap lai

    MOV R7, #1 @ syscall exit
    SVC #0 @ goi he dieu hanh, R0 = ma thoat
