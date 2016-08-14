#include <stdio.h>
int main (){
	int size = 5;
	int array[size];
	array[0]= 55;
	array[1]=44;
	array[2]=20;
	array[3]=99;
	array[4]=3;
	insertion_sort(array, size);

	printf("After sorting: ");
	int i;
  	for(i=0;i<size;i++)
      printf(" %d",array[i]);
  	printf("\n");
	return 0;
}

void insertion_sort(int *a, int s){
	int i, temp, j;
	for(i=1;i<s;i++){
	      temp=a[i];
	      j=i-1;	
	      while( (j>=0) && (temp<a[j]) ){
	      	a[j+1]=a[j];
	        j=j-1;
	      }
	      a[j+1]=temp;
	  }
}