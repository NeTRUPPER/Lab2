def init_char_to_morse_map(morse_alphabet)
  @char_to_morse = {}
  ('a'..'z').each_with_index do |c, index|
    @char_to_morse[c] = morse_alphabet[index]
  end
end

# Функция генерирует перестановки переданной строки и добавляет их в контейнер.
def generate_permutations(str)
  str.chars.permutation.to_a.map(&:join).uniq
end

# Преобразую строку в код Морзе, используя созданный hash.
def string_to_morse(str)
  str.chars.map { |c| @char_to_morse[c] }.join
end

def main
  morse_alphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
  ]
  init_char_to_morse_map(morse_alphabet)
  puts "Введите слова для перестановки (разделяйте их пробелами): "
  input = gets.chomp

  # Разделяем ввод на отдельные слова.
  words = input.split
  unique_morse_words = []

  words.each do |word|
    permutations = generate_permutations(word)

    permutations.each do |permutation|
      morse_word = string_to_morse(permutation)
      unique_morse_words << morse_word unless unique_morse_words.include?(morse_word)
    end
  end

  puts "Уникальные слова в языке Морзе:"
  unique_morse_words.each { |morse_word| puts morse_word }

  puts "Количество уникальных слов: #{unique_morse_words.size}"
end

main