@ Cau 2: Tim gia tri lon nhat va nho nhat trong chuoi so
.syntax unified

@ ===== Doan du lieu =====
.data
nums: .word 5, -3, 12, 7, -8, 20, 1, 0, 9, 4	@ mang 10 phan tu, moi phan tu 4 byte
.equ MAX, 10 @ so phan tu

@ ===== Doan ma lenh =====
.text
.global _start

_start:
    LDR R1, =nums @ R1 = dia chi dau mang
    LDR R5, [R1] @ R5 = phan tu dau tien, khoi tao max = min = nums[0]
    LDR R6, [R1] @ R6 = min = nums[0]
    MOV R2, #4 @ R2 = offset = 4
    LDR R3, =MAX @ R3 = count = 10
    SUBS R3, R3, #1 @ count = 9
    BLE done @ neu count <= 0 thi ket thuc

loop:
    LDR R4, [R1, R2] @ R4 = phan tu tai (R1 + R2)
    CMP R4, R5
    BLE check_min @ R4 <= max never mind
    MOV R5, R4 @ max = R4

check_min:
    CMP R4, R6
    BGE next @ R4 >= min never mind
    MOV R6, R4 @ min = R4

next:
    ADD R2, R2, #4 @ offset += 4
    SUBS R3, R3, #1 @ count -= 1
    BGT loop @ count > 0 thi lap lai

done:
    MOV R0, R5
    MOV R7, #1 @ syscall exit
    SVC #0 @ goi he dieu hanh, R0 = ma thoat