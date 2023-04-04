// function abc(a, a, b) {
//     console.log("a", a, "b", b);
//     console.log(a + a + b);
// }
// abc(1, 2, 3);


// //2.
// let ash = function (a) {
//     console.log(a)
// }

// ash("154545")

var variable = 10;
(() => {
    console.log(variable);
    var variable = 20;
    console.log(variable);
})();