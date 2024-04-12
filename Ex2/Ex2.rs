fn to_morse_code(word: &str) -> String {
    let morse_alphabet = vec![
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
        "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
    ];

    let mut morse_word = String::new();

    for c in word.chars() {
        let index = c as usize - 'a' as usize;
        morse_word.push_str(&morse_alphabet[index]);
    }

    morse_word
}

fn compare_morse_words(word1: &str, word2: &str) -> bool {
    if word1.len() != word2.len() {
        return false;
    }

    let mut sorted_word1: Vec<char> = word1.chars().collect();
    sorted_word1.sort();

    let mut sorted_word2: Vec<char> = word2.chars().collect();
    sorted_word2.sort();

    sorted_word1 == sorted_word2
}

fn count_matching_morse_words(words: &Vec<String>) -> i32 {
    let mut count = 0;

    let mut morse_words: Vec<String> = Vec::new();
    for word in words {
        morse_words.push(to_morse_code(word));
    }

    for i in 0..morse_words.len() {
        for j in (i + 1)..morse_words.len() {
            if compare_morse_words(&morse_words[i], &morse_words[j]) {
                count += 1;
            }
        }
    }

    count
}

fn main() {
    let mut input = Vec::new();

    println!("Enter the number of words: ");
    let mut n = String::new();
    std::io::stdin().read_line(&mut n).unwrap();
    let n: usize = n.trim().parse().unwrap();

    println!("Enter the words: ");
    for _ in 0..n {
        let mut word = String::new();
        std::io::stdin().read_line(&mut word).unwrap();
        input.push(word.trim().to_string());
    }

    if input.len() == 1 && input[0].len() == 1 {
        println!("Number of matching Morse words: 1");
        return;
    }

    let matching_count = count_matching_morse_words(&input);
    println!("Number of matching Morse words: {}", matching_count);
}