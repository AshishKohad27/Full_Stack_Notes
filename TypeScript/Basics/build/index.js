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
//Tuple in typescript:- fixed size of array
const ha1 = [1, "Ashish"];
// const ha2: [number, string] = ["Ashish", 1]; //trow an error
// const ha3:[number,string]=[1,"Ashish","Kohad"] //throw an error because we increasing size of an array
const ha4 = [
    [0, "Ashish"],
    // [1,"Ashish","Kohad"],//throw an error
];
const ha5 = [
// only two row one is number and anther is string and part form that we type it thro us an error
//   [0, 1],
//   ["Ashish", "Kohad"],
];
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
//12. Inheritance
//13. Modifier and Statics
//14. Interface and Multiple Interface
//15. Duck_typing
//16. Void&Enum
//17. literal
//17.1
let vehicleLiteral; // we restrict to car and bike only
// vehicleLiteral = "truck";// it gives us error
//17.2
function getVehicleInfo(vehicleType) {
    return vehicleType;
}
console.log(getVehicleInfo("car"));
// console.log(getVehicleInfo("truck"));//error
//18. Array of array
let nestedArray = [
    [1, 2, "ash"],
    [1, "ash", 3],
    ["ash", 2, 3],
];
//19. Array of Object
let ArrayOfObject = [
    { id: 1, name: "Ashish", status: true, age: { value: 12 } },
    { id: 2, name: "Tarun", status: true },
    { id: 3, name: "Rahul", status: false },
];
let ObjectArray = {
    tasks: [1, 2, "ash"],
    posts: [{ id: 1, name: "Ashish", age: 24 }],
    comments: ["ash", "koh"],
};
//21. Record
let record = {
    //my key always be a string but my value is boolean
    loading: true,
    error: false,
    success: true,
};
const k1 = {
    // key always = string and value is number of array
    posts: [1, 2, 3],
    comments: [4, 5, 6],
};
