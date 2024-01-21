const express = require('express');
const { randomBytes } = require('crypto');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());
const CommentsByPostsId = {};

app.get("/posts/:id/comments", (req, res) => {
    res.send(CommentsByPostsId[req.params.id] || []);
});

app.post("/posts/:id/comments", (req, res) => {
    const commentId = randomBytes(4).toString('hex');
    const { content } = req.body;
    const comments = CommentsByPostsId[req.params.id] || [];

    comments.push({ id: commentId, content });

    CommentsByPostsId[req.params.id] = comments;

    res.status(201).send(comments);
});

app.listen(8081, () => {
    console.log('http://localhost:8081');
})