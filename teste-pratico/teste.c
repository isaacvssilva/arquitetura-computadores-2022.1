#include <stdio.h>

int main(){

    int iA = 0, iB = 0, iC = 0, 
    iCountA = 0, iCountB = 0, iCountC = 0;
    int vet[10];

    //armazenando elementos
    for(int i = 0; i<10; i++){
        scanf("%d", &vet[i]);
    }
    
    scanf("%d %d %d", &iA, &iB, &iC);

    for(int i = 0; i<10; i++){

        if(iA == vet[i]){
            iCountA ++;
        }else if(iB == vet[i]){
            iCountB ++;
        }else if(iC == vet[i]){
            iCountC ++;
        }
    }
    printf("%d\n", iCountA);
    printf("%d\n", iCountB);
    printf("%d\n", iCountC);
    
    return(0);
}