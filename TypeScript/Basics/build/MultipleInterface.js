"use strict";
//Method2:- Multiple
// class News implements Sport, Economics {
//Method1:- Multiple
class News {
    constructor(category) {
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
let newObj = new News("Sports");
console.log(newObj.getReport());
console.log(newObj.getReport2());
