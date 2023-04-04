//16. Void&Enum
// void :- when we don't want to return any thing from function on that time we use void

function hello(): void {
  console.log("hello without return");
}
console.log(hello());

//enum

enum VehicalType {
  Car = "Car",
  Truck = "Truck",
  Bus = 123,
  Bike,
}

let vehicleData: VehicalType = VehicalType.Car;
console.log("vehicleData:", vehicleData);

//for function
function getName(name: VehicalType): string  {
  return "name";
}

console.log(getName(2));
