class Bike {
  brand: string = "Suzuki";
  color: string;
  name: string;
  noPlate: string;
  fuel: string;
  price: number;

  constructor(name: string, noPlate: string) {
    this.color = "White";
    this.name = name;
    this.noPlate = noPlate;
    this.fuel = "-";
    this.price = NaN;
  }

  getColor(param: string, fuel: string) {
    this.fuel = fuel;
    return `Your Bike Color is ${param} and your number plate ${this.noPlate}`;
  }

  getPrice(price: number) {
    this.price = price;
  }
}

let bikeObj = new Bike("Ashish", "MH-1234");
console.log(bikeObj.getColor("Blue", "petrol"));
bikeObj.getPrice(200000);
console.log("bikeObj:", bikeObj);
