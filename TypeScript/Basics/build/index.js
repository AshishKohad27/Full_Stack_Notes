"use strict";
// Type Declaration
//1. let var and const with primitive data type
let a = 10;
let b = "ashish";
let c = true;
let d = null;
let e = undefined;
//2. Array: Number
const arrayNum2 = [1, 2, 3, 4, 5, 6, 7];
const arrayNum1 = [1, 2, 3, 4, 5, 6, 7];
//3. Array: String
const arrayString1 = ["ASHISH", "KOHAD", "MASAI"];
const arrayString2 = ["ASHISH", "KOHAD", "MASAI SCHOOL"];
//4. OR OPERATOR:- Union
let operator;
operator = 10;
operator = "ashish";
//5. OR operator on Array
let NumStr = [1, "Ashish", 2, "Kohad"];
//6. Tuple
let details = ["Math", 25, 25];
//we can put more than 2 it depends on declaration
//7. any
let info = [1, "Ashish", true];
//8. Function:Return Number,String,boolean
function NumberFunction() {
    return 12;
}
console.log(NumberFunction());
function StringFunction() {
    return "masai";
}
console.log(StringFunction());
function BooleanFunction() {
    return true;
}
console.log(BooleanFunction());
function AnyFunction() {
    return [1, "ash", true];
}
console.log(AnyFunction());
//9. Function with arguments return: any
function argumentsFunction(marks, subject, grade //may or may be
) {
    return subject;
    console.log("args:", subject, marks);
}
let response = argumentsFunction(7, "Math"); // return: any
console.log("response:", response);
//10. Union and any
let ssID;
ssID = 1;
ssID = "MASAI";
ssID = true;
let testData;
testData = 1;
testData = "testData";
testData = true;
testData = [1, 2, 3, 4];
testData = [1, "ash", true];
testData = { id: 1 };
//11. Interface
