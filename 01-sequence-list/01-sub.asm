%include "io.inc"

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
scanfValue DB "%d"

section .bss
num1 resd 1         ;Variavel reservando espaco para input de 4 Bytes
num2 resd 1         ;variavel reservando espaco para input de 4 Bytes

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ;input em c: scanf("%d", &iNum1)
    ;logica em assembly: da direita para a esquerda
    
    push num1       ;instrucao push para input no endereco de n1 na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    push num2       ;instrucao push para input no endereco de n1 na pilha
    push scanfValue ;primeiro parametro do scanf em C: %d
    call scanf      ;insutracao call para chamar a funcao scanf
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
    
    mov eax, [num1] ;Movendo conteudo da variavel n1 para o registrador eax
    mov ebx, [num2] ;Movendo conteudo da variavel n2 para o registrador ebx
    sub eax, ebx    ;Subtraindo (num1 - num2)
    
    push eax        ;instrucao push para eax (acumulador)
    push scanfValue ;primeiro parametro do scanf em C: %d
    call printf     ;chamando funcao print para imprimir eax
    add esp, 8      ;esvaziando pilha (cada push, 4 Bytes)
      
    xor eax, eax
    ret