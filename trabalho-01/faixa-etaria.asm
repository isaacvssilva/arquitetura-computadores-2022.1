; Isaac Vinicius - 500035
; Mellyssa Alves - 495589

extern scanf        ;biblioteca padrao C
extern printf       ;biblioteca padrao C

section .data
printfValue db "%s", 0ah, 0
scanfValue db "%d"

;variaveis para classicar de acordo com a idade
idadeInvalida db "Idade Inválida",0
jovens db "Jovem", 0
adultos db "Adulto", 0
idosos db "Idoso", 0

section .bss
iNum resd 1         ;Variavel reservando espaco para input de 4 Bytes
vet resd 100        ;Variavel reservando espaco para input de 4 Bytes para o vetor

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ;input
    push iNum       ;empilhando a qtd de elementos
    push scanfValue ;empilhando o parametro do scanf %d para receber a qtd de elementos
    call scanf      ;chamando funcao scanf
    add esp, 8      ;desempilhando, (cada push, 4 Bytes)
    
    mov ecx, [iNum] ;movendo elemento da variavel iNum para o contador (qtd loop)
    mov edi, vet    ;movendo o endereco do vetor para o registrador de indice de destino
    
    
    ;loop para leitura da idade
    @L1:
    push ecx        ;empilhando o contador(qtd de loop)
    push edi        ;empilhando o edi contendo o endereco do vetor
    push scanfValue ;empilhando o parametro do scanf %d para receber elementos do vetor
    call scanf      ;chamando a funcao scanf
    add esp, 8      ;desempilhando edi e scanfValue
    pop ecx         ;desempilhando ecx
    add edi, 4      ;add edi para poder acessar o proximo endereco do vetor
    loop @L1
    
    
    ;criando loop para imprimir chamando a funcao idade
    mov ecx, [iNum] ;movendo elemento da variavel iNum para o contador (qtd loop)
    mov ebx, 0      ;usando ebx para ser o indice, cada loop ira ser incrementado
    
    @L2:
    push ecx
    mov eax, [vet + ebx * 4];movendo para eax os elementos do vetor e alocando o tamanho em 4 bytes
    call idade              ;chamando a funcao idade para imprimir as condicoes
    inc ebx                 ;incrementando ebx para ser a posicao seguinte
    pop ecx
    loop @L2
     
    xor eax, eax
    ret
    
;---------------------------------------------------    
idade:
;Receives: um inteiro que determina a quantidade e idades a serem inseridas
;return:
    ;a classificacao das idades. Caso a idade seja menor que zero, retorne a mensagem Idade invalida
    ;Idade ate 19 anos, retorne a mensagem Jovens
    ;Idade ate 59 anos, retorne a mensagem Adultos
    ;Caso contrario, retorne a mensagem Idosos
;---------------------------------------------------

cmp eax, 0 ;comparando idade salvo em eax, com zero
jl .menorQzero;se for menor que zero, pula pra etiqueta e printa idadeInvalida

cmp eax, 19 ;comparando idade salvo em eax, com zero
jle .menorQ19;se for menor ou igual a 19, printa jovens

cmp eax, 59 ;comparando idade salvo em eax, com zero
jle .menorQ59;se for menor ou igual a 59, printa adultos

jmp .maiorQ60;se caso nao for nenhuma das condicoes anteriores, printa idosos
    
.menorQzero:
    pushad
    push idadeInvalida
    push printfValue
    call printf
    add esp, 8
    popad
    jmp .fim
    
.menorQ19:
    pushad
    push jovens
    push printfValue
    call printf
    add esp, 8
    popad
    jmp .fim

.menorQ59:
    pushad
    push adultos
    push printfValue
    call printf
    add esp, 8
    popad
    jmp .fim

.maiorQ60:
    pushad
    push idosos
    push printfValue
    call printf
    add esp, 8
    popad
    
.fim:                                    
ret