#include <stdio.h>
#include <iostream>

using namespace std;

void merge(int [], int, int, int);

void mergeSort(int arr[], int l, int r)
{
    cout<<"Right: "<<r<<endl;
    //cout<<"Entered here"<<endl;
    if (l < r)
    {   
        int m = l+(r-l)/2; //Same as (l+r)/2, but avoids overflow for large l and h
        mergeSort(arr, l, m);

        cout<<"Out of first recursive call"<<endl;
        mergeSort(arr, m+1, r);

        cout<<"Out of all major calls"<<endl;
        merge(arr, l, m, r);
    }
}
                    // a1      a3      a2
void merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 =  r - m;

    cout<<"Merge enter"<<endl;
    /* create temp arrays */
    int L[n1], R[n2];

    /* Copy data to temp arrays L[] and R[] */
    for(i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for(j = 0; j < n2; j++)
        R[j] = arr[m + 1+ j];

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0;//t4
    j = 0;//t5
    k = l;//t6
    //          t0       t1
    while (i < n1 && j < n2)
    {       //t2    t3
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    /* Copy the remaining elements of L[], if there are any */
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    /* Copy the remaining elements of R[], if there are any */
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}


int main (){
    int size = 5;
    int array[size];
    array[0]= 55;
    array[1]=44;
    array[2]=20;
    array[3]=99;
    array[4]=3;
    mergeSort(array, 0, size - 1);

    printf("After sorting: ");
    int i;
    for(i=0;i<size;i++)
      printf(" %d",array[i]);
    printf("\n");
    return 0;
}
