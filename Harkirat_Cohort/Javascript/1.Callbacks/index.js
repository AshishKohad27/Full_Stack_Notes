function square(n) {
    return n * n;
}

function cube(n) {
    return n * n * n;
}

function sumOfSomethings(a, b, callbackFn) {
    return callbackFn(a) + callbackFn(b);
}

let ans1 = sumOfSomethings(2, 3, square);
let ans2 = sumOfSomethings(2, 3, cube);
console.log("ans1:", ans1);
console.log("ans2:", ans2);