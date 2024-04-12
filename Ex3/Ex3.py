# Функция для проверки, является ли число простым
def is_prime(num):
    if num <= 1:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

# Функция для решения задачи
def count_primes(n):
    count = 0
    for _ in range(n):
        num = int(input("Enter the number: "))
        if is_prime(num):
            count += 1
    print("Number of prime numbers: ", end="")
    return count

def main():
    n = int(input("Enter the number of numbers: "))
    print(count_primes(n))

# Запуск основной функции
main()