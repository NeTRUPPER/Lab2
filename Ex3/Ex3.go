package main

import (
	"fmt"
	"math"
)

// Функция для проверки, является ли число простым
func isPrime(num int) bool {
	if num <= 1 {
		return false
	}
	for i := 2; i <= int(math.Sqrt(float64(num))); i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}

// Функция для решения задачи
func countPrimes(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		var num int
		fmt.Print("Enter the number: ")
		fmt.Scan(&num)
		if isPrime(num) {
			count++
		}
	}
	fmt.Print("Number of prime numbers: ")
	return count
}

func main() {
	var n int
	fmt.Print("Enter the number of numbers: ")
	fmt.Scan(&n)
	fmt.Println(countPrimes(n))
}