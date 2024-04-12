#include <iostream>
#include <string>
#include <cctype> // For islower and isupper

using namespace std;

int minChanges(string str) {
    int count = 0;
    for (int i = 0; i < str.length() - 2; ++i) {
        if (str[i] == str[i + 1] && str[i + 1] == str[i + 2]) {
            count++;
            i += 2; // Skip the next two characters as they are already fine
        }
    }
    return count;
}

bool isValidString(const string& str) {
    // Check if the string length is at least 3
    if (str.length() < 3) {
        cout << "Error: The string must contain at least 3 characters." << endl;
        return false;
    }

    // Check if all characters are either lowercase or uppercase
    bool hasLowercase = false;
    bool hasUppercase = false;
    for (char c : str) {
        if (islower(c)) {
            hasLowercase = true;
        } else if (isupper(c)) {
            hasUppercase = true;
        }
        if (hasLowercase && hasUppercase) {
            cout << "Error: The string must contain either all lowercase or all uppercase characters." << endl;
            return false;
        }
    }

    return true;
}

int main() {
    string str;
    cout << "Example: " << "str = ";
    cin >> str;

    // Check if the string is valid
    if (!isValidString(str)) {
        return 1; // Exit with an error code
    }

    int changes = minChanges(str);

    // Add characters to the string
    for (int i = 0; i < str.length() - 2; ++i) {
        if (str[i] == str[i + 1] && str[i + 1] == str[i + 2]) {
            char new_symbol = 'a' + rand() % ('z' - 'a'); // Generate a random lowercase letter
            str.insert(i + 2, 1, new_symbol); // Insert the new symbol after the three identical ones
            i++; // Skip the inserted character
        }
    }

    cout << "Result: " << changes << " = " << str << endl;

    return 0;
}