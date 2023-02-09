const fs = require('fs');
fs.appendFile('updateFile_1.txt', ' this method allow us to writer after already written code in same file', (err) => {
    if (err) throw err;
    console.log("Update File!")
})