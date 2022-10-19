#include "fib.h"

int fib(int n) {
    if (n <= 1) {
        return n;
    }

    int* a = new int;  //
             delete a;          // Some bad comment

    return fib(n - 1) + fib(n - 2); }

int func() {
    double b = 6.0;
    int a = b;

    
}

// size_t timer_from(unsigned char from) {
//     size_t counter;
//     for (unsigned char i = from; i >= 0; --i) {
//         ++counter;
//         printf(i);
//     }
//     return counter;
// }
