function Car(name, fuelType) {
    this.name = name;
    this.fuelType = fuelType;
    console.log(this);
}

function definedPrice(price) {
    this.price = price;
    Car.call(this, "tesla", "petrol");
    Car.apply(this, ["suzuki", "petrol"]);
}

let newPrice = new definedPrice(90000);
let newPrice2 = new definedPrice(200);


//2
let user1 = {
    name: "Ashish Kohad",
    age: 24,
    designation: "SDE",
}
let user2 = {
    name: "Rahul",
    age: 26,
    designation: "SDE",
}

let printDetails = function (state, country) {
    console.log(this.name + " " + state + " " + country);
}
//Call
printDetails.call(user1);
printDetails.call(user2, "Maharashtra", "Country");

//Apply
printDetails.apply(user2, ["Maharashtra", "Country"]);

//Blind

//3 blind


