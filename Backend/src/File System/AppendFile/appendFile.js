// Create a new file using the appendFile() method:
let fs = require('fs');
fs.appendFile('fileName_3.html', 'Hello File 1', (err) => {
    if (err) throw err
    console.log("NewFile Created Successfully!")
});
