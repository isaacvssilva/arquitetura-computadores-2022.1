%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue db "%d"
printfvalue db "%dx%d = %d", 0ah, 0x00
aux dd 0; variavel auxiliar para ser o multiplicando

section .bss
value resd 1        ;Variavel reservando espaco para input de 4 Bytes

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push value
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)

    mov eax, 0  ;zerando eax
    mov ecx, 11 ;registrador contador (qtd loop)
    
    ;comparando o operando de destino ao operando de origem
    cmp ecx, 11
    je .salta
       
    .L1:
    add eax, [value]
    .salta:
    ;printf("%d x %d = %d",iNum, i, iNum*i)
    pushad
    push eax            ;iNum*i 
    push dword[value]   ;multiplicador -> iNum
    push dword[aux]     ;multiplicando -> i
    push printfvalue    
    call printf         ;chamando funcao print para imprimir eax
    add esp, 16         ;esvaziando pilha (cada push, 4 Bytes)
    popad
    
    inc dword[aux]
    loop .L1

    xor eax, eax
    ret