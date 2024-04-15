using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static List<string> morseAlphabet = new List<string>
    {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
        ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    };

    static Dictionary<char, string> charToMorse = new Dictionary<char, string>();

    static void InitCharToMorseMap()
    {
        for (char c = 'a'; c <= 'z'; ++c)
        {
            charToMorse[c] = morseAlphabet[c - 'a'];
        }
    }

    static void GeneratePermutations(string str, int l, int r, HashSet<string> permutations)
    {
        if (l == r)
        {
            permutations.Add(str);
        }
        else
        {
            for (int i = l; i <= r; i++)
            {
                str = Swap(str, l, i);
                GeneratePermutations(str, l + 1, r, permutations);
                str = Swap(str, l, i);
            }
        }
    }

    static string Swap(string str, int i, int j)
    {
        char[] charArray = str.ToCharArray();
        char temp = charArray[i];
        charArray[i] = charArray[j];
        charArray[j] = temp;
        return new string(charArray);
    }

    static string StringToMorse(string str)
    {
        string morseString = "";
        foreach (char c in str)
        {
            morseString += charToMorse[c];
        }
        return morseString;
    }

    static void Main(string[] args)
    {
        InitCharToMorseMap();
        Console.OutputEncoding = System.Text.Encoding.UTF8;
        Console.WriteLine("Введите слова для перестановки (разделяйте их пробелами): ");
        string input = Console.ReadLine();

        string[] words = input.Split(' ');
        HashSet<string> uniqueMorseWords = new HashSet<string>();

        foreach (string word in words)
        {
            HashSet<string> permutations = new HashSet<string>();
            GeneratePermutations(word, 0, word.Length - 1, permutations);

            foreach (string permutation in permutations)
            {
                uniqueMorseWords.Add(StringToMorse(permutation));
            }
        }

        Console.WriteLine("Уникальные слова в языке Морзе: ");
        foreach (string morseWord in uniqueMorseWords)
        {
            Console.WriteLine(morseWord);
        }

        Console.WriteLine("Количество уникальных слов: " + uniqueMorseWords.Count);
    }
}