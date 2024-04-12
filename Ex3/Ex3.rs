use std::io;

// Функция для проверки, является ли число простым
fn is_prime(num: i32) -> bool {
    if num <= 1 {
        return false;
    }
    let mut i = 2;
    while i * i <= num {
        if num % i == 0 {
            return false;
        }
        i += 1;
    }
    true
}

// Функция для решения задачи
fn count_primes(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        println!("Enter the number: ");
        let mut num = String::new();
        io::stdin().read_line(&mut num).expect("Failed to read line");
        let num: i32 = num.trim().parse().expect("Please type a number!");
        if is_prime(num) {
            count += 1;
        }
    }
    println!("Number of prime numbers: {}", count);
    count
}

fn main() {
    println!("Enter the number of numbers: ");
    let mut n = String::new();
    io::stdin().read_line(&mut n).expect("Failed to read line");
    let n: i32 = n.trim().parse().expect("Please type a number!");
    count_primes(n);
}