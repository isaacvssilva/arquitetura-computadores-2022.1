#include <stdio.h>

int idade(int n){
    
    if(n < 0){
       printf("Idade invalida\n");
    }else{
        if(n <= 19){
            printf("Jovens\n");
        }else if(n <= 59){
            printf("Adultos\n");
        }else{
            printf("Idosos\n");
        }
    }
}

int main(){
    int iNum = 0;
    int iAux = 0;
    
    //leitura da qtd de idades
    scanf("%d", &iNum);
    int iVet[iNum];

    //leitura da idade 
    for(int i = 0; i<iNum; i++){
        scanf("%d", &iVet[i]);
    }

    for(int i = 0; i<iNum; i++){
        iAux = iVet[i];
        idade(iAux);
    }
    
    return(0);
}