
// Node.js program to demonstrate the 
// fs.readFileSync() method

// Include fs module
const fs = require('fs');

// Calling the fs.readFile() method
// for reading file 'input1.txt'
fs.readFile('./input1.txt',
    { encoding: 'utf8', flag: 'r' },
     (err, data)=> {
        if (err)
            console.log(err);
        else
            console.log(data);
    });

// Calling the fs.readFileSync() method
// for reading file 'input2.txt'
const data = fs.readFileSync('./input2.txt',
    { encoding: 'utf8', flag: 'r' });

// Display data
console.log(data);

//output:
// input text 2
// input text 1

// Observation: We can observe that when we are calling the fs.readFile() method which reads ‘input1.txt’ and after that we are calling the fs.readFileSync() method which reads the ‘input2.txt’ file, but seeing the output we find that ‘input2.txt’ file is read first then ‘input1.txt’ file, this happens because when the compiler compiles the node.js file it first calls the fs.readFile() method which reads a file, but parallelly it continues to compile the remaining program too, after that it calls the fs.readFileSync() method which reads another file, when calling the readFileSync() method the compiler stops other parallel process(which is here reading the ‘input1.txt’ file from readFile() method) and continues the ongoing process to it’s end, whenever the ongoing process ends the compiler resumes the remaining process that’s why we observe that the contents of ‘input2.txt’ is printed first rather than ‘input1.txt’.So, we can use fs.readFileSync() method for tasks like pausing other parallel processes and read a file synchronously.