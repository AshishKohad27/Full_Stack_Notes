const person = {
    name: "ashish",
    greet: function (greeting) {
        // console.log('greeting:', greeting)
        console.log(greeting + " " + this.name);
    }
}
const anotherPerson = {
    name: "rahul"
}

//call
person.greet.call(anotherPerson, "Hello From Call");

//apply
person.greet.apply(anotherPerson, ["Hello From Apply", "!"]);

//bind 
const greetToRahul = person.greet.bind(anotherPerson, "Hello From Bind")
greetToRahul()


const obj1 = { a: 1, b: 2 };
const obj2 = { c: 3, d: 4 };
const combinedObj = { ...obj1, ...obj2 }; 
console.log('combinedObj:', combinedObj)