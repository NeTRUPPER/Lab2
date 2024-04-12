# Функция для проверки, является ли число простым
def is_prime(num)
    return false if num <= 1
    (2..Math.sqrt(num)).each do |i|
      return false if num % i == 0
    end
    true
  end
  
  # Функция для решения задачи
  def count_primes(n)
    count = 0
    n.times do
      print "Enter the number: "
      num = gets.to_i
      count += 1 if is_prime(num)
    end
    puts "Number of prime numbers: #{count}"
    count
  end
  
  def main
    print "Enter the number of numbers: "
    n = gets.to_i
    count_primes(n)
  end
  
  main