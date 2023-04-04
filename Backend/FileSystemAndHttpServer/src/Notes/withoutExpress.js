const http = require("http");
const Hostname = "127.0.0.1";
const PORT = 3100;
let time = require("./myFirstModule");
let bodyHtml = require("./Body")


// const server = http.createServer((req, res) => {
//     const body = `<h1>Server Without Express Time ${time.myDateTime()}</h1> `;
//     res.statusCode = 201;
//     res.setHeader('Content-Type', 'text/html');
//     res.write(body);
//     res.end();
// })

let server = http.createServer((req, res) => {
    // let body = `<h1>Hello ashish</h1>`;
    let body = `<div>${bodyHtml.myHtmlBody()}</div>`
    res.writeHead(201, 'Content-type', 'text/html');
    res.write(body);
    res.end()
})


server.listen(PORT, Hostname, () => {
    console.log(`Server on http://localhost:${PORT}`);
});


//2. simple Http
// http.createServer((req, res) => {
//     res.write("Hello world!");
//     res.end();
// }).listen(3000);

//3. http adding html;
// http.createServer((req, res) => {
//     res.writeHead(200, { 'Content-Type': 'text/html' });
//     res.write("Hello Ashish!");
//     res.end();
// }).listen(3001)


//creating html file
// const fs = require('fs');

// fs.appendFile("Body.html", "Who are you Ashish? How was going", (err) => {
//     if (err) {
//         console.log(err);
//     }
//     else {
//         console.log("File Created SuccessFully")
//     }
// })
