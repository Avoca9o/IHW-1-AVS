#include <stdio.h>
#include <stdlib.h>

int a[999999], b[999999];

int main(int argc, char* argv[]) {
    if (argc >= 1000000 || argc == 0) {
          printf("not enough space or empty array\n");
          return 0;
    }
    int i = 0, mx = atoi(argv[0]), sz = argc - 1;
    for (i = 0; i < sz; ++i) {
        a[i] = atoi(argv[i + 1]);
        if (a[i] > mx) {
            mx = a[i];
        }
    }
    for (i = 0; i < sz; ++i) {
        b[i] = a[i];
        if (b[i] < 0) {
            b[i] = mx;
        }
    }
    for (i = 0; i < sz; ++i) {
    	printf("%d ", b[i]);
    }
    printf("\n");
}
