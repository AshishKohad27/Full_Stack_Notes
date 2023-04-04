# Lifecycle of Components

src:- https://www.w3schools.com/react/react_class.asp

1. Mounting
   Mounting means putting elements into the DOM.

React has four built-in methods that gets called, in this order, when mounting a component:

1. ## constructor()

- The constructor() method is called before anything else, when the component is initiated, and it is the natural place to set up the initial state and other initial values.

- The constructor() method is called with the props, as arguments, and you should always start by calling the super(props) before anything else, this will initiate the parent's constructor method and allows the component to inherit methods from its parent (React.Component).

```javascript
class Header extends React.Component {
  constructor(props) {
    // is the natural place to set up the initial state and other initial values.
    super(props); // allows the component to inherit methods from its parent
    this.state = { favoritecolor: "red" };
  }
  render() {
    return <h1>My Favorite Color is {this.state.favoritecolor}</h1>;
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header />);
```

2. ## getDerivedStateFromProps()

- getDerivedStateFromProps
  The getDerivedStateFromProps() method is called right before rendering the element(s) in the DOM.

- This is the natural place to set the state object based on the initial props.

- It takes state as an argument, and returns an object with changes to the state.

- The example below starts with the favorite color being "red", but the getDerivedStateFromProps() method updates the favorite color based on the favcol attribute:

Example:

```javascript
The getDerivedStateFromProps method is called right before the render method:

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = {favoritecolor: "red"};
  }
  static getDerivedStateFromProps(props, state) {
    return {favoritecolor: props.favcol };
  }
  render() {
    return (
      <h1>My Favorite Color is {this.state.favoritecolor}</h1>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Header favcol="yellow"/>);
```

3. render()

   - The render() method is required and will always be called, the others are optional and will be called if you define them.
   - is the method that actually outputs the HTML to the DOM.

4. componentDidMount()
   - The componentDidMount() method is called after the component is rendered.

- This is where you run statements that requires that the component is already placed in the DOM.

```javascript
class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { favoritecolor: "red" };
  }
  componentDidMount() {
    setTimeout(() => {
      this.setState({ favoritecolor: "yellow" });
    }, 1000);
  }
  render() {
    return <h1>My Favorite Color is {this.state.favoritecolor}</h1>;
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header />);
```

2. # Updating
   The next phase in the lifecycle is when a component is updated.

A component is updated whenever there is a change in the component's state or props.

React has five built-in methods that gets called, in this order, when a component is updated:

1. ## getDerivedStateFromProps()

- Also at updates the getDerivedStateFromProps method is called. This is the first method that is called when a component gets updated.

- This is still the natural place to set the state object based on the initial props.

- The example below has a button that changes the favorite color to blue, but since the getDerivedStateFromProps() method is called, which updates the state with the color from the favcol attribute, the favorite color is still rendered as yellow:

```javascript
class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { favoritecolor: "red" };
  }
  static getDerivedStateFromProps(props, state) {
    return { favoritecolor: props.favcol };
  }
  changeColor = () => {
    this.setState({ favoritecolor: "blue" });
  };
  render() {
    return (
      <div>
        <h1>My Favorite Color is {this.state.favoritecolor}</h1>
        <button type="button" onClick={this.changeColor}>
          Change color
        </button>
      </div>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header favcol="yellow" />);
```

example:- https://codesandbox.io/s/class-components-1-basic-7qiko8?file=/src/Class/GetDerivedStateFromProps.jsx

2. ## shouldComponentUpdate();

- In the shouldComponentUpdate() method you can return a Boolean value that specifies whether React should continue with the rendering or not.

- The default value is true.

- The example below shows what happens when the shouldComponentUpdate() method returns false:

```javascript
//Stop the component from rendering at any update:

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { favoritecolor: "red" };
  }
  shouldComponentUpdate() {
    return false;
  }
  changeColor = () => {
    this.setState({ favoritecolor: "blue" });
  };
  render() {
    return (
      <div>
        <h1>My Favorite Color is {this.state.favoritecolor}</h1>
        <button type="button" onClick={this.changeColor}>
          Change color
        </button>
      </div>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header />);
```

```javascript
//Same example as above, but this time the shouldComponentUpdate() method returns true instead:
class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { favoritecolor: "red" };
  }
  shouldComponentUpdate() {
    return true;
  }
  changeColor = () => {
    this.setState({ favoritecolor: "blue" });
  };
  render() {
    return (
      <div>
        <h1>My Favorite Color is {this.state.favoritecolor}</h1>
        <button type="button" onClick={this.changeColor}>
          Change color
        </button>
      </div>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header />);
```

Example:- https://codesandbox.io/s/class-components-1-basic-7qiko8?file=/src/Class/ShouldComponentUpdate.jsx

3. ## render()
4. ## getSnapshotBeforeUpdate()
   getSnapshotBeforeUpdate
   In the getSnapshotBeforeUpdate() method you have access to the props and state before the update, meaning that even after the update, you can check what the values were before the update.

- If the getSnapshotBeforeUpdate() method is present, you should also include the componentDidUpdate() method, otherwise you will get an error.

- The example below might seem complicated, but all it does is this:

- When the component is mounting it is rendered with the favorite color "red".

- When the component has been mounted, a timer changes the state, and after one second, the favorite color becomes "yellow".

- This action triggers the update phase, and since this component has a getSnapshotBeforeUpdate() method, this method is executed, and writes a message to the empty DIV1 element.

- Then the componentDidUpdate() method is executed and writes a message in the empty DIV2 element:

```javascript
Example:
//Use the getSnapshotBeforeUpdate() method to find out what the state object looked like before the update:

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = {favoritecolor: "red"};
  }
  componentDidMount() {
    setTimeout(() => {
      this.setState({favoritecolor: "yellow"})
    }, 1000)
  }
  getSnapshotBeforeUpdate(prevProps, prevState) {
    document.getElementById("div1").innerHTML =
    "Before the update, the favorite was " + prevState.favoritecolor;
  }
  componentDidUpdate() {
    document.getElementById("div2").innerHTML =
    "The updated favorite is " + this.state.favoritecolor;
  }
  render() {
    return (
      <div>
        <h1>My Favorite Color is {this.state.favoritecolor}</h1>
        <div id="div1"></div>
        <div id="div2"></div>
      </div>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Header />);
```

example:- https://codesandbox.io/s/class-components-1-basic-7qiko8?file=/src/Class/GetSnapshotBeforeUpdate.jsx:672-792

5. ## componentDidUpdate()

- The componentDidUpdate method is called after the component is updated in the DOM.

- The example below might seem complicated, but all it does is this:

- When the component is mounting it is rendered with the favorite color "red".

- When the component has been mounted, a timer changes the state, and the color becomes "yellow".

- This action triggers the update phase, and since this component has a componentDidUpdate method, this method is executed and writes a message in the empty DIV element:

```javascript
//Example:
//The componentDidUpdate method is called after the update has been rendered in the DOM:

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { favoritecolor: "red" };
  }
  componentDidMount() {
    setTimeout(() => {
      this.setState({ favoritecolor: "yellow" });
    }, 1000);
  }
  componentDidUpdate() {
    document.getElementById("mydiv").innerHTML =
      "The updated favorite is " + this.state.favoritecolor;
  }
  render() {
    return (
      <div>
        <h1>My Favorite Color is {this.state.favoritecolor}</h1>
        <div id="mydiv"></div>
      </div>
    );
  }
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Header />);
```

Example:- https://codesandbox.io/s/class-components-1-basic-7qiko8?file=/src/Class/ComponentWillUnMounted.jsx

$notes:- The render() method is required and will always be called, the others are optional and will be called if you define them.
