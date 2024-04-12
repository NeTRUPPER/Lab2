package awesomeProject1

import (
    "fmt"
    "math/rand"
    "strings"
    "time"
)

func minChanges(str string) int {
    count := 0
    for i := 0; i < len(str)-2; i++ {
       if str[i] == str[i+1] && str[i+1] == str[i+2] {
          count++
          i += 2 // Пропускаем следующие два символа, так как они уже подходят
       }
    }
    return count
}

func main() {
    rand.Seed(time.Now().UnixNano())

    var str string
    fmt.Print("Example: str = ")
    fmt.Scanln(&str)

    changes := minChanges(str)

    var sb strings.Builder

    // Добавляем символы в строку
    for i := 0; i < len(str)-2; i++ {
       if str[i] == str[i+1] && str[i+1] == str[i+2] {
          newSymbol := byte('a' + rand.Intn('z'-'a'+1))
          sb.WriteString(str[i : i+3])
          sb.WriteByte(newSymbol)
          i++ // Пропускаем добавленный символ
       } else {
          sb.WriteByte(str[i])
       }
    }
    sb.WriteString(str[len(str)-2:])

    fmt.Printf("Result: %d = %s\n", changes, sb.String())
}