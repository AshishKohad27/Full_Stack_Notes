## What is this?

src:- https://www.freecodecamp.org/news/what-is-this-in-javascript/

1. Default Binding in JavaScript

- standalone function, then that function is bound to the global object.

```javascript
function alert() {
  console.log(this.name + " is calling");
}

const name = "Kingsley";
alert(); // Kingsley is calling
```

2. In a function, in strict mode, this is undefined.

```javascript
function alert() {
  "use strict";
  console.log(this.name + " is calling");
}

const name = "Kingsley";
alert(); // TypeError: `this` is `undefined`
```

3. Implicit Binding in JavaScript

- the function is attached to an object (its context) at the call site.

```javascript
// when you call a function using dot notation, this is implicitly bound to the object the function is being called from.

function alert() {
  console.log(this.age + " years old");
}

const myObj = {
  age: 22,
  alert: alert,
  nestedObj: {
    age: 26,
    alert: alert,
  },
};

myObj.alert(); // `this` is bound to `myObj` -- 22 years old
myObj.nestedObj.alert(); // `this` is bound to `nestedObj` -- 26 years old
```

4.  Explicit binding in JavaScript

- Methods like call(), apply(), and bind() can refer this to any object.
- But what if we want to force a function to use an object as its context without putting a property function reference on the object?
- We have two utility methods to achieve this: call() and apply().

```javascript
function alert() {
  console.log(this.age + " years old");
}

const myObj = {
  age: 22,
};

alert.call(myObj); // 22 years old
```

5. Constructor Call Binding in JavaScript

```javascript
function giveAge(age) {
  this.age = age;
}

const bar = new giveAge(22);
console.log(bar.age); // 22
```

By calling giveAge(...) with new in front of it, we’ve constructed a new object and set that new object as the this for the call of foo(...). So new is the final way that you can bind a function call’s this .

-In JavaScript, the this keyword refers to an object.

Which object depends on how this is being invoked (used or called).

The this keyword refers to different objects depending on how it is used:

- In an object method, this refers to the object.

```javascript

```

- Alone, this refers to the global object.
- In a function, this refers to the global object.
- In a function, in strict mode, this is undefined.
- In an event, this refers to the element that received the event.
- Methods like call(), apply(), and bind() can refer this to any object.

- JavaScript Function Methods

```javascript
Method	 Description
//apply()	  // It is used to call a function contains this value and a single array of arguments.

//bind()	  // It is used to create a new function.

//call()	  // It is used to call a function contains this value and an argument list.

//toString() //It returns the result in a form of a string.

function NewCar(brand) {
    this.name = brand
    console.log("NewCar", this);
}

NewCar.call(this, "Tesla")
NewCar.apply(this, ["Honda"])
let myBind = new NewCar("Suzuki")
console.log('myBind:', myBind)
```

src: - [label](CallBlindApply.js)
