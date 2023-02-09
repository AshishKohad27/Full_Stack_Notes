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
let user3 = {
    name: "Ram Thakur",
    age: 36,
    designation: "SDE",
}
let printDetails = function (state, country) {
    console.log(this.name + " " + state + " " + country);
}
//Call
printDetails.call(user1);
printDetails.call(user2, "Maharashtra", "Country");
printDetails.call(user3);

//Apply
printDetails.apply(user2, ["Maharashtra", "Country"]);

//Blind