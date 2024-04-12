using System;

class Program
{
    // Функция для проверки, является ли число простым
    static bool IsPrime(int num)
    {
        if (num <= 1)
            return false;
        for (int i = 2; i * i <= num; i++)
        {
            if (num % i == 0)
                return false;
        }
        return true;
    }

    // Функция для решения задачи
    static int CountPrimes(int n)
    {
        int count = 0;
        for (int i = 0; i < n; i++)
        {
            Console.Write("Enter the number: ");
            int num = Convert.ToInt32(Console.ReadLine());
            if (IsPrime(num))
                count++;
        }
        Console.Write("Number of prime numbers: ");
        return count;
    }

    static void Main(string[] args)
    {
        Console.Write("Enter the number of numbers: ");
        int n = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine(CountPrimes(n));
    }
}