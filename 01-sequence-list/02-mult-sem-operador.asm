%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue DB "%d"

section .bss
num1 resd 1         ;Variavel reservando espaco para input de 4 Bytes
num2 resd 1         ;variavel reservando espaco para input de 4 Bytes
num3 resd 1         ;Variavel reservando espaco para input de 4 Bytes
aux1 resd 1         ;Variavel auxiliar reservando espaco de 4 Bytes
aux2 resd 1         ;Variavel auxiliar reservando espaco de 4 Bytes

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ;input em c: scanf("%d", &iNum1)
    ;logica em assembly: da direita para a esquerda
    
    push num1       ;instrucao push para input no endereco de num1 na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    push num2       ;instrucao push para input no endereco de num2 na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    push num3       ;instrucao push para input no endereco de num3 na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    mov eax, 0      ;zerando eax
    mov ecx, [num2] ;registrador contador (qtd loop)
    
    .L1:
    add eax, [num1] ;somando conteudo da variavel num1 com eax
    mov [aux1], eax ;movendo conteudo de eax para a variavel auxilar
    loop .L1        ;finalizando loop (decremento automatico)

    mov eax, 0      ;zerando abx
    mov ecx, [num3] ;registrador contador (qtd loop)
    
    .L2:
    add eax, [aux1] ;somando conteudo da variavel aux1 com eax
    mov [aux2], eax ;movendo conteudo de eax para a variavel auxilar
    loop .L2        ;finalizando loop (decremento automatico)
    
    mov eax, [aux2] ;movendo conteudo da variavel auxiliar aux2 para eax
    push eax        ;instrucao push em eax (acumulador) na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d na pilha
    call printf     ;chamando funcao print para imprimir eax
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    xor eax, eax
    ret
