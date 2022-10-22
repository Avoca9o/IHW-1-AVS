#include <stdio.h>

int main()
{
    unsigned int n;
    scanf("%u", &n);
    int a[n];
    for (unsigned int i = 0; i < n; ++i) {
        scanf("%d", &a[i]);
    }
    int mx = a[0];
    for (unsigned int i = 1; i < n; ++i) {
        if (a[i] > mx) {
            mx = a[i];
        }
    }
    int b[n];
    for (unsigned int i = 0; i < n; ++i) {
        if (a[i] < 0) {
            b[i] = mx;
        } else {
            b[i] = a[i];
        }
    }
    for (unsigned int i = 0; i < n; ++i) {
        printf("%d ", b[i]);
    }
    return 0;
}
