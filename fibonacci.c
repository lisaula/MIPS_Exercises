#include <stdio.h>

unsigned int fibonacci(unsigned int n)
{    
    if (n <= 1) {
           return n;
    }
    
    return fibonacci(n - 1) + fibonacci(n - 2);
}

main()
{
    unsigned int i;
    for (i = 1; i < 12; i++)
    {
        printf("fib %d: %d\t\n", i, fibonacci(i));
    }
    getchar();
}