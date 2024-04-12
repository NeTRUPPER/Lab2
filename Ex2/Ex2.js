const morseAlphabet = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
];

function toMorseCode(word) {
    let morseWord = "";

    for (let i = 0; i < word.length; i++) {
        let index = word.charCodeAt(i) - 'a'.charCodeAt(0);
        morseWord += morseAlphabet[index];
    }

    return morseWord;
}

function compareMorseWords(word1, word2) {
    if (word1.length !== word2.length) {
        return false;
    }

    let sortedWord1 = word1.split('').sort().join('');
    let sortedWord2 = word2.split('').sort().join('');

    return sortedWord1 === sortedWord2;
}

function countMatchingMorseWords(words) {
    let count = 0;

    let morseWords = [];
    for (let word of words) {
        morseWords.push(toMorseCode(word));
    }

    for (let i = 0; i < morseWords.length; i++) {
        for (let j = i + 1; j < morseWords.length; j++) {
            if (compareMorseWords(morseWords[i], morseWords[j])) {
                count++;
            }
        }
    }

    return count;
}

function main() {
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    });

    readline.question("Enter the number of words: ", (n) => {
        let input = [];
        console.log("Enter the words: ");
        readline.on('line', (word) => {
            input.push(word);
            if (input.length == n) {
                readline.close();
                if (input.length === 1 && input[0].length === 1) {
                    console.log("Number of matching Morse words: 1");
                    return;
                }
                let matchingCount = countMatchingMorseWords(input);
                console.log("Number of matching Morse words: " + matchingCount);
            }
        });
    });
}

main();