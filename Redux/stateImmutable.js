//why state is immutable

//Re rendering of react components
let oldObj = {
    "name": "Ashish",
    "age": 24,
    "profession": {
        "title": "Frontend",
        "org": "Zomato",
    }
}

let newObj = oldObj;

newObj.profession.title = "Backend";

console.log(oldObj.profession === newObj.profession);//true even :- because both ref tpo same memory
console.log(oldObj === newObj);

//now we are creating new object
let newNewObj = { ...oldObj };
newNewObj.profession.title = "Backend and frontend";
console.log("creating new obj instead of updating old object", newNewObj === oldObj);
// Immutability of redux state is necessary since it 
// allows detecting redux state changes in an efficient
//  manner. This implies that whenever we want to modify
//   a redux state, we must create a new copy of it 
//   and do modifications to that copy - which then 
//   becomes the new redux state.

console.log("old:", oldObj.profession.title);
console.log("newObject with same ref:", newObj.profession.title);
console.log("newObject with diff ref:", newNewObj.profession.title);