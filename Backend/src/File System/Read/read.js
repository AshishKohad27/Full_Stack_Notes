const fs = require('fs');
const http = require('http');
const hostname = "localhost";
const port = 8080;
const server = http.createServer((req, res) => {
    fs.readFile('read.html', (err, data) => {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.write(data);
        res.end();
    })
})

server.listen(port, hostname, () => {
    console.log(`Read File System http://localhost:${port}`)
})