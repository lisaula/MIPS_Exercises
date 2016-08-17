#include "stdio.h"

int strcmp(const char* s1, const char* s2)
{	
	printf("%p\n", s1);
	while(*s1 && (*s1 == *s2)){
		s1++; s2++;
	}

	printf("%p\n", s1);
	return *(const unsigned char*)s1 - *(const unsigned char *)s2;
}

main(){
	printf("%d\n", strcmp("hola", "aey"));
	printf("%d\n", strcmp("hola", "hola"));
	printf("%d\n", strcmp("hola", "manos"));

	char a [1];
	a[0] = 'a';

	printf("%d\n", *(const unsigned char*)a);	
}