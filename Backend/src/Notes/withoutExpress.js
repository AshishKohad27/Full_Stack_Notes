const http = require("http");
const Hostname = "127.0.0.1";
const PORT = 3000;
let time = require("./myFirstModule");


// const server = http.createServer((req, res) => {
//     const body = `<h1>Server Without Express Time ${time.myDateTime()}</h1> `;
//     res.statusCode = 201;
//     res.setHeader('Content-Type', 'text/html');
//     res.write(body);
//     res.end();
// })


// server.listen(PORT, Hostname, () => {
//     console.log(`Server on http://localhost:${PORT}`);
// });


//2. simple Http
// http.createServer((req, res) => {
//     res.write("Hello world!");
//     res.end();
// }).listen(3000);

//3. http adding html;
http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write("Hello Ashish!");
    res.end();
}).listen(3001)