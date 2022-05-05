#include <stdio.h>

int sumInt(int n){
    int iRes = 0;
    for(int i = 1; i<=n; i++){
        iRes += i;
    }
    return (iRes);
}

int main(){
    
    int iNum = 0;
    scanf("%d", &iNum);

    printf("%d\n", sumInt(iNum));
    return(0);
}