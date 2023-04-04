import React from "react"
import ReactDOM from "react-dom"


const text = React.createElement("h1", {}, "Without Jsx");
const container = React.createElement("div", { className: 'my-components' }, text);

const rootElement = document.getElementById("root");

ReactDOM.render(container, rootElement);