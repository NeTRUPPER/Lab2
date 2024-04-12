#include <iostream>
#include <vector>
#include <string>
#include <unordered_set>
#include <algorithm>

using namespace std;

vector<string> morseAlphabet = {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
        "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
};

string toMorseCode(const string& word) {
    string morseWord = "";

    for (char c : word) {
        int index = c - 'a';
        morseWord += morseAlphabet[index];
    }

    return morseWord;
}

bool compareMorseWords(const string& word1, const string& word2) {
    if (word1.size() != word2.size()) {
        return false;
    }

    string sortedWord1 = word1;
    sort(sortedWord1.begin(), sortedWord1.end());

    string sortedWord2 = word2;
    sort(sortedWord2.begin(), sortedWord2.end());

    return sortedWord1 == sortedWord2;
}

int countMatchingMorseWords(const vector<string>& words) {
    int count = 0;

    vector<string> morseWords;
    for (const string& word : words) {
        morseWords.push_back(toMorseCode(word));
    }

    for (int i = 0; i < morseWords.size(); ++i) {
        for (int j = i + 1; j < morseWords.size(); ++j) {
            if (compareMorseWords(morseWords[i], morseWords[j])) {
                count++;
            }
        }
    }

    return count;
}

int main() {
    int n;
    cout << "Enter the number of words: ";
    cin >> n;

    vector<string> input;
    cout << "Enter the words: ";
    for (int i = 0; i < n; ++i) {
        string word;
        cin >> word;
        input.push_back(word);
    }

    int matchingCount = countMatchingMorseWords(input);
    cout << "Number of matching Morse words: " << matchingCount << endl;

    return 0;
}