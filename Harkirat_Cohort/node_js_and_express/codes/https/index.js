// npx nodemon index.js

// 1. Import external library
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT || 3000;


app.use(bodyParser.json());
app.get("/", (req, res) => {
    res.send("Hello World!");
});


app.post("/", (req, res) => {
    const body = req.body;
    console.log("body:", body);
    res.send({ body });
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});


app.get('/search', (req, res) => {
    // Access query parameters
    const term = req.query.term; // 'apple' from ?term=apple
    const category = req.query.category; // 'fruits' from ?category=fruits

    // Send a response based on the query parameters
    res.send(`Search results for term: ${term} in category: ${category}`);
});


/**
 * Without adding dotenv we can change port 
 * set, const port = process.env.PORT || 3000;
 * then in terminal, 
 * 1. $env:PORT=3015 for powershell
 * 2. export PORT=3014 for bash
 * 2. set PORT=3017 for Command Prompt
 * run node index.js
 *  */