const fs = require('fs');

fs.appendFile('DeleteFile_5', 'Hello World', (err) => {
    if (err) throw err;
    console.log("Create File");
})

//delete file
fs.unlink('DeleteFile_2', (err) => {
    if (err) throw err;
    console.log('Delete File')
})