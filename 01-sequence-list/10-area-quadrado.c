#include <stdio.h>

int main(){

    int iArea = 0, iResult = 0;
    scanf("%d", &iArea);

    for(int i = 0; i<iArea; i++){
        iResult += iArea;
    }
    printf("%d\n", iResult);

    return(0);
}