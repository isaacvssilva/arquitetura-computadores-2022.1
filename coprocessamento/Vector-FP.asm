;@author: Isaac Vinicius - 500935
;
;Description: Faça um programa em NASM que receba 
; os 80 valores de ponto flutuante de precisão simples 
; referentes à N e após os 80 valores de ponto flutuante
; de precisão simples referentes à M, calcule o produto escalar 
; P de A por B.

;A sua implementação deve obrigatoriamente utilizar as instruções das Extensões SSE ou AVX.

extern scanf
extern printf

section .data
scanfValue db "%f", 0ah, 0
printfValue db "%f", 0ah, 0

section .bss
vectorA resd 80
vectorB resd 80
vectorC resd 0

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    push ebp
    mov ebp, esp
    
    mov ecx, 80
    mov esi, vectorA
    
;---------------------------------------------
;name: scanVetA
;description: Loop para salvar os 80 primeiros
;valores no vetor A
;---------------------------------------------
    .scanVetA:
        push ecx
        push esi
        push scanfValue
        call scanf
        add esp, 4
        pop esi
        pop ecx
        add esi, 4
        loop .scanVetA
     
    mov ecx, 80
    mov esi, vectorB

;---------------------------------------------
;name: scanVetB
;description: Loop para salvar os 80 primeiros
;valores no vetor B
;---------------------------------------------
    
    .scanVetB:
        push ecx
        push esi
        push scanfValue
        call scanf
        add esp, 4
        pop esi
        pop ecx
        add esi, 4
        loop .scanVetB
        
        ;push vectorA    ;-> -16
        ;push vectorB    ;-> -12
        ;push vectorC    ;-> -8
        ;call sumVectorFP;-> -4
       
        ;Produto entres os vetores A e B e salvando o resultado em vectorC
        MOV ecx, 80 
        
        L1:
        vmovups ymm1, [vectorA+ecx*4-4]; range de elementos do vetor A (1-79)
        vmovups ymm2, [vectorB+ecx*4-4]; range de elementos do vetor B (80-159)
        vmulps  ymm1, ymm2; vecA + vecB
        vaddps  ymm3, ymm1; 0 + (vectorA + vectorB) 
        loop L1
        vmovups [vectorC], ymm3
        
        ;Transformando o valor da variável de 32 bits para 64 bits     
        fld dword[vectorC] ;load float to fpu
        fstp qword[vectorC]; armazena o float na memoria, e desempilha
        
        ;Printando o produto escalar
        push DWORD[vectorC + 4]
        push DWORD[vectorC]
        push printfValue
        call printf
        add esp, 12
    pop ebp
    mov esp, ebp
    xor eax, eax
    ret
    
;---------------------RASCUNHO-----------------------
 
       
;-------------------------------------------
;name: sumVectorFP
;description: Funcao para multiplicar elementos 
;do vetor A com os elementos do Vetor B,
;e salvar o resultado no vetor C
;------------------------------------------

;global sumVectorFP
;sumVectorFP:
;   push ebp
;    mov ebp, esp
    
;    mov edx, [ebp+8]; vectorC
;    mov esi, [ebp+12]; vectorB
;    mov edi, [ebp+16]; vectorA
    
;    mov ecx, 20
;    .L1:
;    vmovups ymm1, [esi]
;   vmovups ymm2, [edi]
;    vmulps ymm3, ymm1, ymm2; vC = vA*vB
;    vmovups [edx], ymm3
    
;    add esi, 4
;   add esi, 4
;    add edx, 4
;    loop .L1
    
    ;vmovups ymm1, [vectorA+esi]
    ;vmovups ymm2, [vectorB+esi]
    ;vmulps ymm3, ymm1, ymm2
    ;vmovups [vectorC], ymm3
     
;    pop ebp
;    mov esp, ebp
;    ret
