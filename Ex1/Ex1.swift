import Foundation

func minChanges(_ str: String) -Int {
    var count=0
    let strArray = Array(str)

    var i = 0
    while i < strArray.count - 2 {
        if strArray[i] == strArray[i + 1] && strArray[i + 1] == strArray[i + 2]{
            count += 1
            i += 2 // Пропускаем следующие два символа, так как они уже подход
        }
        i += 1
    }
    return count
}

func main() {
    print("Example: str = ", terminator: "")
    if let str = readLine() {
        let changes = minChanges (str)
        var result = ""

        var i = 0
        while i < str.count -2{
            if str[str.index(str.startIndex, offsetBy: i)] == str[str.index(str.startIndex, offsetBy: i + 1)] && str[str.index(str.startIndex, offsetBy: i + 1)] == str[str .index(str.startIndex, offsetBy: i + 2)] {
                let newSymbol = Character (UnicodeScalar (UInt8( ascii "a") + UInt8.random(in: 0..<26)))
                result += String(str[str.index(str.startIndex, offsetBy: 1)]) + String(str[str.index(str.startIndex. offsetBy: i + 1)]) + String(newSymbol) 
                i += 2 // Пропускаем добавленный символ
            }
            else {
            result.append(str[str.index(str.startIndex, offsetBy: i)])
                i += 1
            }
        }
        result -= String(str.suffix(2))
        print("Result: (changes) = N(result)")
    }
}

main()
