require("dotenv").config();
const express = require("express");
const PORT = process.env.PORT;
const connect = require("./config/db");
const app = express();

app.use(express.json());

app.get("/", async (req, res) => {
    res.send("Hello Ashish");
});

app.listen(PORT, async () => {
    await connect();
    console.log(`http://localhost:${PORT}`)
})