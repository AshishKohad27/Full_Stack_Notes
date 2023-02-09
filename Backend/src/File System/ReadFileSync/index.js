const http = require("http");
const hostname = "localhost";
const port = 8080;
const fs = require("fs");

const server = http.createServer((req, res) => {
    fs.readFile("input1.txt", (err, data) => {
        // res.writeHead(200, { 'Content-Type': 'text/html' });
        // res.write(data);
        // res.end();
        //or
        res.statusCode = 200;
        res.setHeader({ 'Content-Type': 'text/html' });
        res.write("input1.txt");
        res.end();
        
        // console.log(data);
    })
})
// server.listen(port, hostname, () => {
//     console.log(`Server running at http://${hostname}:${port}`);
// });

// or without http
console.log("Before readFile")
fs.readFile('./input1.txt',
    { encoding: 'utf8', flag: 'r' },
    (err, data) => {
        if (err)
        console.log(err);
        else
            console.log("readFile:----------",data);
    });
console.log("After readFile")


//Blocking 
console.log("Before readFileSync")
let data = fs.readFileSync("./input2.txt", { encoding: 'utf8',flag:'r'})
console.log('readFileSync-----------:', data)
console.log("After readFileSync")



