#include <stdio.h>

int main(){
    int iNum = 0;
    scanf("%d", &iNum);

    for(int i = 0; i<=10; i++){
        printf("%d X %d = %d\n", i, iNum, iNum*i);
    }
    return(0);
}