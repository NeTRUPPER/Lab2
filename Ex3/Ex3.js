// Функция для проверки, является ли число простым
function isPrime(num) {
    if (num <= 1)
        return false;
    for (let i = 2; i * i <= num; i++) {
        if (num % i === 0)
            return false;
    }
    return true;
}

// Функция для решения задачи
function countPrimes(n) {
    let count = 0;
    for (let i = 0; i < n; i++) {
        let num = parseInt(prompt("Enter the number:"));
        if (isPrime(num))
            count++;
    }
    console.log("Number of prime numbers: " + count);
    return count;
}

// Основная функция
function main() {
    let n = parseInt(prompt("Enter the number of numbers:"));
    countPrimes(n);
}

// Запуск основной функции
main();