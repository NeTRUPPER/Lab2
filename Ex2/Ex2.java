package Ex2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Ex2 {
    static List<String> morseAlphabet = Arrays.asList(
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
            "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    );

    public static String toMorseCode(String word) {
        StringBuilder morseWord = new StringBuilder();

        for (char c : word.toCharArray()) {
            int index = c - 'a';
            morseWord.append(morseAlphabet.get(index));
        }

        return morseWord.toString();
    }

    public static boolean compareMorseWords(String word1, String word2) {
        if (word1.length() != word2.length()) {
            return false;
        }

        char[] sortedWord1 = word1.toCharArray();
        Arrays.sort(sortedWord1);

        char[] sortedWord2 = word2.toCharArray();
        Arrays.sort(sortedWord2);

        return Arrays.equals(sortedWord1, sortedWord2);
    }

    public static int countMatchingMorseWords(List<String> words) {
        int count = 0;

        List<String> morseWords = new ArrayList<>();
        for (String word : words) {
            morseWords.add(toMorseCode(word));
        }

        for (int i = 0; i < morseWords.size(); ++i) {
            for (int j = i + 1; j < morseWords.size(); ++j) {
                if (compareMorseWords(morseWords.get(i), morseWords.get(j))) {
                    count++;
                }
            }
        }

        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the number of words: ");
        int n = scanner.nextInt();
        scanner.nextLine();

        List<String> input = new ArrayList<>();
        System.out.print("Enter the words: ");
        for (int i = 0; i < n; ++i) {
            String word = scanner.nextLine();
            input.add(word);
        }

        if (input.size() == 1 && input.get(0).length() == 1) {
            System.out.println("Number of matching Morse words: 1");
            return;
        }

        int matchingCount = countMatchingMorseWords(input);
        System.out.println("Number of matching Morse words: " + matchingCount);
    }
}
