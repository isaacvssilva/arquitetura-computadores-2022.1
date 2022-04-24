%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue DB "%d"

section .bss
lado resd 1         ;Variavel reservando espaco para input de 4 Bytes
result resd 1       ;Variavel reservando espaco de 4 Bytes

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ;input em c: scanf("%d", &iNum1)
    ;logica em assembly: da direita para a esquerda
    
    push lado       ;instrucao push para input no endereco da variavel lado na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    mov eax, 0      ;zerando eax
    mov ecx, [lado] ;registrador contador (qtd loop)
    
    .L1:
    add eax, [lado]     ;somando conteudo da variavel lado com eax
    mov [result], eax   ;movendo conteudo de eax para a variavel result
    loop .L1            ;finalizando loop (decremento automatico)
    
    mov eax, 0
    mov eax, [result]   ;movendo conteudo da variavel result para eax
    push eax            ;instrucao push em eax (acumulador) na pilha
    push scanfValue     ;primeiro parametro do scanf em C: %d na pilha
    call printf         ;chamando funcao print para imprimir eax
    add esp, 8          ;esvaziando pilha (cada push, 4 Bytes)

    xor eax, eax
    ret