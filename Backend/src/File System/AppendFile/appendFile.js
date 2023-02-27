// Create a new file using the appendFile() method:
let fs = require("fs");
fs.appendFile("fileName_5", "Hello File 5", (err) => {
    if (err) throw err;
    console.log("NewFile Created Successfully!");
});

console.log("Before readFile")
fs.readFile('./fileName_5',
    { encoding: 'utf8', flag: 'r' },
    (err, data) => {
        if (err)
            console.log(err);
        else
            console.log("readFile:----------", data);
    });
console.log("After readFile")
