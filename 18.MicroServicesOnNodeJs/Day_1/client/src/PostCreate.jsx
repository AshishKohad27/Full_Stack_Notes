import React, { useState } from "react";
import axios from "axios";

export default function PostCreate() {
    const [title, setTitle] = useState('');

    const handleSubmit = async (event) => {
        event.preventDefault();
        console.log("title", title);
        try {
            await axios.post('http://localhost:8080/posts', { title });
            setTitle('');
        } catch (error) {
            console.error("Error occurred while posting data:", error);
        }

        setTitle('');
    }
    return (
        <div>
            <form action="" onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="form-control-title">Title</label>
                    <input id="form-control-title" value={title} onChange={e => setTitle(e.target.value)} type="text" className="form-control" />
                </div>
                <button className="btn btn-primary">
                    Submit
                </button>
            </form>
        </div>
    )
}