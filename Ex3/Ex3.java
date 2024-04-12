package Ex3;

import java.util.Scanner;

public class Ex3 {

    // Функция для проверки, является ли число простым
    public static boolean isPrime(int num) {
        if (num <= 1)
            return false;
        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0)
                return false;
        }
        return true;
    }

    // Функция для решения задачи
    public static int countPrimes(int n) {
        int count = 0;
        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < n; i++) {
            System.out.print("Enter the number: ");
            int num = scanner.nextInt();
            if (isPrime(num))
                count++;
        }
        System.out.print("Number of prime numbers: ");
        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of numbers: ");
        int n = scanner.nextInt();
        System.out.println(countPrimes(n));
    }

    @Override
    public String toString() {
        return "Ex3 []";
    }
}
