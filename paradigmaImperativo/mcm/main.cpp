#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main(){
    int cantidad_numeros;
    int i, j, k=1;
    printf("\n\n  Digita de cuantos numeros quiere hacer el m.c.m:  ");
    scanf(" %d", &cantidad_numeros);
    if(cantidad_numeros<2){
        printf("\n\n  No puede hacer el m.c.m. de solo 1 numero.");
        return 0;
    }

    if(cantidad_numeros>100){
        printf("\n\n  Muchos :') ");
        return 0;
    }

    int vector_numeros[cantidad_numeros];
    printf("\n  Digite los numeros a operar:  \n");

    for(i=0;i<cantidad_numeros;i++){
        printf("  %dºnumero:  ", k);
        scanf(" %d", &j);
        vector_numeros[i] = j;
        k++;
    }
    
    int limit_multiplos = 999;
    int matriz_multiplos[cantidad_numeros][limit_multiplos];
    int x, y, z=1;

    for(i=0;i<cantidad_numeros;i++){
        for(j=0;j<limit_multiplos;j++){
            x = vector_numeros[i];
            y = x * z;
            z++;
            matriz_multiplos[i][j] = y;
        }
        z=1;
    }

    int h=0, w, p;
    int multiplo_por_defecto=1, aaa;
    int primer_multiplo = matriz_multiplos[0][h];

    for(i=1;i<cantidad_numeros;){
        for(j=0;j<limit_multiplos;){
            if(primer_multiplo == matriz_multiplos[i][j]){
                w = primer_multiplo;
                i++;
                j=0;
            }

            else{
                j++;
                p = j;
            }

            if((j == limit_multiplos)  &&  (h != limit_multiplos)){
                h++;
                primer_multiplo = matriz_multiplos[0][h];
                i=1;
                j=0;
            }
            if((h == limit_multiplos-1) && (j == p)){
                printf("\n\n  no hay mcm que el programa pueda calcular.");
                for(i=0;i<cantidad_numeros;i++){
                    aaa = vector_numeros[i];
                    multiplo_por_defecto = multiplo_por_defecto * aaa;
                }
                if(multiplo_por_defecto<=100000000){
                    printf("\n  multiplo por defecto %d", multiplo_por_defecto);
                }
                else{
                    printf("\n  multiplo muy grande .");
                }
                return 0;
            }
            if((i == cantidad_numeros) && (primer_multiplo == w)){
                printf("\n\n  El m.c.m es %d", primer_multiplo);
                return 0;
            }
        }
    }
    return 0;
}
