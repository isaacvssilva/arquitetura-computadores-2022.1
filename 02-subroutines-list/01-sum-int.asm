%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue db "%d"
printfValue db "%d"

section .bss
iNum resd 1        ;Variavel reservando espaco para input de 4 Bytes

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    ;C -> scanf("%d", &iNum) -> Assembly: direita para a esquerda
    
    push iNum
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    call sumInt     ;chamando a funcao sumInt na main
    push eax        ;instrucao push em eax (acumulador) na pilha
    push printfValue
    call printf     ;chamando funcao print para imprimir eax
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    ret
    
;----------------------------------------------------------
sumInt:
;Receives: um inteiro 
;return: soma dos numeros inteiros existentes entre 1 e N
;----------------------------------------------------------
    mov eax, [iNum] ;movendo conteudo da variavel iNum para eax
    mov ecx, eax    ;movendo o conteudo de eax para ecx (qtd loop)
    mov ebx, 1      ;usando ebx para inicializar em 1 e atualizar no incremento
    mov eax, 0      ;zerando eax
    
    @L1:
    add eax, ebx    ;somando eax com ebx
    inc ebx         ;incrementando ebx a cada loop
    loop @L1
    ret             ;retornando a funcao