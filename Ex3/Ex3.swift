import Foundation

// Функция для проверки, является ли число простым
func isPrime(num: Int) -> Bool {
    if num <= 1 {
        return false
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

// Функция для решения задачи
func countPrimes(n: Int) -> Int {
    var count = 0
    for _ in 0..<n {
        print("Enter the number: ", terminator: "")
        if let input = readLine(), let num = Int(input), isPrime(num: num) {
            count += 1
        } else {
            continue
        }
    }
    print("Number of prime numbers: ", terminator: "")
    return count
}

func main() {
    print("Enter the number of numbers: ", terminator: "")
    if let input = readLine(), let n = Int(input) {
        print(countPrimes(n: n))
    } else {
        print("Invalid input. Please enter a number.")
    }
}

main()