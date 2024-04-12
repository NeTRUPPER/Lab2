use std::io;

fn min_changes(s: &str) -> usize {
    let mut count = 0;
    let mut chars = s.chars().collect::<Vec<char>>();

    for i in 0..chars.len() - 2 {
        if chars[i] == chars[i + 1] && chars[i + 1] == chars[i + 2] {
            count += 1;
            chars.insert(i + 2, ('a' as u8 + rand::random::<u8>() % 26) as char);
        }
    }

    count
}

fn main() {
    let mut input = String::new();

    println!("Example: str = ");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let str = input.trim();

    let changes = min_changes(str);

    let mut result = String::from(str);
    let mut i = 0;

    while i < result.len() - 2 {
        if result.chars().nth(i) == result.chars().nth(i + 1) && result.chars().nth(i + 1) == result.chars().nth(i + 2) {
            let new_symbol = ('a' as u8 + rand::random::<u8>() % 26) as char;
            result.insert(i + 2, new_symbol);
            i += 2;
        }
        i += 1;
    }

    println!("Result: {} = {}", changes, result);
}