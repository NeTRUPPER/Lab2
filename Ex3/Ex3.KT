import java.util.Scanner

// Функция для проверки, является ли число простым
fun isPrime(num: Int): Boolean {
    if (num <= 1)
        return false
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0)
            return false
    }
    return true
}

// Функция для решения задачи
fun countPrimes(n: Int): Int {
    var count = 0
    val scanner = Scanner(System.`in`)
    for (i in 0 until n) {
        print("Enter the number: ")
        val num = scanner.nextInt()
        if (isPrime(num))
            count++
    }
    println("Number of prime numbers: $count")
    return count
}

fun main() {
    val scanner = Scanner(System.`in`)
    print("Enter the number of numbers: ")
    val n = scanner.nextInt()
    countPrimes(n)
}