#include <stdio.h>

int main(){
    int iKilo = 0, iGrama = 0;
    scanf("%d", &iKilo);

    for(int i = 0; i<1000; i++){
        iGrama += iKilo;
    }
    printf("%d\n", iGrama);

}