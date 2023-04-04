"use strict";
//13. Modifier and Statics
class Employee {
    constructor(name, code) {
        this.empName = name;
        this.empCode = code;
    }
    static getName() {
        return "get Name from static";
    }
}
Employee.pi = 3.14;
let EmpObj = new Employee("Ashish", 1234);
EmpObj.empName = "Rahul";
// EmpObj.empCode = 1324; // read only property so we can update value
console.log(EmpObj);
//statics
//1.
// console.log(EmpObj.pi); // get error for that we have to do below;
console.log(Employee.pi); // get error for that we have to do below;
//2.
console.log(Employee.getName());
