#include <stdio.h>
#include <iostream>

using namespace std;

void quicksort(int *, int, int);

int main (){
    int size = 5;
    int array[size];
    array[0]= 55;
    array[1]=44;
    array[2]=20;
    array[3]=99;
    array[4]=3;
    quicksort(array, 0, size - 1);

    printf("After sorting: ");
    int i;
    for(i=0;i<size;i++)
      printf(" %d",array[i]);
    printf("\n");
    return 0;
}

void quicksort(int *arr, int izq, int der)
{
    int i = izq, j=der, tmp;
    int p = arr[(izq + der)/2];
    while(i<=j){
        while(arr[i]<p)i++;
        while(arr[j]>p)j--;
        if(i<=j){
            tmp = arr[i];
            arr[i]=arr[j];
            arr[j]=tmp;
            i++; j--;
        }
    }
    if (izq < j)
        quicksort(arr, izq, j);

    if (i < der)
        quicksort(arr, i, der);    
}