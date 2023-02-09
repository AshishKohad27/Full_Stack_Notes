function Car(type, fuelType) {
    this.type = type;
    this.fuelType = fuelType;
}

function setBrand(brand) {
    Car.call(this, "convertible", "petrol");
    this.brand = brand;
    console.log(`Car details = `, this);
}

function definePrice(price) {
    Car.call(this, "convertible", "diesel");
    this.price = price;
    console.log(`Car details = `, this);
}

// const newBrand = new setBrand('Brand1');
// const newCarPrice = new definePrice(100000);

function NewCar(brand) {
    this.name = brand
    console.log("NewCar", this);
}

NewCar.call(this, "Tesla")
NewCar.apply(this, ["Honda"])
let myBind = new NewCar("Suzuki")
console.log('myBind:', myBind)

// const myCar = new NewCar("Tesla");


