"use strict";
//12. Inheritance
class Vehicle {
    constructor(storeNumber) {
        //Modifier
        //1. Public
        //2. Private
        //3. Protected
        //   public storeNo: number = 92222; //default //1. Public
        this.storeNo = 92222; //default //1. Protected
        this.gst = 1000001; //default //1. Private
        this.storeNo = storeNumber;
    }
    VehicleCategory() {
        return `Three type of vehicle Car`;
    }
    getCount() {
        return `Total 100 Vehicle` + this.gst;
    }
}
class Car extends Vehicle {
    constructor(brandName, storeId) {
        super(storeId);
        this.brand = brandName;
    }
    getCount() {
        return `Total 50 cars ` + this.brand + " " + this.storeNo;
    }
    getInfoCount() {
        return super.getCount() + "====" + this.getCount();
    }
}
let vehicleObj = new Car("Maruti", 12345);
console.log(vehicleObj.getCount());
console.log(vehicleObj.getInfoCount());
//1. Public
// console.log("1. Public", vehicleObj.storeNo);//getting
//2.Protected and private
// console.log("1. Public", vehicleObj.storeNo);//not getting here
