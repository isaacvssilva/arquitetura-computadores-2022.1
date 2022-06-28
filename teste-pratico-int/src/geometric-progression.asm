; @author: Isaac Vinicius - 500935

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue db "%d", 0ah, 0
printfValue db "%d", 0ah, 0

section .bss
iNum1 resd 1
iNum2 resd 1
section .text
global main
main:
    mov ebp, esp; for correct debugging

    ;input
    push iNum1
    push scanfValue
    call scanf
    add esp, 8
    
    ;input
    push iNum2
    push scanfValue
    call scanf
    add esp, 8
    
    mov eax, 0
    mov ecx, 9
    mov eax, dword[iNum2]
    
    ;loop para potencia
    @L1:
    mov ebx, dword[iNum2]
    mul ebx
    loop @L1
    ;q^n-1
    dec eax
    
    ;formula: a1 * (q^n-1) / (q-1)
    
    ;a1 * (q^n-1)
    mov edx, dword[iNum1]
    mul edx
    
    ;(q-1)
    mov ebx, dword[iNum2]
    dec ebx
    div ebx
    
    ;push eax
     
    ;push edx
    push eax
    push printfValue
    call printf
    add esp, 8
    
    xor eax, eax
    ret