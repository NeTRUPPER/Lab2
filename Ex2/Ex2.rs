use std::collections::HashMap;
use std::collections::HashSet;
use std::io::{self, Write};

fn init_char_to_morse_map() -> HashMap<char, &'static str> {
    let morse_alphabet = [
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
        ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    ];

    let mut char_to_morse = HashMap::new();
    for (i, code) in morse_alphabet.iter().enumerate() {
        char_to_morse.insert((i as u8 + b'a') as char, *code);
    }
    char_to_morse
}

fn generate_permutations(str: &str) -> HashSet<String> {
    let mut permutations = HashSet::new();
    let mut chars: Vec<char> = str.chars().collect();
    let len = chars.len();
    let mut indices = vec![0; len];
    let mut i = 0;

    permutations.insert(str.to_string());
    while i < len {
        if indices[i] < i {
            if i % 2 == 0 {
                chars.swap(0, i);
            } else {
                chars.swap(indices[i], i);
            }
            permutations.insert(chars.iter().collect::<String>());
            indices[i] += 1;
            i = 0;
        } else {
            indices[i] = 0;
            i += 1;
        }
    }
    permutations
}

fn string_to_morse(str: &str, char_to_morse: &HashMap<char, &str>) -> String {
    let mut morse_string = String::new();
    for c in str.chars() {
        morse_string.push_str(char_to_morse.get(&c).unwrap_or(&""));
    }
    morse_string
}

fn main() {
    let char_to_morse = init_char_to_morse_map();
    let mut input = String::new();
    println!("Введите слова для перестановки (разделяйте их пробелами): ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();

    let words = input.trim().split_whitespace();
    let mut unique_morse_words = HashSet::new();

    for word in words {
        let permutations = generate_permutations(word);
        for permutation in permutations {
            unique_morse_words.insert(string_to_morse(&permutation, &char_to_morse));
        }
    }

    println!("Уникальные слова в языке Морзе:");
    for morse_word in &unique_morse_words {
        println!("{}", morse_word);
    }

    println!("Количество уникальных слов: {}", unique_morse_words.len());
}