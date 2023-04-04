import React from "react";
import Button from "./Button";

function Events() {
  //handleButton1
  const handleButton1 = (event: React.MouseEvent<HTMLButtonElement>) => {
    console.log("Button1:", event.target);
  };
  //handlespan
  const handleSpan = (event: React.MouseEvent<HTMLSpanElement>) => {
    console.log("Span:", event);
  };

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    console.log("event:", event.target.value);
  };
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <button onClick={(event) => handleButton1(event)}>Button1</button>
      <br />
      <span onClick={(event) => handleSpan(event)}>Span</span>
      <br />
      <input type="text" onChange={handleChange} />
      <br />
      <Button apiHit={(event) => handleButton1(event)} />
    </div>
  );
}

export default Events;
