#include <stdio.h>

//Escreva uma função de uma linha Logn(n, r) que retorne [logbaseR N]

int Logn(int iNum1, int iNum2){
    if(iNum1>iNum2-1){
        return 1 + Logn((iNum1/iNum2),iNum2);
    }else{
        return 0;
    }
}
int main(){
    unsigned int n = 32;
    unsigned int b = 2;
    printf("%d\n", Logn(n,b));
    return(0);
}