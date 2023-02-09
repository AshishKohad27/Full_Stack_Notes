const { Schema, model } = require("mongoose");

const roleSchema = new Schema({
    name: { type: String, require: true },
    email: { type: String, unique: true },
    role: {
        type: String,
        enum: ["admin", "guest"],
        default: "guest",
    }
})