%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue db "%d"

section .bss
kilo resd 1         ;Variavel reservando espaco para input de 4 Bytes
grama resd 1        ;Variavel reservando espaco de 4 Bytes

section .text
global CMAIN
CMAIN:
    ;input em c: scanf("%d", &kilo)
    ;logica em assembly: da direita para a esquerda
    
    push kilo       ;instrucao push para input no endereco de kilo na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    mov eax, 0      ;zerando eax
    mov ecx, 1000   ;registrador contador (qtd loop)
    
    .L1:
    add eax, [kilo] ;somando conteudo da variavel kilo com eax
    mov [grama], eax;movendo conteudo de eax para a variavel grama
    loop .L1        ;finalizando loop (decremento automatico)
    
    mov eax, 0      ;zerando eax
    mov eax, [grama];movendo conteudo da variavel grama para eax
    push eax        ;instrucao push em eax (acumulador) na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d na pilha
    call printf     ;chamando funcao print para imprimir eax
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)

    xor eax, eax
    ret