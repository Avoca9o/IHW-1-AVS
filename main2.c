#include <stdio.h>
#include <stdlib.h>

int a[999999], b[999999];

void fill(int n, int mx) {
for (int i = 0; i < n; ++i) {
        b[i] = a[i];
        if (b[i] < 0) {
            b[i] = mx;
        }
    }
}

void print_array(int n) {
    for (int i = 0; i < n; ++i) {
    	printf("%d ", b[i]);
    }
    printf("\n");
}

int main(int argc, char* argv[]) {
    if (argc > 1000000 || argc == 1) {
          printf("not enough space or empty array\n");
          return 0;
    }
    int i = 0, mx = atoi(argv[1]), sz = argc - 1;
    for (i = 0; i < sz; ++i) {
        a[i] = atoi(argv[i + 1]);
        if (a[i] > mx) {
            mx = a[i];
        }
    }
    fill(sz, mx);
    print_array(sz);
}
