import React from "react";

interface BlogProps {
  name: string;
  id: number;
  list: {
    id: number;
    name: string;
    email: string;
    gender: string;
  }[];
  category: "Sport" | "Economics" | "Animals" | "Wars";
  children: React.ReactNode;
  style: React.CSSProperties;
}

function Blog(props: BlogProps) {
  return (
    <div>
      <h1 style={props.style}>Blog Components</h1>
      <h1> Children: {props.children}</h1>
      <h1>{props.name}</h1>
      <h1>Category: {props.category}</h1>
      {props.list.map((item, index) => (
        <div
          key={index}
          style={{
            display: "flex",
            justifyContent: "center",
            alignContent: "center",
          }}
        >
          <h1>{item.id}</h1>
          <h1>name: {item.name}</h1>
          <h1>email: {item.email}</h1>
        </div>
      ))}
    </div>
  );
}

export default Blog;
