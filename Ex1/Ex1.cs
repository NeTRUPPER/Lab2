using System;
using System.Text;

class Program
{
    static int MinChanges(string str)
    {
        int count = 0;
        for (int i = 0; i < str.Length - 2; ++i)
        {
            if (str[i] == str[i + 1] && str[i + 1] == str[i + 2])
            {
                count++;
                i += 2; // Пропускаем следующие два символа, так как они уже подходят
            }
        }
        return count;
    }

    static void Main()
    {
        Console.Write("Example: str = ");
        string str = Console.ReadLine();

        int changes = MinChanges(str);

        // Добавляем символы в строку
        Random rand = new Random();
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.Length - 2; ++i)
        {
            if (sb[i] == sb[i + 1] && sb[i + 1] == sb[i + 2])
            {
                char newSymbol = (char)('a' + rand.Next('z' - 'a')); // Добавляем символ после трех одинаковых
                sb.Insert(i + 2, newSymbol); // Вставляем символ после трех одинаковых
                i++; // Пропускаем добавленный символ
            }
        }

        Console.WriteLine("Result: " + changes + " = " + sb.ToString());
    }
}