import React, { useState } from "react";

type State = {
  name: string;
  email: string;
  password: string;
  mobile: number;
};

const initistate: State = {
  name: "",
  email: "",
  password: "",
  mobile: 0,
};

function UseState() {
  const [loading, setLoading] = useState<boolean>(false);
  const [form, setForm] = useState<State>(initistate);

  return <div></div>;
}

export default UseState;
