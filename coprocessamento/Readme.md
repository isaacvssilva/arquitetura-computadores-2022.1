# Coprocessamento Vetorial

## Descrição

Suponha um vetor N com 80 elementos e outro vetor M com 80 elementos.

Faça um programa em NASM que receba os 80 valores de ponto flutuante de precisão simples referentes à N e após os 80 valores de ponto flutuante de precisão simples referentes à M, calcule o produto escalar P de A por B.

Isto é, P = A[1] * B[1] + A[2] * B[2] + ... + A[N] * B[N]

A sua implementação deve obrigatoriamente utilizar as instruções das Extensões SSE ou AVX.

Devido ao tamanho das entradas, você poderá observar na correção automática os valores dos vetores.
