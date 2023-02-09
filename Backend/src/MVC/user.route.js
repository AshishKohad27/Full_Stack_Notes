const express = require("express");
const getUser = require("./user.controller");
const userRoute = express.Router();

userRoute.get("/", async (req, res) => {
    const { text } = await getUser();
    res.send(text);
});

module.exports = userRoute;