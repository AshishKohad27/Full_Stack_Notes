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
//Tuple in typescript:- fixed size of array
const ha1: [number, string] = [1, "Ashish"];
// const ha2: [number, string] = ["Ashish", 1]; //trow an error
// const ha3:[number,string]=[1,"Ashish","Kohad"] //throw an error because we increasing size of an array
const ha4: Array<[number, string]> = [
  [0, "Ashish"],
  // [1,"Ashish","Kohad"],//throw an error
];
const ha5: Array<[number[], string[]]> = [
  // only two row one is number and anther is string and part form that we type it thro us an error
  //   [0, 1],
  //   ["Ashish", "Kohad"],
];

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
//16. Void&Enum
//17. literal
//17.1
let vehicleLiteral: "Car" | "Bike"; // we restrict to car and bike only
// vehicleLiteral = "truck";// it gives us error

//17.2
function getVehicleInfo(vehicleType: "car" | "bike") {
  return vehicleType;
}
console.log(getVehicleInfo("car"));
// console.log(getVehicleInfo("truck"));//error

//18. Array of array
let nestedArray: Array<Array<number | string>> = [
  [1, 2, "ash"],
  [1, "ash", 3],
  ["ash", 2, 3],
];

//19. Array of Object
let ArrayOfObject: Array<{
  id: number;
  name: string;
  status: boolean;
  age?: {
    value: number;
  };
}> = [
  { id: 1, name: "Ashish", status: true, age: { value: 12 } },
  { id: 2, name: "Tarun", status: true },
  { id: 3, name: "Rahul", status: false },
];

//20. Object of Array
interface InterObj {
  tasks: Array<number | string>;
  posts: [
    {
      id: number;
      name: string;
      age?: number;
    }
  ];
  comments: string[];
}
let ObjectArray: InterObj = {
  tasks: [1, 2, "ash"],
  posts: [{ id: 1, name: "Ashish", age: 24 }],
  comments: ["ash", "koh"],
};

//21. Record
let record: Record<string, Boolean> = {
  //my key always be a string but my value is boolean
  loading: true,
  error: false,
  success: true,
};

const k1: Record<string, number[]> = {
  // key always = string and value is number of array
  posts: [1, 2, 3],
  comments: [4, 5, 6],
};

//22.Array of Specific String
const Country: Array<"INDIA" | "CHINA" | "RUSSIA"> = [
  "INDIA",
  "CHINA",
  "RUSSIA",
  //   "India",
  //   "Japan",
  //   "China",
];
//Case sensitive so that it give only desire result to us rest will be high-lighted

//22.1 using interface
type Country = "INDIA" | "CHINA" | "RUSSIA";
const CountryInterface: Array<Country> = ["INDIA", "CHINA", "RUSSIA"];

//23.//type nesting
type GENDER = "Male" | "Female" | "Other";
type USER = {
  id: number;
  name: String;
  age: Number;
  gender: GENDER; // SPECIFIC STRING
};

let typeArray: Array<USER> = [
  { id: 1, name: "Ashish", age: 24, gender: "Male" },
  { id: 2, name: "Ashish", age: 24, gender: "Female" },
  //{ id:3 ,name: "Name 3", age: 24, gender: "oTHER" }, // THROW ERROR
];
