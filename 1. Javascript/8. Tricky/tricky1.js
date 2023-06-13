function sayHi() {
    console.log(name); // undefined
    console.log(age); // refrrenceError
    var name = 'Lydia';
    let age = 21;
}

// sayHi();

(function () {
    console.log(+true);
    console.log(!'Ashish');
})()

let greeting;
greetign = {}; // Typo!
console.log(greetign);

function bark() {
    console.log('Woof!');
  }
  
  bark.animal = 'dog';

  function Person(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
  
  const member = new Person('Lydia', 'Hallie');
  Person.prototype.getFullName = function() {
    return `${this.firstName} ${this.lastName}`;
  };
  
  console.log(member.getFullName());

  function by(propName) {
    return function(a, b) {
        console.log(a,b)
        return a[propName] - b[propName];
    }
  }
  
  const person1 = {name: 'aryan', height: 178};
  const person2 = {name: 'kaush', height: 182};
  const person3 = {name: 'abhishek', height: 176};
  
  const arr_ = [person1, person2, person3];
  
  const arr_sorted = arr_.sort(by('height')); 
  console.log(arr_sorted) // sorted array acc. to height will be printed 
  


  function outer() {
    let b = 10;
    let c = 100;
       function inner() {
            
             let a = 20; 
             console.log("a= " + a + " b= " + b);
             a++;
             b++;
        }
       return inner;
    }
  
  const X = outer()
  const Y = outer()
  X() // a=20 b=10
  X() // a=20 b=11
  X() // a=20 b=12
  Y() // a=20 b=10

  