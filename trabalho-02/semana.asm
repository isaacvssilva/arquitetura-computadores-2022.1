; @author: Isaac Vinicius - 500935

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue db "%d", 0ah, 0
printfValue db "%s", 0ah, 0

selecao_tabela dd 1
dd Domingo

tamEntrada equ $-selecao_tabela
dd 2
dd Segunda

dd 3
dd Terca

dd 4
dd Quarta

dd 5
dd Quinta

dd 6
dd Sexta

dd 7
dd Sabado

qtdEntrada equ ($-selecao_tabela)/tamEntrada
msgDomingo db "Domingo", 0
msgSegunda db "Segunda-feira", 0
msgTerca   db "Terça-feira", 0
msgQuarta  db "Quarta-feira", 0
msgQuinta  db "Quinta-feira", 0
msgSexta   db "Sexta-feira", 0
msgSabado  db "Sabado", 0

section .bss
iNum resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging

    push iNum
    push scanfValue
    call scanf
    add esp, 8
    
    mov eax, 0    
    mov eax, selecao_tabela
    mov ecx, qtdEntrada
    
    @L1:
    ;push eax
    mov ebx, [eax]
    cmp dword[iNum], ebx;valor inserido igual o da tabela?
    jne @L2
    
    ;se for igual, chama o procedimento, e imprime mensagem
    call [eax+4]
    push edx
    push printfValue
    call printf
    add esp, 8
    
    ;finaliza loop
    jmp @L3
    
    @L2:
    add eax, tamEntrada
    dec ecx
    jnz @L1
    ;loop @L2
    
    @L3:
    xor eax, eax
    ret   
      
;----------------------------------------
;Procedimentos
;receives: nenhum
;return: mensagem referente ao dia em edx
;----------------------------------------
Domingo:
mov edx, msgDomingo
ret

Segunda:
mov edx, msgSegunda
ret

Terca:
mov edx, msgTerca
ret

Quarta:
mov edx, msgQuarta
ret

Quinta:
mov edx, msgQuinta
ret

Sexta:
mov edx, msgSexta
ret

Sabado:
mov edx, msgSabado
ret
;--------------------------