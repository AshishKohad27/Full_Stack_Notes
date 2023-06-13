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
/*
A callback is a plain JavaScript function passed to 
some method as an argument 
r option. It is a function that is to be executed after another function has 
finished executing, hence the name ‘call back‘. In JavaScript, functions are 
objects. Because of this, functions can take functions as arguments, and can 
be returned by other functions.*/

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
// ForEach
// it is similar like a for loop
arr.forEach((ele, index) => console.log(ele));

//map
// The map() method creates a new array populated with the results of calling a provided function on every element in the calling array.
let newMap = arr.map((ele, index) => ele * 2);
console.log("newMap:", newMap);

//filter
// filter array base on our condition and retrun array
let newFilter = arr.filter((ele, index) => ele % 2 === 0);
console.log("newFilter:", newFilter);

//reduce
// its return single integer
let reduceResult = arr.reduce((acc, ele) => acc + ele, 0);
console.log("reduceResult:", reduceResult);

//arr == obj
let arr1 = [];
let obj1 = {};
let double = arr1 == obj1; //False
let triple = arr1 === obj1; // False
let typeDouble = typeof arr == typeof obj1; //  True
let typeTriple = typeof arr === typeof obj1; // True

console.log("arr === obj", double);
console.log("arr === obj", triple);
console.log("typeOf:", typeDouble);
console.log("typeOf:", typeTriple);



