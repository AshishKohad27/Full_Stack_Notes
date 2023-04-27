import express, { Express, Request, Response } from "express";

const app: Express = express();

const PORT: number = 8080;

app.get('/', (req: Request, res: Response) => {
    res.send('Hello from Express !!!!');
});

app.get('/hi', (req: Request, res: Response) => {
    res.send('<h1>Hello Ashish Kohad!!!!</h1>');
});


app.listen(PORT, () => {
    console.log(`http://localhost:${PORT}`);
})