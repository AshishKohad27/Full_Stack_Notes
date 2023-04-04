//without express
const hostname = "127.0.0.1";
const port = 3000;
const http = require("http");
const server = http.createServer((req, res) => {
    const html = `
    <h1>Hello World!</h1>
    <p>We created our simple server!</p>
`;

    res.statusCode = 200;
    res.setHeader("Content-Type", "text/html");
    res.write(html);
    res.end();
})
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
//without express
const express = require("express");
const userRoute = require("./MVC/user.route");




const app = express();

app.use(express.json());

const middleWare = (req, res, next) => {
    console.log("Before Request MiddleWare")
    next();
    console.log("After Request MiddleWare")
}

app.use("/user", userRoute);

//middle Ware   
app.use('/user/:id', (req, res, next) => {
    console.log('Request URL:', req.originalUrl)
    next()
}, (req, res, next) => {
    console.log('Request Type:', req.method)
    next();
})

app.get("/", middleWare, (req, res) => {
    console.log("Get Method")
    res.send("Hello World!");
})

app.listen(8080, () => {
    console.log(`Listening on http://localhost:8080`);
})