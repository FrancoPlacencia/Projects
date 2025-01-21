require("dotenv").config();
//require("./config/database").connect();
const express = require("express");
const app = express();

app.use(express.json);

app.get("/",(req, res) => {
    res.status(200).send("Welcome");
});

module.exports = app;