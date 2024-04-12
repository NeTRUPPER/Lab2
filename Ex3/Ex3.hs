-- Функция для проверки, является ли число простым
isPrime :: Int -> Bool
isPrime num
    | num <= 1 = False
    | otherwise = all (\x -> num `mod` x /= 0) [2..floor . sqrt $ fromIntegral num]

-- Функция для решения задачи
countPrimes :: Int -> IO Int
countPrimes n = do
    numbers <- sequence [getNumber | _ <- [1..n]]
    let primeCount = length . filter isPrime $ numbers
    putStrLn $ "Number of prime numbers: " ++ show primeCount
    return primeCount

-- Функция для получения числа из пользовательского ввода
getNumber :: IO Int
getNumber = do
    putStrLn "Enter the number: "
    num <- readLn
    return num

main :: IO ()
main = do
    putStrLn "Enter the number of numbers: "
    n <- readLn
    countPrimes n
    return ()