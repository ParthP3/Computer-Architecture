// C++ program to find modular
// inverse of A under modulo M
#include <bits/stdc++.h>
using namespace std;
 
// A naive method to find modular
// multiplicative inverse of 'A'
// under modulo 'M'
 
int modInverse(long long int A, long long int M)
{
    for (long long int X = 1; X < M; X++)
        if (((A % M) * (X % M)) % M == 1)
            return X;
}
 
// Driver code
int main()
{
    long long int A = 15343, M = 263423423;
 
    // Function call
    cout << modInverse(A, M);
    return 0;
}