interface Sport {
  newCategory: string;
  getReport: () => string;
  getReport2: () => string;
}

interface Economics {
  getReport3: () => string;
}

//Method1:- Multiple
interface NewNews extends Sport, Economics {}

//Method2:- Multiple
// class News implements Sport, Economics {

//Method1:- Multiple
class News implements NewNews {
  newCategory: string;

  constructor(category: string) {
    this.newCategory = category;
  }

  getReport() {
    return "Report called";
  }

  getReport2() {
    return "Report2 called";
  }

  getReport3() {
    return "Report2 called";
  }
}

let newObj: NewNews = new News("Sports");

console.log(newObj.getReport());
console.log(newObj.getReport2());
