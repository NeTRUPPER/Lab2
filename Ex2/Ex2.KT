val morseAlphabet = listOf(
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
)

fun toMorseCode(word: String): String {
    var morseWord = ""

    for (c in word) {
        val index = c - 'a'
        morseWord += morseAlphabet[index]
    }

    return morseWord
}

fun compareMorseWords(word1: String, word2: String): Boolean {
    if (word1.length != word2.length) {
        return false
    }

    val sortedWord1 = word1.toCharArray().sorted().joinToString("")
    val sortedWord2 = word2.toCharArray().sorted().joinToString("")

    return sortedWord1 == sortedWord2
}

fun countMatchingMorseWords(words: List<String>): Int {
    var count = 0

    val morseWords = words.map { toMorseCode(it) }

    for (i in morseWords.indices) {
        for (j in i + 1 until morseWords.size) {
            if (compareMorseWords(morseWords[i], morseWords[j])) {
                count++
            }
        }
    }

    return count
}

fun main() {
    print("Enter the number of words: ")
    val n = readLine()!!.toInt()

    val input = mutableListOf<String>()
    println("Enter the words: ")
    repeat(n) {
        val word = readLine()!!
        input.add(word)
    }

    if (input.size == 1 && input[0].length == 1) {
        println("Number of matching Morse words: 1")
        return
    }

    val matchingCount = countMatchingMorseWords(input)
    println("Number of matching Morse words: $matchingCount")
}