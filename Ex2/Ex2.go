package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

var morseAlphabet = []string{
	".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
	".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..",
}

// map для хранения соответствия между символами и их представлением в коде Морзе.
var charToMorse map[rune]string

func initCharToMorseMap() {
	charToMorse = make(map[rune]string)
	for i, code := range morseAlphabet {
		charToMorse[rune('a'+i)] = code
	}
}

// Функция генерирует перестановки переданной строки и добавляет их в контейнер.
func generatePermutations(str []rune, l, r int, permutations map[string]bool) {
	if l == r {
		permutations[string(str)] = true
	} else {
		for i := l; i <= r; i++ {
			str[l], str[i] = str[i], str[l]
			generatePermutations(str, l+1, r, permutations)
			str[l], str[i] = str[i], str[l]
		}
	}
}

// Преобразую строку в код Морзе, используя созданный map.
func stringToMorse(str string) string {
	var morseString strings.Builder
	for _, c := range str {
		morseString.WriteString(charToMorse[c])
	}
	return morseString.String()
}

func main() {
	initCharToMorseMap()
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Введите слова для перестановки (разделяйте их пробелами): ")
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	// Разделяем ввод на отдельные слова.
	words := strings.Split(input, " ")
	uniqueMorseWords := make(map[string]bool)

	for _, word := range words {
		permutations := make(map[string]bool)
		wordRunes := []rune(word)
		generatePermutations(wordRunes, 0, len(wordRunes)-1, permutations)

		for permutation := range permutations {
			uniqueMorseWords[stringToMorse(permutation)] = true
		}
	}

	fmt.Println("Уникальные слова в языке Морзе:")
	count := 0
	for morseWord := range uniqueMorseWords {
		count++
		fmt.Println(morseWord)
	}
	fmt.Println("Количество уникальных слов:", count)
}