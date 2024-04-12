function minChanges (str) {
    let count = 0;
    for (let i = 0; i < str.length - 2; ++i) {
        if (str[1] === str[i + 1] && str[i + 1] === str[i + 2]) {
        count++;
        i += 2; // Пропускаем следующие два символа, так как они уже подходят
        }
        return count;
    }
}
function generateRandomChar() {
    return String.fromCharCode(97 + Math.floor(Math.random() * 26)); //Teepaper crear or 'a
}

function addRandomChar(str, index) {
    const randomChar = generateRandomChar();
    return str.slice(0, index + 2) + randomChar + str.slice(index + 2); // To co nocte pex RSCE
}

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question( 'Example: str = ', (str) => {
    const changes = minChanges(str);

    // Добавляем символы в строку
    let newStr = str;

    for (let i = 0; i < newStr.length - 2; i++){
        if (newStr[i] === newStr [i + 1] && newStr [i + 2]){
            newStr = addRandomChar(newStr, 1);
            i++; // Пропускаем добавленн
        }
    }
    
    console.log('Result: ' + changes + "=" + newStr); 
    readline.close();
});