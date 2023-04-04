
# Closure in JavaScript

src:- https://www.scaler.com/topics/javascript/javascript-closures/

## What are Scopes?

Scopes in Javascript are the portion of the code where the variable is accessible. Let us walk through some examples:

```javascript
const name = "Aryan";
console.log(name); // Aryan
if (true) {
  let superhero = "Might Raju"; // same for const as well
  console.log(superhero);
}
console.log(superhero); // throws  ReferenceError
```

In Javascript we have different types of scopes, some of them are:

1. Global Scope:
   As the name suggests, the variable which is accessible from everywhere in the program is said to exist in the global scope.
   Ex:

```javascript
let name = "Aryan";
const mainFunction = () => {
  console.log(name);
};

mainFunction(); // Aryan
console.log(name); // Aryan
```

- Here the variable name is accessible inside the main Function as well outside it. The name can be accessed from anywhere in the code. So the name exists in the global scope. 2. Global Scope 3. Functional Scope.

2. Function Scope or Local Scope:
   When a variable is declared inside the function, it can only be accessed from within that function. This means that this variable exists in the functional scope and cannot be used outside this scope.
   Ex:

```javascript
const main = () => {
  const newName = "Aryan"; // newName defined in function scope
  console.log(newName);
};
main();
// trying to access newName outside the function
console.log(newName); // ReferenceError
```

3. Block Scope

- With the introduction of let and const keywords, variables can be scoped to the nearest block of code or pair of curly braces "{}". Just for the information, var is not block scoped.

```javascript
{
  let name1 = "Aryan"; // name1 in block scope
  console.log(name1); // Aryan
}

{
  var newName = "Kaush"; // newName not in block scope as var is used
  console.log(newName); // Kaush
}

console.log(name1); // ReferenceError
console.log(newName); // Kaush
```

4. Lexical Scopes:
   In the example, we saw that the variable of outer scope is easily accessible to the inner scope. This is possible because of lexical scoping. In the above example, the lexical scope of newFunction consists of the lexical scope of demoFunction and global scope. In easy terms, lexical scoping means that inside an inner scope you can use the variable of outer scope. It is called lexical scope as the engine detemines the scopes during the lexing time.

```javascript
function demoFunction() {
  let name = "aryan";
  function newFunction() {
    console.log(name); // logs aryan as name is available to newFucntion
    // because of nesting of scopes.
  }

  newFunction();
}
demoFunction();
// Here, name is accessible to the newFunction and when newFunction is called, it logs the name.
```

## Closures

- A closure is the combination of a function bundled together (enclosed) with references to its surrounding state (the lexical environment). As we know what lexical scoping is, this definition is explanatory.
  ![Alt text](Images/uses-of-closure.webp)

```javascript
function outerFunction(number) {
  let initial = 1;

  function innerFunction(newNumber) {
    initial = initial * newNumber + number;
    return initial;
  }
  return innerFunction;
}

let returnedFunction = outerFunction(2); // returnedFunction here is same as innerFunction.
console.log(returnedFunction(1)); // 3
console.log(returnedFunction(3)); // 11
```

- Here, we have an outerFunction, which has an innerFunction. This innerFunction is manipulating the initial which is defined in its outer scope. Now when we call outerFunction, it returns innerFunction and when we try to call innerFunction, we see that it still has access to an initial, though the function is called outside the scope of outerFunction. This is possible because of closures. Because of closures, functions in Javascript can close over the value of their outer scope and remember them. So no matter from which scope they are called, they can easily access the variables in their outer scope. So a sweet, simple, and intuitive definition of closure can be:

## "A closure is a function that remembers its outer variables and can access them even when called independently."

  <br/>
  <br/>
  <br/>

## Currying:

- Currying is the pattern of functions that immediately evaluate and return other functions.
- This is made possible by the fact that Javascript functions are expressions that can return other functions.
- Curried functions are constructed by chaining closures by defining and immediately returning their inner functions simultaneously. It is a very powerful technique and is frequently asked.

```javascript
Example: function sum(a) {
  return function (b) {
    return function (c) {
      return a + b + c;
    };
  };
}

let ans = sum(4)(5)(8);
console.log(ans); // 17
```

## Summary

1. Closures in Javascript is something that is used by everyone but still, most of the developers are not familiar with it and it is completely fine. Closures are hard to get your head around and you will become better and better with time. So to wrap this article, let us go through the important points we discussed in this article:

2. A closure in JavaScript is a feature where an inner function has access to the outer (enclosing) function’s variables — a scope chain.

3. Closures in Javascript are created along with the function.

4. Lexical scoping is the environment that holds the variables of the current scope as well as the outer scope.

5. As each scope in Javascript has access to its parent's scope or outer environment, we can nest these scopes in hierarchical order called scope chaining.

6. Each closure has three scopes namely global scope, function scope or local scope, and block scope.

7. In languages using static scopes, variables are referenced at the time of creating whereas, in dynamic scoping, variables are referenced at run time.

8. With the help of closures, we can solve the for loop dilemma in Javascript.

9. Closures in Javascript find their uses every time a function is created. Some common use cases are Higher Order Functions, Currying, and Function decomposition.

<br/>
<br/>
<br/>

