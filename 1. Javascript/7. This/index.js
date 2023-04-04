function details(age) {
    // this.age = age;
    console.log(this)
}

let newDetails = new details(24)