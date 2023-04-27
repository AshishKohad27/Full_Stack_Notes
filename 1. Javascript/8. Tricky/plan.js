console.log(typeof undefined); // undefined
console.log(typeof null); // object

console.log("2" + 2 - "1") // 21
var x = 1;
if (function f() { }) {
    x += typeof f;
}
console.log(x); // 1Undefined

console.log(1 + "2" + "2"); //  122
console.log(+"1" + "1" + "2"); // 112
console.log("A" - "B" + "2");// string added with NaN->Nan
console.log("A" - "B" + 2);// Number added with NaN->Nan


var b = 1;
function outer() {
    var b = 2
    function inner() {
        b++;
        var b = 3;
        console.log("B:", b) // 3
    }
    inner();
}
outer();

var a = [1, 2, 3];
a[10] = 4; // 10index
console.log(a); // [ 1, 2, 3, <7 empty items>, 4 ]
console.log(a.length) // 11


console.log(typeof typeof "1");// typeof 1-> number and typeof number-> is string

console.log("2" * "3"); // 6
console.log("12" / "6"); // 2
console.log("number" - 15); // NaN
console.log("foo" + + "bar"); //FooNaN
console.log('true' == true); // false
console.log(false == "false"); // false


var x = [typeof x, typeof y][1];
console.log(typeof typeof x); // string





let user = {
    "name": "Alex",
    address: "15thPark avenu",
    age: 43,
    department: {
        "name": "Sales",
        "shift": "Morning",
        address: {
            city: "Bangalore",
            "street": "7th Residency",
            zip: 560001
        }
    }
}
console.log("department:", user.department);
console.log("zip:", user.department.address.zip);
console.log("city:", user.department.address.city)