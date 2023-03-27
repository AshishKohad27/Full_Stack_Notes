useRef is a hook provided by React that allows you to create a reference to a DOM element or a value, which can be persisted across re-renders. It returns an object with a single property called current, which initially points to null.

Here's an example of how to use useRef to reference an input element:

jsx
Copy code
import { useRef } from 'react';

function TextInput() {
const inputRef = useRef(null);

function handleSubmit(event) {
event.preventDefault();
console.log(inputRef.current.value);
}

return (

<form onSubmit={handleSubmit}>
<label>
Name:
<input type="text" ref={inputRef} />
</label>
<button type="submit">Submit</button>
</form>
);
}
In the example above, we first import the useRef hook from the react module. We then create a reference to an input element using useRef and initialize it to null. We define a handleSubmit function that logs the value of the input field to the console when the form is submitted. Finally, we render a form that includes a text input element with the ref attribute set to the inputRef object, and a submit button.

When the user submits the form, the handleSubmit function is called, which accesses the current value of the input element by using inputRef.current.value. The current property of the inputRef object is updated to point to the input element, which allows us to access its value even after a re-render.



how we can pass useref from parent to child?
You can pass useRef from a parent component to a child component in the same way as you pass other props in React. Here's an example of how to pass useRef from a parent to a child:

Parent Component:

jsx
Copy code
import { useRef } from 'react';
import ChildComponent from './ChildComponent';

function ParentComponent() {
const inputRef = useRef(null);

function handleSubmit(event) {
event.preventDefault();
console.log(inputRef.current.value);
}

return (

<div>
<form onSubmit={handleSubmit}>
<label>
Name:
<input type="text" ref={inputRef} />
</label>
<button type="submit">Submit</button>
</form>
<ChildComponent inputRef={inputRef} />
</div>
);
}
In the above example, we create a useRef object called inputRef and initialize it to null. We define a handleSubmit function that logs the value of the input field to the console when the form is submitted. Finally, we render a form that includes a text input element with the ref attribute set to the inputRef object and a child component called ChildComponent with a prop called inputRef set to the inputRef object.

Child Component:

jsx
Copy code
function ChildComponent(props) {
function handleClick() {
console.log(props.inputRef.current.value);
}

return (

<div>
<button onClick={handleClick}>Get Input Value</button>
</div>
);
}
In the child component, we define a handleClick function that logs the value of the input field to the console when the button is clicked. The handleClick function accesses the inputRef object through the props object passed to the component and uses its current property to access the input element's value.

By passing the inputRef object from the parent component to the child component as a prop, we allow the child component to access and use the inputRef object to access the value of the input element.
