const fs = require('fs');

fs.appendFile('CreateFile_3', 'Hello World aSHISH', (err) => {
    if (err) throw err;
    console.log("Create File");
})

//rename file
fs.rename('CreateFile_2', 'RenameFile_2', (err) => {
    if (err) throw err;
    console.log('Rename File')
})