#include "fib.h"

int fib(int n) {
  if (n <= 1) {
    return n;
  }

  return fib(n - 1) + fib(n - 2);

  return 0;
}

// size_t timer_from(unsigned char from) {
//     size_t counter;
//     for (unsigned char i = from; i >= 0; --i) {
//         ++counter;
//         printf(i);
//     }
//     return counter;
// }