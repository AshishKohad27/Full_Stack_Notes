src:- https://www.scaler.com/topics/nodejs/iifes/

# What is an IIFE?

- Considering we want to build our own javascript library like jQuery. Then, there is a high chance that the variables or functions with the same name came into existence on a global scope as a lot of people will use our library.

- Hence, we use IIFE in JavaScript which helps us to avoid duplicate variables and functions in the global scope as IIFE keeps these variables and functions private in its own scope.

- IIFE, Immediately Invoked Function Expression, is called immediately as soon as the function is defined. We do not need to call the function specifically with its name. We use IIFE to avoid overwriting variables and functions in the global scope and keep their scope to IIFE in Javascript.

```javascript
//1. Syntax
(function () {
  // write your code Here
})();

//2. Syntax
!(function callMe() {
  console.log("Ahh! I am a IIFE now");
})();
```

## Explanation of The Syntax:

1. Round brackets () are used to define IIFE in Javascript.
2. The function within closed brackets is an anonymous function i.e. function didn't have any name.
3. Another pair of round brackets () is used to call the function immediately just like we call the named function after declaration.

```javascript
//1. Example:-1
// normal function
function callMe() {
  console.log("Hey! you just called me");
}

callMe()(
  // IIFE: Immediately Invoked Function Expressions
  function () {
    //write your code here
  }
)();

// Note: If you run the above code, it will cause an Uncaught TypeError: callMe(...) is not a function. And it concatenates the callMe function with IIFE next to it.
// The Solution:
// The above code will result in syntax errors during execution. Hence, we use semicolons to avoid unnecessary concatenation with the previous/next line of javascript code.

// normal function
function callMe() {
  console.log("Hey! you just called me");
}

callMe();
// IIFE: Immediately Invoked Function Expressions
(function () {
  //write your code here
})();
```

## Why Use Immediately Invoked Functions Expressions?

Consider there are three files named file1.js, file2.js, and file3.js

```javascript
//file1.js
var name = "IIFE";
console.log(name);
//file2.js
var name = "IIFEs";
console.log(name);
// file3.js
var name = "IIFE in Javascript";
console.log(name);
```

In the above code, if we include all these javascript files in the same code. The variable will be overwritten as they exists in same scope (global). Let's fix this problem.

```javascript
//file1.js
var file1 = (function () {
  var name = "IIFE";
  console.log(name);
})();
//file2.js
var file2 = (function () {
  var name = "IIFEs";
  console.log(name);
})();
//file3.js
var file3 = (function () {
  var name = "IIFE in Javascript";
  console.log(name);
})();
```

In the above code block, we converted normal functions into IIFE and assigned a return value to a variable as it creates its local scope and prevents overriding the variable name.

Conclusion
IIFE in Javascript is a function expression that is invoked immediately.
Square brackets are used to define IIFE.
Function within the square brackets could be named or anonymous.
It doesn't work for function statements/declarations.
We can access any objects/variables from the global scope by passing them as arguments.

## When to Use an IIFE?
src:- https://stackabuse.com/javascripts-immediately-invoked-function-expressions/
  
The most common use cases for IIFEs are:

1. Aliasing global variables
2. Creating private variables and functions

We can use IIFEs to create private variables and functions within the global scope, or any other function scope.

Functions and variables added to the global scope are available to all scripts that are loaded on a page. Let's say we had a function generateMagicNumber(), which returned a random number between 900 and 1000 inclusive, and a variable favoriteNumber in our JavaScript file.

We can write them like this:

```javascript
function generateMagicNumber() {
  return Math.floor(Math.random() * 100) + 900;
}

console.log("This is your magic number: " + generateMagicNumber());

var favoriteNumber = 5;
console.log("Twice your favorite number is " + favoriteNumber * 2);
```

If we load other JavaScript files in our browser, they also gain access to generateMagicNumber() and favoriteNumber. To prevent them from using or editing them, we encase our code in an IIFE:

```javascript
(function () {
  function generateMagicNumber() {
    return Math.floor(Math.random() * 100) + 900;
  }

  console.log("This is your magic number: " + generateMagicNumber());

  var favoriteNumber = 5;
  console.log("Twice your favorite number is " + favoriteNumber * 2);
})();
```

It runs the same, but now generateMagicNumber() and favoriteNumber are only accessible in our script. 
3. Asynchronous functions in loops

```javascript
//Example
//JavaScript's behavior surprises many when callbacks are executed in loops. For example, let's count from 1 to 5 in JavaScript, putting a 1 second gap between every time we log a message. A naïve implementation would be:
for (var i = 1; i <= 5; i++) {
  setTimeout(function () {
    console.log("I reached step " + i);
  }, 1000 * i);
}

// While the output would be printed 1 second after the other, each line prints that they reached step 6. Why?

// When JavaScript encounters asynchronous code, it defers execution of the callback until the asynchronous task completes. That's how it remains non-blocking. In this example, the console.log() statement will run only after the timeout has elapsed.

// JavaScript also created a closure for our callback. Closures are a combination of a function and its scope when it was created. With closures, our callback can access the variable i even though the for loop has already finished executing.

// However, our callback only has access to the value of i at the time of its execution. As the code within the setTimeout() function were all deferred, the for loop was finished with i being equal to 6. That's why they all log that they reached step 6

for (var j = 1; j <= 5; j++) {
  (function (step) {
    setTimeout(() => {
      console.log("I reached step j " + step);
    }, 1000 * j);
  })(j);
}
// By using an IIFE, we create a new scope for our callback function. Our IIFE takes a parameter step. Every time our IIFE is called, we give it the current value of i as its argument. Now, when the callback is ready to be executed, its closure will have the correct value of step.
```
