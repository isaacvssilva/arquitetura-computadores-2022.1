extern scanf
extern printf

section .data
scanfValue db "%d", 0ah, 0
printfValue db "%d"
printRes db "%d", 0ah, 0dh, "%d", 0ah, 0dh, "%d", 0ah, 0dh, 0
contA dd 0
contB dd 0
contC dd 0

section .bss
vet resd 10
a resd 1
b resd 1
c resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov ecx, 10 ;quantidade de loop
    mov edi, vet;movendo o endereco do vetor para o registrador de indice de destino
    
    
    ;loop para leitura dos elementos
    @L1:
    push ecx        ;empilhando o contador(qtd de loop)
    push edi        ;empilhando o edi contendo o endereco do vetor
    push scanfValue ;empilhando o parametro do scanf %d para receber elementos do vetor
    call scanf      ;chamando a funcao scanf
    add esp, 8      ;desempilhando edi e scanfValue
    pop ecx         ;desempilhando ecx
    add edi, 4      ;add edi para poder acessar o proximo endereco do vetor
    loop @L1
    
    push a
    push scanfValue
    call scanf
    add esp, 8
    
    push b
    push scanfValue
    call scanf
    add esp, 8
    
    push c
    push scanfValue
    call scanf
    add esp, 8
    
    mov ebx, 0  ;usando ebx para ser o indice, cada loop ira ser incrementado
    mov ecx, 10 ;quantidade de loop
  
  @L2:
    mov eax, [a];movendo conteudo da variavel "a" para eax
    cmp eax, [vet + ebx * 4];e comparando se eh igual ao elemento da posicao atual (faz isso 10x)
    je .contA;se for igual, vai para etiqueta contA, que ira contar quantos elementos iguais
    
    mov eax, [b];movendo conteudo da variavel "b" para eax
    cmp eax, [vet + ebx * 4];e comparando se eh igual ao elemento da posicao atual (faz isso 10x)
    je .contB;se for igual, vai para etiqueta contB, que ira contar quantos elementos iguais
    
    mov eax, [c];movendo conteudo da variavel "c" para eax
    cmp eax, [vet + ebx * 4];e comparando se eh igual ao elemento da posicao atual (faz isso 10x)
    je .contC;se for igual, vai para etiqueta contB, que ira contar quantos elementos iguais

    .retornaLoop:
    inc ebx ;incrementando ebx para ser a posicao seguinte
    loop @L2
    
    ;empilhando as variaveis com a qtd de elementos iguais na ordem inversa 
    push dword[contC]
    push dword[contB]
    push dword[contA]
    push printRes;empilhando o formato da saida
    call printf  ;chamando funcao printf
    add esp, 16 ;desempilhando, (cada push, 4 Bytes)
    
    ;.contA:
    ;push ecx
    ;inc contA
    ;pop ecx
   
    ;mov eax, 0
    ;mov eax, [contA]
    ;push eax
    ;push printfValue
    ;call printf
    ;add esp, 8     

    .fim:
    xor eax, eax
    ret
    
    .contA:
    mov eax, [contA]; movendo variavel contador de "a" com valor 0 para eax
    inc eax; incrementando eax [contadorA] os elementos iguais
    mov dword[contA], eax; movendo de volta o incremento de eax para o contadorA
    jmp .retornaLoop     ;feito o incremento salta de volta para o loop para proxima posicao do vetor
    
    .contB:
    mov eax, [contB]; movendo variavel contador de "b" com valor 0 para eax
    inc eax; incrementando eax [contadorB] os elementos iguais
    mov dword[contB], eax; movendo de volta o incremento de eax para o contadorB
    jmp .retornaLoop     ;feito o incremento salta de volta para o loop para proxima posicao do vetor
    
    .contC:
    mov eax, [contC]; movendo variavel contador de "c" com valor 0 para eax
    inc eax; incrementando eax [contadorC] os elementos iguais
    mov dword[contC], eax; movendo de volta o incremento de eax para o contadorC
    jmp .retornaLoop     ;feito o incremento salta de volta para o loop para proxima posicao do vetor
    