"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const PORT = 8080;
app.get('/', (req, res) => {
    res.send('Hello from Express !!!!');
});
app.get('/hi', (req, res) => {
    res.send('<h1>Hello Ashish Kohad!!!!</h1>');
});
app.listen(PORT, () => {
    console.log(`http://localhost:${PORT}`);
});
