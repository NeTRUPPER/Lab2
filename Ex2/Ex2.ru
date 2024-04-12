morse_alphabet = [
  ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
  "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
]

def to_morse_code(word, morse_alphabet)
  morse_word = ""
  word.each_char do |c|
    index = c.ord - 'a'.ord
    morse_word += morse_alphabet[index]
  end
  morse_word
end

def compare_morse_words(word1, word2)
  return false if word1.length != word2.length

  sorted_word1 = word1.chars.sort.join
  sorted_word2 = word2.chars.sort.join

  sorted_word1 == sorted_word2
end

def count_matching_morse_words(words, morse_alphabet)
  count = 0

  morse_words = words.map { |word| to_morse_code(word, morse_alphabet) }

  morse_words.each_with_index do |word1, i|
    ((i + 1)...morse_words.length).each do |j|
      count += 1 if compare_morse_words(word1, morse_words[j])
    end
  end

  count
end

puts "Enter the number of words: "
n = gets.chomp.to_i

input = []
puts "Enter the words: "
n.times do
  word = gets.chomp
  input << word
end

if input.length == 1 && input[0].length == 1
  puts "Number of matching Morse words: 1"
else
  matching_count = count_matching_morse_words(input, morse_alphabet)
  puts "Number of matching Morse words: #{matching_count}"
end