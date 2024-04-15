#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
#include <map>
#include <sstream>
using namespace std;

vector<string> morseAlphabet = {
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
};

// map который будет хранить соответствие между символами и их представлением в коде Морзе.
map<char, string> charToMorse;

void initCharToMorseMap() {
    for (char c = 'a'; c <= 'z'; ++c) {
        charToMorse[c] = morseAlphabet[c - 'a'];
    }
}

// Функция генерирует перестановки переданной строки и добавляет их в контейнер.
void generatePermutations(string str, int l, int r, set<string>& permutations) {
    if (l == r) {
        permutations.insert(str);
    } else {
        for (int i = l; i <= r; i++) {
            swap(str[l], str[i]);
            generatePermutations(str, l + 1, r, permutations);
            swap(str[l], str[i]);
        }
    }
}

// Преобразую строку в код Морзе, используя созданный map.
string stringToMorse(const string& str) {
    string morseString = "";
    for (char c : str) {
        morseString += charToMorse[c];
    }
    return morseString;
}

int main() {
    int count = 0;
    initCharToMorseMap();
    setlocale(LC_ALL, "Russian");
    string input;
    cout << "Введите слова для перестановки (разделяйте их пробелами): ";
    getline(cin, input);

    // Разделяем ввод на отдельные слова.
    stringstream ss(input);
    string word;
    set<string> uniqueMorseWords;

    while (ss >> word) {
        set<string> permutations;
        generatePermutations(word, 0, word.size() - 1, permutations);

        for (const auto& permutation : permutations) {
            uniqueMorseWords.insert(stringToMorse(permutation));
        }
    }

    cout << "Уникальные слова в языке Морзе: ";
    for (const auto& morseWord : uniqueMorseWords) {
        count++;
        cout << morseWord << endl;
    }
     cout << "Количество уникальных слов: " << count << endl;
    return 0;
}