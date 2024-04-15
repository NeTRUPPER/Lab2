const morseAlphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
];

// Map to store the correspondence between characters and their Morse representation.
const charToMorse = new Map();

function initCharToMorseMap() {
    for (let i = 0; i < 26; ++i) {
        charToMorse.set(String.fromCharCode(97 + i), morseAlphabet[i]);
    }
}

// Function to generate permutations of the given string and add them to the container.
function generatePermutations(str, l, r, permutations) {
    if (l === r) {
        permutations.add(str);
    } else {
        for (let i = l; i <= r; i++) {
            str = swap(str, l, i);
            generatePermutations(str, l + 1, r, permutations);
            str = swap(str, l, i);
        }
    }
}

function swap(str, i, j) {
    let charArray = str.split('');
    let temp = charArray[i];
    charArray[i] = charArray[j];
    charArray[j] = temp;
    return charArray.join('');
}

// Function to convert a string to Morse code using the created map.
function stringToMorse(str) {
    let morseString = "";
    for (let i = 0; i < str.length; i++) {
        morseString += charToMorse.get(str[i]);
    }
    return morseString;
}

function main() {
    initCharToMorseMap();
    let input = prompt("Enter words to permute (separate them with spaces): ");

    // Split the input into separate words.
    let words = input.split(' ');
    let uniqueMorseWords = new Set();

    for (let word of words) {
        let permutations = new Set();
        generatePermutations(word, 0, word.length - 1, permutations);

        for (let permutation of permutations) {
            uniqueMorseWords.add(stringToMorse(permutation));
        }
    }

    console.log("Unique words in Morse code:");
    for (let morseWord of uniqueMorseWords) {
        console.log(morseWord);
    }

    console.log("Number of unique words: " + uniqueMorseWords.size);
}

main();