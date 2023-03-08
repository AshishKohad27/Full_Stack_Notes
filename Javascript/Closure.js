function outerFunction(number) {
    let initial = 1;

    function innerFunction(newNumber) {
        initial = initial * newNumber + number;
        return initial;// because of closure initial value stored in lexical scope
    }
    return innerFunction;
}

let returnedFunction = outerFunction(2); // returnedFunction here is same as innerFunction.
// console.log(returnedFunction(1)); // 3
// console.log(returnedFunction(3)); // 11
/*
//step 1 : calling inner function
console.log(function innerFunction(newNumber) {
    initial = initial * newNumber + number;
    return initial;
});
//step 2 : return initial
console.log(initial);
*/

console.log("Example 1 : Currying ");
// examples
function Sum(x) {
    return function sumB(y) {
        return function sumC(z) {
            return x + y + z;
        };
    };
}
let result = Sum(5)(10)(2);
// console.log("result:", result);

const arrow1 = (x) => (y) => (z) => console.log(x + y + z);
// arrow1(5)(10)(2)

// toggler : closure
function toggler(...arg) {
    // console.log(arg);
    let index = 0;
    return function inner() {
        if (index === arg.length) {
            index = 0;
        }
        return arg[index++];
    }
}
const tog = toggler(1, 2, 3, 4, "on", "off");
// console.log("1:", tog());
// console.log("2:", tog());
// console.log("3:", tog());
// console.log("4:", tog());
// console.log("5:", tog());
// console.log("6:", tog());
// console.log("7:", tog());
// console.log("8:", tog());

//Toggler oN off
function togglerSwitch(...arg) {
    console.log(arg)
    let index = 0;
    return function Inner() {
        if (index === arg.length) {
            index = 0;
        }
        return arg[index++];
    }
}
const ash = togglerSwitch("On", "Off");
console.log(ash());
console.log(ash());
console.log(ash());
console.log(ash());
console.log(ash());
console.log(ash());


//Getter and setter
// Emulating private methods with closures:
// private variables are the variables which are visible only to the 
// class to which they belong and cannot be accessed/modified directly from outside. 

function Friend(name, job) {
    let _name = name; // for private name

    return {
        //Getter Method
        getName() {
            return _name;
        },
        //Setter Method
        setName(newName) {
            _name = newName;
        }
    }
}

const aryan = Friend("Aryan")
console.log(aryan.getName()) // Aryan
console.log(aryan._name) // undefined
aryan.setName("Kaush")
console.log(aryan.getName()) // Kaush

// Javascript Closures in a Loop:
for (var i = 0; i < 5; i++) {
    setTimeout(function () {
        console.log(i);
    }, 1000);
}
//    expected:- 0,1,2,3,4
//    real:- 5,5,5,5,5

// Using IIFE AND CLOSURES
// In the above code, we just wrapped the setTimeout function inside an IIFE, 
// so now for each callback function (function inside the setTimeout) the value 
// of i will not be the value of the iterator but the value of i in the outer 
// function. Since this function is called for each value of i it will log all 
// the value of i as desired.
for (var i = 0; i < 5; i++) {
    (function (i) {
        setTimeout(function () {
            console.log(i);
        }, 1000);
    })(i)
}

// Using let keyword in ES6:
// let creates a new lexical scope in each iteration which means that we will 
// have a new i in each iteration.The reason, as we discussed above is let is block scoped.
for (let i = 0; i < 5; i++) {
    setTimeout(function () {
        console.log(i);
    }, 1000);
}

// Higher Order Functions:
//Higher Order Function
function Outer(X) {
    return function Inner(Y) {
        return X * Y
    }
}
let multiplyBy2 = Outer(2);
console.log('multiplyBy2:', multiplyBy2(6))
let multiplyBy3 = Outer(3);
console.log('multiplyBy3:', multiplyBy3(6))
// console.log(multiplyBy2(5))



/**
 * Scopes 
 *    1. Global Scope
 *    2. Block Scope
 *    3. Local or Function Scope
 *    4. Lexical Scope
 * 
 * Examples of Closure
 * 1. Currying
 * 2. For Loop De-lima
 * 3. Private Variables
 * 4. Higher Order function 
 * 5. Toggle Function
*/
