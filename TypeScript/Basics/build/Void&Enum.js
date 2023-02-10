"use strict";
//16. Void&Enum
// void :- when we don't want to return any thing from function on that time we use void
function hello() {
    console.log("hello without return");
}
console.log(hello());
//enum
var VehicalType;
(function (VehicalType) {
    VehicalType["Car"] = "Car";
    VehicalType["Truck"] = "Truck";
    VehicalType[VehicalType["Bus"] = 123] = "Bus";
    VehicalType[VehicalType["Bike"] = 124] = "Bike";
})(VehicalType || (VehicalType = {}));
let vehicleData = VehicalType.Car;
console.log("vehicleData:", vehicleData);
//for function
function getName(name) {
    return "name";
}
console.log(getName(2));
