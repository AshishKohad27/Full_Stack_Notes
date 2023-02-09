"use strict";
//11. Interface
let obj = {
    firstName: "Ashish",
    lastName: "Kohad",
    userId: 123,
    status: true,
    mobile: 8668794792,
    //   age: 24,
    fullName: function () {
        return `${this.firstName} ${this.lastName} my age is ${this.age ? this.age : ""}`;
    },
};
console.log(obj.fullName());
function printData(params) {
    console.log(params);
}
let myObj = {
    size: 10,
    label: "size",
};
printData(myObj);
