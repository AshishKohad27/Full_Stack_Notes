//13. Modifier and Statics

class Employee {
  empName: string;
  readonly empCode: number;
  static pi: number = 3.14;
  constructor(name: string, code: number) {
    this.empName = name;
    this.empCode = code;
  }

  static getName() {
    return "get Name from static";
  }
}

let EmpObj = new Employee("Ashish", 1234);
EmpObj.empName = "Rahul";
// EmpObj.empCode = 1324; // read only property so we can update value
console.log(EmpObj);

//statics
//1.
// console.log(EmpObj.pi); // get error for that we have to do below;
console.log(Employee.pi); // get error for that we have to do below;
//2.
console.log(Employee.getName());
