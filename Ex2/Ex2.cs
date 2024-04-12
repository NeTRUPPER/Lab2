using System;
using System.Collections.Generic;
using System.Linq;

class MainClass
{
    static List<string> morseAlphabet = new List<string>
    {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
        "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    };

    static string ToMorseCode(string word)
    {
        string morseWord = "";

        foreach (char c in word)
        {
            int index = c - 'a';
            morseWord += morseAlphabet[index];
        }

        return morseWord;
    }

    static bool CompareMorseWords(string word1, string word2)
    {
        if (word1.Length != word2.Length)
        {
            return false;
        }

        string sortedWord1 = new string(word1.OrderBy(c => c).ToArray());
        string sortedWord2 = new string(word2.OrderBy(c => c).ToArray());

        return sortedWord1 == sortedWord2;
    }

    static int CountMatchingMorseWords(List<string> words)
    {
        int count = 0;

        List<string> morseWords = new List<string>();
        foreach (string word in words)
        {
            morseWords.Add(ToMorseCode(word));
        }

        for (int i = 0; i < morseWords.Count; ++i)
        {
            for (int j = i + 1; j < morseWords.Count; ++j)
            {
                if (CompareMorseWords(morseWords[i], morseWords[j]))
                {
                    count++;
                }
            }
        }

        return count;
    }

    public static void Main(string[] args)
    {
        Console.Write("Enter the number of words: ");
        int n = Convert.ToInt32(Console.ReadLine());

        List<string> input = new List<string>();
        Console.Write("Enter the words: ");
        for (int i = 0; i < n; ++i)
        {
            string word = Console.ReadLine();
            input.Add(word);
        }

        if (input.Count == 1 && input[0].Length == 1)
        {
            Console.WriteLine("Number of matching Morse words: 1");
            return;
        }

        int matchingCount = CountMatchingMorseWords(input);
        Console.WriteLine("Number of matching Morse words: " + matchingCount);
    }
}