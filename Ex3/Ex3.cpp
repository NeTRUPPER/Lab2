#include <iostream>

using namespace std;

// Функция для проверки, является ли число простым
bool isPrime(int num) {
    if (num <= 1)
        return false;
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0)
            return false;
    }
    return true;
}

// Функция для решения задачи
int countPrimes(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        int num;
        cout << "Enter the number: ";
        cin >> num;
        if (isPrime(num))
            count++;
    }
    cout << "Number of prime numbers: ";
    return count;
}

int main() {
    int n;
    cout << "Enter the number of numbers: ";
    cin >> n;
    cout << countPrimes(n) << endl;
    return 0;
}