#include <iostream>

#include "fib.h"

int fib(int n) {
    if (n <= 1) {
        return n;
    }

    int* a = new int; //
    // delete a;  // Some bad comment

    return fib(n - 1) + fib(n - 2);  //
}

int func() {
    int a = 5;
    float b;
    for (int i = 0; i < 5; ++i)
        std::cout << i << " ";
}
