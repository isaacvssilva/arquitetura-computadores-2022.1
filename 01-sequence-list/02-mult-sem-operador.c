#include <stdio.h>

int main(){

    int iNum1 = 0, iNum2 = 0, 
    iNum3 = 0, aux1 = 0, aux2 = 0;
    
    scanf("%d %d %d", &iNum1, &iNum2, &iNum3);

    for(int i = 0; i<iNum2; i++){
        aux1 += iNum1;
    }
    for(int i = 0; i<iNum3; i++){
        aux2 += aux1;
    }
    //printf("%d\n", aux1);
    printf("%d\n", aux2);

    return(0);
}