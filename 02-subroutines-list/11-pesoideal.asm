; @author: Isaac Vinicius - 500935

extern scanf
extern printf

section .data
scanfValue db "%d", 0ah, 0
printfValue db "%f", 0ah, 0

section .bss
iNum resd 1
result resq 1

section .text
global main
main:
    push ebp
    mov ebp, esp
    
    push iNum
    push scanfValue
    call scanf
    add esp, 8
    
    push dword[iNum]
    call sequencia
    
    
    fim:
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
    
    sequencia:
    push ebp
    mov ebp, esp
    sub esp, 8
    
    mov dword[ebp - 4], 1
    mov dword[ebp - 8], 3
    
    ;enquanto for 1
    .L1:
    cmp dword[iNum], 1 ;input >= 1?
    jae .continua
    jmp fim
    
    .continua:
    finit
    fild dword[ebp - 8]; st2 = 3
    fild dword[ebp - 4]; st1 = 1
    fild dword[ebp + 8]; st0 = input
    
    fmul st0, st0     ; st0 = N²
    fadd st0, st1     ; st0 = (N² + 1)
    
    fild dword[ebp + 8];st0 = input -> st1 = (N² + 1) -> st2 = 1 -> st3 = 3
    fadd st0, st3      ;st0 = (N + 3)
    fdivr st0, st1     ;(n² + 1) / (n + 3) -> origem pelo destino
    fstp qword[result]
    
   
    push DWORD[result + 4]
    push DWORD[result]
    push printfValue
    call printf
    add esp, 12
        
    mov esp, ebp
    pop ebp
    ret 