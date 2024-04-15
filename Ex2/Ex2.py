import itertools

morse_alphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
]

# dict для хранения соответствия между символами и их представлением в коде Морзе.
char_to_morse = {}

def init_char_to_morse_map():
    for i, code in enumerate(morse_alphabet):
        char_to_morse[chr(ord('a') + i)] = code

# Функция генерирует перестановки переданной строки и добавляет их в контейнер.
def generate_permutations(str):
    return set(''.join(p) for p in itertools.permutations(str))

# Преобразую строку в код Морзе, используя созданный dict.
def string_to_morse(str):
    return ''.join(char_to_morse[c] for c in str)

def main():
    init_char_to_morse_map()
    input_str = input("Введите слова для перестановки (разделяйте их пробелами): ")

    # Разделяем ввод на отдельные слова.
    words = input_str.split()
    unique_morse_words = set()

    for word in words:
        permutations = generate_permutations(word)

        for permutation in permutations:
            unique_morse_words.add(string_to_morse(permutation))

    print("Уникальные слова в языке Морзе:")
    for morse_word in unique_morse_words:
        print(morse_word)

    print("Количество уникальных слов:", len(unique_morse_words))

if __name__ == "__main__":
    main()