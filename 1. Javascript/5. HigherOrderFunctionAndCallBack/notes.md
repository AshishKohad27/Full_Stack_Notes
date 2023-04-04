
# 9. Callbacks, higher order functions

$ src:- https://blog.greenroots.info/higher-order-functions-in-javascript

- A Higher-Order Function is a regular function that takes one or more functions as arguments and/or returns a function as a value from it.

```javascript
// Define a function that takes a function as an argument.
function getCapture(camera) {
  // Invoke the passed function
  camera();
}

// Invoke the function by passing a function as an argument
getCapture(function(){
  console.log('Canon');
});


Now let us take another function that returns a function.


COPY
// Define a function that returns a function
function returnFunc() {
  return function() {
    console.log('Hi');
  }
}

// Take the returned function in a variable.
const fn = returnFunc();
// Now invoke the returned function.
fn(); // logs 'Hi' in the console

// Alternatively - A bit odd syntax but good to know
returnFunc()(); // logs 'Hi' in the console
```

Both of the examples above are examples of Higher-Order functions. The functions getCapture() and returnFunc() are Higher-Order functions. They either accept a function as an argument or return a function.

Please note, it is not mandatory for a Higher-Order function to perform both accepting an argument and returning a function. Performing either will make the function a Higher-Order function.

```javascript
const add = (a, b) => {
  return a + b;
};
const sub = (a, b) => {
  return a - b;
};
const mul = (a, b) => {
  return Math.abs(a * b);
};

//master calculator
const calculator = (num1, num2, operator) => {
  //accepting another function as an arguments :- Higher Order Function
  return operator(num1, num2);
};
console.log("add:", calculator(2, 3, add)); // passing function as an argument to another function :- callback function
console.log("sub:", calculator(2, 3, sub));
console.log("mul:", calculator(2, 3, mul));
// A callback function is a function that is passed to another function with the expectation that the other function will call it.

//   Higher-Order Functions(HoF): A function that takes another function(s) as an argument(s) and/or returns a function as a value.
// Callback Functions(CB): A function that is passed to another function.
```

```javascript
// A function
function fnc() {
  console.log("Just a simple javascript function");
}

// A function which is taking another function as an parameter
function higherOrderFunction(callback) {
  // Calling the function which is passed as the parameter, it is referred to as a callback
  callback();
}

// Passing a function
higherOrderFunction(fnc);
```

<br/>
<br/>
