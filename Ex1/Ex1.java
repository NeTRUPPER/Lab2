package Ex1;

import java.util.Scanner;
import java.util.Random;

public class Ex1 {

    public static int minChanges(String str) {
        int count = 0;
        for (int i = 0; i < str.length() - 2; ++i) {
            if (str.charAt(i) == str.charAt(i + 1) && str.charAt(i + 1) == str.charAt(i + 2)) {
                count++;
                i += 2; // Skip the next two characters as they are already fine
            }
        }
        return count;
    }

    public static boolean isValidString(String str) {
        // Check if the string length is at least 3
        if (str.length() < 3) {
            System.out.println("Error: The string must contain at least 3 characters.");
            return false;
        }

        // Check if all characters are either lowercase or uppercase
        boolean hasLowercase = false;
        boolean hasUppercase = false;
        for (char c : str.toCharArray()) {
            if (Character.isLowerCase(c)) {
                hasLowercase = true;
            } else if (Character.isUpperCase(c)) {
                hasUppercase = true;
            }
            if (hasLowercase && hasUppercase) {
                System.out.println("Error: The string must contain either all lowercase or all uppercase characters.");
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Example: str = ");
        String str = scanner.nextLine();

        // Check if the string is valid
        if (!isValidString(str)) {
            System.exit(1); // Exit with an error code
        }

        int changes = minChanges(str);

        // Add characters to the string
        Random rand = new Random();
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length() - 2; ++i) {
            if (sb.charAt(i) == sb.charAt(i + 1) && sb.charAt(i + 1) == sb.charAt(i + 2)) {
                char newSymbol = (char) ('a' + rand.nextInt('z' - 'a')); // Generate a random lowercase letter
                sb.insert(i + 2, newSymbol); // Insert the new symbol after the three identical ones
                i++; // Skip the inserted character
            }
        }

        str = sb.toString();
        System.out.println("Result: " + changes + " = " + str);

        scanner.close();
    }
}