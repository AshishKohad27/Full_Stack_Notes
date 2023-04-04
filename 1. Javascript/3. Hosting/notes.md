# Hosting

src:- https://www.scaler.com/topics/hoisting-in-javascript/#es5

```javascript
console.log(temp);
var temp = "Scaler";
Output: undefined;
```

- The code actually looks like the following to the javascript engine,

```javascript
var temp;
console.log(temp);
temp = "scaler";
```

- It is putting the declaration of the variable at the top of the code and the temp variable is assigned a value undefined (a primitive data type) and because we console it we get the same, this is an example of javascript hoisting.

## Definition:-

## "The javascript mechanism in which variables and function declarations are moved to the top of their scope before execution of the code is called as Hoisting."

<br/>

## Behind the scenes of Hoisting in Javascript

Let us look at some concepts which we must understand if we want to fully make sense of Hoisting in Javascript.

## Execution context:

- In layman's terms, an execution context refers to an abstract environment where the javascript code gets executed. This environment consists of what are the variables, functions, objects in its scope, the memory allocated and the line by line execution of the code.
- The execution context created on the first time parsing the code is called global execution context(GEC), the ones created after it is called local/functional execution contexts(FEC).

## Creation of execution context

How Javascript executes the code behind the scenes is that it creates a (global) execution
context. This execution context creation has two phases: Creation and Execution

1. Creation phase:

- Javascript engine first scans the code, registers the variables in the scope and allocates memory to all the variable and function declarations.
- If it encounters a variable, it is given the value undefined, and if it encounters a function, then the value is the function code itself, and a new (local) execution context is created.

2. Execution phase:

- After the creation phase, JS engine executes the code line by line.
  So in our previous example:

```javascript
console.log(temp);
var temp = "Scaler";
```

the temp variable will first be assigned the value undefined, and then the execution happens line by line.
Creation of execution context
![Alt text](Images/creation-of-execution-context.webp)
This is the core of Hoisting; when we say variables and function declarations are moved to the top of the code, this is what we mean, the variables are registered in the scope, memory is allocated before the code execution begins because of which it seems like as if they are available to us on the top of the code!

```javascript
var temp; // allocated memory and undefined value;
console.log(temp); // Returns 'undefined'
temp = "Scaler"; // Initialization
console.log(temp); // Returns 'Scaler'`
```

ES6
let and const Hoisting in Javascript

let and const were introduced in ES6. Is hoisting possible with let and const? Though in many places you will see that the answer is No. This is not true All javascript variables are hoisted irrespective of var or let or const declaration, but let and const are hoisted differently. Let us look in-depth into this in the next sections.

Takeaway:

let and const are hoisted in Javascript but they are hoisted differently than var

let keyword Hoisting in Javscript
Let us look at the following code:

console.log(temp)
let temp= "Scaler"
Output:

Uncaught ReferenceError: Cannot access 'temp' before initialization at ++script.js.1++
We got an error that we did not see in the previous examples. The reason for this is var is both declared and initialized during Hoisting, but let is not initialized it is only declared. The variable is in a temporal dead zone(TDZ) till then.

Let us see the let variable lifecycle to understand this better:
let variable lifecycle

Explanation:

In the creation phase for variables declared with let only declaration occurs there is no initialization.
A variable declared with let will be initialized only during the execution phase when the JS engine reaches the line with let keyword at this point it will be given the value undefined
The gap we see between the point at which the variable is in the uninitialized state and the point where it gets initialized is called the Temporal dead zone (TDZ)
Then the assignment happens temp is given the value "Scaler".
Takeaway:

var is both declared and initialized during Hoisting, but let is not initialized it is only declared.Hence when we try to access a let variable before it is declared we get an error.

const keyword Hoisting in Javascript
const hoisting is the same as let hoisting except one difference. In let the assignment happens after initialization but in const the assignment and initialization happen together, this is because once assigned the value of const cannot change, if we assign undefined and then assign another value this breaks the rule of const

Example:

console.log(temp)
const temp = "Scaler"
Output:

Uncaught ReferenceError: Cannot access 'temp' before initialization at ++script.js.1++
const variable lifecyle
)

explanation:

In the creation phase for variables declared with let only memory is allocated, there is no initialization.
A variable declared with const will be initialized only during the execution phase when the JS engine reaches the line with the const keyword, at this point assignment will happen and it will be given the value it is declared with.
The gap we see between the point at which the variable is in the uninitialized state and the point where it gets initialized is called the Temporal dead zone (TDZ).
Takeaway:

var is both declared and initialized during Hoisting, but const is not initialized; it is only declared. Hence when we try to access a const variable before it is declared, we get an error.

Conclusion
The javascript mechanism in which variables and function declarations are moved to the top of their scope before code execution is called Hoisting.
Hoisting gives us an advantage that variables and functions can be accessed before they are declared.
Function expressions and arrow functions cannot be hoisted.
The sequence of variable declaration and initialization or the lifecycle of a variable is as follows: Declaration -> Initialization -> Assignment.
All variables in javascript are hoisted, but var variables are hoisted in one way and let , const are hoisted in another way.

# Callback Hell

scr:- https://www.scaler.com/topics/nodejs/node-js-callback-hell/

