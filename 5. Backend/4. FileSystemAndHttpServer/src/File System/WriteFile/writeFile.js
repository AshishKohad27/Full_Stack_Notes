// The fs.writeFile() method replaces the specified file and content if it exists. 
// If the file does not exist, a new file, containing the specified content, will
//  be created:
const fs = require('fs');

fs.writeFile("WriteFile_1.txt", 'If content replace with new content', (err) => {
    if (err) throw err;
    console.log("Write also help us to replace")
})