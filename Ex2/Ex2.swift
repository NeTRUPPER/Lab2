import Foundation

let morseAlphabet: [String] = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
]

// Dictionary to store the mapping between characters and their Morse code representation.
var charToMorse: [Character: String] = [:]

func initCharToMorseMap() {
    for i in 0..<morseAlphabet.count {
        if let scalar = Unicode.Scalar("a".unicodeScalars.first!.value + UInt32(i)) {
            charToMorse[Character(scalar)] = morseAlphabet[i]
        }
    }
}

// Function to generate permutations of the given string and add them to the container.
func generatePermutations(str: String, l: Int, r: Int, permutations: inout Set<String>) {
    var strArray = Array(str)
    if l == r {
        permutations.insert(String(strArray))
    } else {
        for i in l...r {
            strArray.swapAt(l, i)
            generatePermutations(str: String(strArray), l: l + 1, r: r, permutations: &permutations)
            strArray.swapAt(l, i)
        }
    }
}

// Function to convert a string to Morse code using the created map.
func stringToMorse(str: String) -> String {
    var morseString = ""
    for c in str {
        morseString += (charToMorse[c] ?? "")
    }
    return morseString
}

func main() {
    initCharToMorseMap()
    print("Введите слова для перестановки (разделяйте их пробелами): ")
    if let line = readLine() {
        let words = line.components(separatedBy: " ")
        var uniqueMorseWords: Set<String> = []

        for word in words {
            var permutations: Set<String> = []
            generatePermutations(str: word, l: 0, r: word.count - 1, permutations: &permutations)

            for permutation in permutations {
                uniqueMorseWords.insert(stringToMorse(str: permutation))
            }
        }

        print("Уникальные слова в языке Морзе: ")
        for morseWord in uniqueMorseWords {
            print(morseWord)
        }

        print("Количество уникальных слов: \(uniqueMorseWords.count)")
    } else {
        print("Invalid input")
    }
}

main()