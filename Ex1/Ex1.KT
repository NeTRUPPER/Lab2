import java.util.*

fun minChanges(str: String): Int {
    var count = @
    var i = 0
    while (i < str.length - 2) {
        if (str[i] == str[i + 1] && str[i + 1] == str[i + 2]) {
            count++
            i += 2 // Пропускаем следующие два символа, так как они уже подходят
        }
        i++
    }
    return count
}

fun main() {
    print("Example: str = ")
    val scanner = Scanner(System.in) val str = scanner.nextLine()

    val changes = minChanges(str)

    val rand = Random()
    val sb = StringBuilder(str)
    var i = 0

    while (i < sb.length - 2) {
        if (sb[i] == sb[i + 1] && sb[i + 1] == sb[i + 2]) { 
            val newSymbol = ('a'.toInt() + rand.nextInt('z'.toInt() - 'a'.toInt() + 1)).toChar()
            sb.insert(i + 2, newSymbol)
            i++ // Пропускаем добавленный символ
        }
        i++
    }

    println("Result: $changes = $sb")
}