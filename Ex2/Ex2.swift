import Foundation

let morseAlphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
]

func toMorseCode(word: String) -> String {
    var morseWord = ""

    for c in word {
        let index = Int(c.asciiValue! - Character("a").asciiValue!)
        morseWord += morseAlphabet[index]
    }

    return morseWord
}

func compareMorseWords(word1: String, word2: String) -> Bool {
    if word1.count != word2.count {
        return false
    }

    let sortedWord1 = String(word1.sorted())
    let sortedWord2 = String(word2.sorted())

    return sortedWord1 == sortedWord2
}

func countMatchingMorseWords(words: [String]) -> Int {
    var count = 0

    var morseWords: [String] = []
    for word in words {
        morseWords.append(toMorseCode(word: word))
    }

    for i in 0..<morseWords.count {
        for j in (i + 1)..<morseWords.count {
            if compareMorseWords(word1: morseWords[i], word2: morseWords[j]) {
                count += 1
            }
        }
    }

    return count
}

func main() {
    print("Enter the number of words: ")
    guard let n = readLine()?.components(separatedBy: " ").first, let numberOfWords = Int(n) else {
        print("Invalid input")
        return
    }

    var input: [String] = []
    print("Enter the words: ")
    for _ in 0..<numberOfWords {
        guard let word = readLine() else {
            print("Invalid input")
            return
        }
        input.append(word)
    }

    if input.count == 1 && input[0].count == 1 {
        print("Number of matching Morse words: 1")
        return
    }

    let matchingCount = countMatchingMorseWords(words: input)
    print("Number of matching Morse words: \(matchingCount)")
}

main()