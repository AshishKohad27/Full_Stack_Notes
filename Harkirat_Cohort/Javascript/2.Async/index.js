// 1. Reading File
// 2. Sending a network request
// 3. A deliberate timeout


const fs = require('fs');

function readFile(filename, callback) {
    fs.readFile(filename, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading file:', err);
            return;
        }
        callback(data);
    });
}

function onDone(content) {
    console.log("content:", content);
}

readFile("a.txt", onDone);
