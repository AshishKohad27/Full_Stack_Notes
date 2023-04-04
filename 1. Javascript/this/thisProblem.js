//1. Default Binding
//    1. function standAlone-->refer to global object
//    2. function with "use strict"-->refer to this

//2. implicit binding or Object method--->refer to global object
function detailsUsers() {
    console.log("Implicit:", this.age);
}

const objUsers = {
    name: "Ashish",
    age: 24,
    detailsUsers: detailsUsers,
}
objUsers.detailsUsers();


//3. Explicit binding
function NewCar(brand) {
    this.name = brand
    console.log("NewCar", this);
}

NewCar.call(this, "Tesla")
NewCar.apply(this, ["Honda"])
let myBind = new NewCar("Suzuki")
console.log('myBind:', myBind)

//4. constructor
function construct(age) {
    this.age = age;
}

let newFunction = new construct(22);
console.log("Constructor binding", newFunction.age);