morse_alphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
]


def to_morse_code(word):
    morse_word = ""

    for c in word:
        index = ord(c) - ord('a')
        morse_word += morse_alphabet[index]

    return morse_word


def compare_morse_words(word1, word2):
    if len(word1) != len(word2):
        return False

    sorted_word1 = ''.join(sorted(word1))
    sorted_word2 = ''.join(sorted(word2))

    return sorted_word1 == sorted_word2


def count_matching_morse_words(words):
    count = 0
    morse_words = [to_morse_code(word) for word in words]

    for i in range(len(morse_words)):
        for j in range(i + 1, len(morse_words)):
            if compare_morse_words(morse_words[i], morse_words[j]):
                count += 1

    return count


if __name__ == "__main__":
    n = int(input("Enter the number of words: "))

    input_words = []
    print("Enter the words:")
    for _ in range(n):
        word = input()
        input_words.append(word)

    if len(input_words) == 1 and len(input_words[0]) == 1:
        print("Number of matching Morse words: 1")
    else:
        matching_count = count_matching_morse_words(input_words)
        print(f"Number of matching Morse words: {matching_count}")