import java.util.*

val morseAlphabet = arrayOf(
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
)

// map для хранения соответствия между символами и их представлением в коде Морзе.
val charToMorse = mutableMapOf<Char, String>()

fun initCharToMorseMap() {
    for (i in 'a'..'z') {
        charToMorse[i] = morseAlphabet[i.toInt() - 'a'.toInt()]
    }
}

// Функция генерирует перестановки переданной строки и добавляет их в контейнер.
fun generatePermutations(str: String, l: Int, r: Int, permutations: MutableSet<String>) {
    if (l == r) {
        permutations.add(str)
    } else {
        for (i in l..r) {
            val chars = str.toCharArray()
            val temp = chars[l]
            chars[l] = chars[i]
            chars[i] = temp
            generatePermutations(String(chars), l + 1, r, permutations)
            chars[l] = chars[i]
            chars[i] = temp
        }
    }
}

// Преобразую строку в код Морзе, используя созданный map.
fun stringToMorse(str: String): String {
    val morseString = StringBuilder()
    for (c in str) {
        morseString.append(charToMorse[c] ?: "")
    }
    return morseString.toString()
}

fun main() {
    initCharToMorseMap()
    val scanner = Scanner(System.`in`)
    print("Введите слова для перестановки (разделяйте их пробелами): ")
    val input = scanner.nextLine()

    // Разделяем ввод на отдельные слова.
    val words = input.split("\\s+".toRegex())
    val uniqueMorseWords = mutableSetOf<String>()

    for (word in words) {
        val permutations = mutableSetOf<String>()
        generatePermutations(word, 0, word.length - 1, permutations)

        for (permutation in permutations) {
            uniqueMorseWords.add(stringToMorse(permutation))
        }
    }

    println("Уникальные слова в языке Морзе:")
    var count = 0
    for (morseWord in uniqueMorseWords) {
        count++
        println(morseWord)
    }
    println("Количество уникальных слов: $count")
}