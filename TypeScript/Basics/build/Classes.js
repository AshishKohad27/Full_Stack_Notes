"use strict";
class Bike {
    constructor(name, noPlate) {
        this.brand = "Suzuki";
        this.color = "White";
        this.name = name;
        this.noPlate = noPlate;
        this.fuel = "-";
        this.price = NaN;
    }
    getColor(param, fuel) {
        this.fuel = fuel;
        return `Your Bike Color is ${param} and your number plate ${this.noPlate}`;
    }
    getPrice(price) {
        this.price = price;
    }
}
let bikeObj = new Bike("Ashish", "MH-1234");
console.log(bikeObj.getColor("Blue", "petrol"));
bikeObj.getPrice(200000);
console.log("bikeObj:", bikeObj);
