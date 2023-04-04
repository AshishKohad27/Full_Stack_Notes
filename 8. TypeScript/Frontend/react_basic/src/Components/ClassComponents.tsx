import React from "react";

type MainComp = {
  name: string;
  email: string;
  status: boolean;
};

type MainProps = {
  category: string;
};

export default class ClassComponents extends React.Component<
  MainProps,
  MainComp
> {
  constructor(params: MainProps) {
    super(params);

    this.state = {
      name: "NA",
      email: "na@gmail.com",
      status: true,
    };
  }

  handleButton(gmail: string) {
    this.setState({
      email: gmail,
      status: !this.state.status,
    });
  }
  render() {
    return (
      <div>
        <h1>Class Components</h1>
        <h1>{this.state.name}</h1>
        <h1>{this.state.email}</h1>
        <h1>Props: {this.props.category}</h1>
        {this.state.status ? <h1>Hey Ashish</h1> : <h1>Kay Zala</h1>}
        <button onClick={() => this.handleButton("demo@gmail.com")}>
          Change
        </button>
      </div>
    );
  }
}
