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

    push ebp
    mov ebp, esp
    
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
   
    mov ebx, 0 ;limpando ebx
    
    ;salvando input na pilha e chamando a funcao
    push dword[iNum2]   ;-12 -> endereco na pilha
    push dword[iNum1]   ;-8  -> endereco na pilha
    call logN           ;-4  -> endereco na pilha
    add esp, 8
    
    ;imprimindo resultado
    push ebx
    push printfValue
    call printf
    add esp, 8
    
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
;--------------------------------------
;funcao
;--------------------------------------
    logN:
    ;atualizando topo da pilha
    push ebp
    mov ebp, esp
    
    ;endereco de iNum2 na nova pilha
    mov eax, dword[ebp+12]  
    sub eax, 1
    
    ;endereco de iNum1 na nova pilha
    cmp [ebp+8], eax ;iNum > iNum2-1? se for menor ou igual, finaliza procedimento
    ja .continua
    
    jmp .encerraFuncao
    
    .continua:
    ;se for maior
    mov edx, 0; limpando dividendo
    
    mov ecx, dword[ebp+12];endereco de iNum2 na nova pilha
    mov eax, dword[ebp+8] ;endereco de iNum1 na nova pilha
    
    ;return 1 + logN((n/b), b)
    div ecx
    push dword[ebp+12];endereco de iNum2 na nova pilha
    push eax          ;resultado da divisao salvo em eax
    call logN 
    add esp, 8
    add ebx, 1
    
    .encerraFuncao:
    mov esp, ebp
    pop ebp
    ret