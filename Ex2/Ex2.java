import java.util.*;

public class Ex2 {
    static List<String> morseAlphabet = Arrays.asList(
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
            ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    );

    static Map<Character, String> charToMorse = new HashMap<>();

    static void initCharToMorseMap() {
        for (char c = 'a'; c <= 'z'; ++c) {
            charToMorse.put(c, morseAlphabet.get(c - 'a'));
        }
    }

    static void generatePermutations(String str, int l, int r, Set<String> permutations) {
        if (l == r) {
            permutations.add(str);
        } else {
            for (int i = l; i <= r; i++) {
                str = swap(str, l, i);
                generatePermutations(str, l + 1, r, permutations);
                str = swap(str, l, i);
            }
        }
    }

    static String swap(String str, int i, int j) {
        char[] charArray = str.toCharArray();
        char temp = charArray[i];
        charArray[i] = charArray[j];
        charArray[j] = temp;
        return new String(charArray);
    }

    static String stringToMorse(String str) {
        StringBuilder morseString = new StringBuilder();
        for (char c : str.toCharArray()) {
            morseString.append(charToMorse.get(c));
        }
        return morseString.toString();
    }

    public static void main(String[] args) {
        initCharToMorseMap();
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("Введите слова для перестановки (разделяйте их пробелами): ");
            String input = scanner.nextLine();

            String[] words = input.split(" ");
            Set<String> uniqueMorseWords = new HashSet<>();

            for (String word : words) {
                Set<String> permutations = new HashSet<>();
                generatePermutations(word, 0, word.length() - 1, permutations);

                for (String permutation : permutations) {
                    uniqueMorseWords.add(stringToMorse(permutation));
                }
            }

            System.out.println("Уникальные слова в языке Морзе: ");
            for (String morseWord : uniqueMorseWords) {
                System.out.println(morseWord);
            }

            System.out.println("Количество уникальных слов: " + uniqueMorseWords.size());
        }
    }
}