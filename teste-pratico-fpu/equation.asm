; @author: Isaac Vinicius - 500935

extern scanf
extern printf

section .data
scanfValue db "%f", 0ah, 0
printfValue db "%f", 0ah, 0

section .bss
raio resd 1
result resq 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    ;input
    push raio
    push scanfValue
    call scanf
    add esp, 8
    
    ;salvando valor de raio na pilha
    push dword[raio]; -> endereco -8
    call volumeEsfera
    fstp qword[result]
    
    ;output
    push dword[result+4]
    push dword[result]
    push printfValue
    call printf
    add esp, 12
    
    mov esp, ebp
    pop ebp
    xor eax, eax
;--------------------------------------
;funcao
;--------------------------------------
    volumeEsfera:
    ;atualizando topo da pilha
    push ebp
    mov ebp, esp
    sub esp, 8
    
    ;endereco para elementos da relacao 4/3*pi*r^3
    mov dword[esp-4], 4
    mov dword[esp-8], 3
    
    FINIT
    fld dword[ebp+8]    ;endereco do raio na pilha em st0 
    fmul st0, st0       ;raio*raio
    fmul dword[ebp+8]   ;raio*raio*raio (raio^3)
    fldpi               ;st0 = pi 3.141592... -> st1 = raio^3
    
    fmul                ;st0 * st1
    fimul dword[esp-4]  ;st0 = 4*pi*r^3 -> st1 = raio^3
    fidiv dword[esp-8]  ;st0 = (4*pi*r^3)/3 -> st1 = raio^3
    
    mov esp, ebp
    pop ebp
    ret 
    