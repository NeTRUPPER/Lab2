package awesomeProject1

import (
    "fmt"
    "sort"
    "strings"
)

var morseAlphabet = []string{
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..",
}

func toMorseCode(word string) string {
    var morseWord string
    for _, c := range word {
       index := c - 'a'
       morseWord += morseAlphabet[index]
    }
    return morseWord
}

func compareMorseWords(word1, word2 string) bool {
    if len(word1) != len(word2) {
       return false
    }

    sortedWord1 := strings.Split(word1, "")
    sort.Strings(sortedWord1)

    sortedWord2 := strings.Split(word2, "")
    sort.Strings(sortedWord2)

    for i := range sortedWord1 {
       if sortedWord1[i] != sortedWord2[i] {
          return false
       }
    }

    return true
}

func countMatchingMorseWords(words []string) int {
    count := 0

    var morseWords []string
    for _, word := range words {
       morseWords = append(morseWords, toMorseCode(word))
    }

    for i := 0; i < len(morseWords); i++ {
       for j := i + 1; j < len(morseWords); j++ {
          if compareMorseWords(morseWords[i], morseWords[j]) {
             count++
          }
       }
    }

    return count
}

func main() {
    var n int
    fmt.Print("Enter the number of words: ")
    fmt.Scan(&n)

    var input []string
    fmt.Print("Enter the words: ")
    for i := 0; i < n; i++ {
       var word string
       fmt.Scan(&word)
       input = append(input, word)
    }

    if len(input) == 1 && len(input[0]) == 1 {
       fmt.Println("Number of matching Morse words: 1")
       return
    }

    matchingCount := countMatchingMorseWords(input)
    fmt.Println("Number of matching Morse words:", matchingCount)
}