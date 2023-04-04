//11. Interface

interface Info {
  firstName: String;
  lastName: String;
  userId: Number;
  status: Boolean;
  mobile: Number;
  age?: Number;
  fullName: () => String;
}

let obj: Info = {
  firstName: "Ashish",
  lastName: "Kohad",
  userId: 123,
  status: true,
  mobile: 8668794792,
  //   age: 24,
  fullName: function () {
    return `${this.firstName} ${this.lastName} my age is ${
      this.age ? this.age : ""
    }`;
  },
};

console.log(obj.fullName());

//2.

interface customObj {
  size: number;
  label: string;
  extra?: number | string;
}
function printData(params: customObj) {
  console.log(params);
}

let myObj = {
  size: 10,
  label: "size",
};
printData(myObj);
