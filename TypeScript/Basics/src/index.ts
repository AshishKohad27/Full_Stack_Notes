// Type Declaration
//1. let var and const with primitive data type
let a: number = 10;
let b: string = "ashish";
let c: boolean = true;
let d: null = null;
let e: undefined = undefined;

//2. Array: Number
const arrayNum2: Number[] = [1, 2, 3, 4, 5, 6, 7];
const arrayNum1: Array<Number> = [1, 2, 3, 4, 5, 6, 7];

//3. Array: String
const arrayString1: string[] = ["ASHISH", "KOHAD", "MASAI"];
const arrayString2: Array<string> = ["ASHISH", "KOHAD", "MASAI SCHOOL"];

//4. OR OPERATOR:- Union
let operator: number | string;
operator = 10;
operator = "ashish";

//5. OR operator on Array
let NumStr: Array<number | string> = [1, "Ashish", 2, "Kohad"];

//6. Tuple
let details: [string, number, number] = ["Math", 25, 25];
//we can put more than 2 it depends on declaration

//7. any
let info: any[] = [1, "Ashish", true];

//8. Function:Return Number,String,boolean
function NumberFunction(): number {
  return 12;
}
console.log(NumberFunction());

function StringFunction(): string {
  return "masai";
}
console.log(StringFunction());

function BooleanFunction(): boolean {
  return true;
}
console.log(BooleanFunction());

function AnyFunction(): any {
  return [1, "ash", true];
}
console.log(AnyFunction());

//9. Function with arguments return: any
function argumentsFunction(
  marks: number,
  subject: string,
  grade?: string //may or may be
): any {
  return subject;
  console.log("args:", subject, marks);
}
let response: any = argumentsFunction(7, "Math"); // return: any
console.log("response:", response);

//10. Union and any
let ssID: String | Number | Boolean;

ssID = 1;
ssID = "MASAI";
ssID = true;

let testData: any;

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