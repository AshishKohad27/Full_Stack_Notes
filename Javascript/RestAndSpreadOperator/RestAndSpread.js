// Rest 
function Rest(a, b, c, ...others) {
    // what ever data we pass it get combine
    //we can split rest argument and perform diff. operation to them
    console.log('others:', others);
    return a + b + c;
}
const result = Rest(1, 2, 3, 9, 8, 7, 6, 5, 4)
console.log('Rest:', result);

//Spread
let names = ["ashish", "ram", "suraj", "rahul"];
function Spread(n1, n2, n3) {
    // we can split data
    return n1 + " " + n2 + " " + n3

}
const res = Spread(...names);// passing three dots over here
console.log('Spread:', res)

//Objects

let students = {
    name: "Ashish",
    "age": 24,
    "hobbies": ["drawing", "reading"]
}

const { age, ...rest } = students;
console.log('rest:', rest)// rest of age we get all details with rest operator
console.log('age:', age)

//spread operator
let newStudents = {
    ...students,
    age: 30,
    working:"SDE"
}
console.log('newStudents:', newStudents);