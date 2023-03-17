// Create a new file using the appendFile() method:
let fs = require("fs");
fs.appendFile("fileName_6", "Hello File 6", (err) => {
    if (err) throw err;
    console.log("NewFile Created Successfully!");
});

console.log("Before readFile")
fs.readFile('./fileName_6',
    { encoding: 'utf8', flag: 'r' },
    (err, data) => {
        if (err)
            console.log(err);
        else
            console.log("readFile:----------", data);
    });
console.log("After readFile")
