//12. Inheritance

class Vehicle {
  //Modifier
  //1. Public
  //2. Private
  //3. Protected
  //   public storeNo: number = 92222; //default //1. Public
  protected storeNo: number = 92222; //default //1. Protected
  private gst: number = 1000001; //default //1. Private

  constructor(storeNumber: number) {
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
  //2.Privates
  // gst not getting here
  //3.Protected
  //getting here

  brand: string;
  constructor(brandName: string, storeId: number) {
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
