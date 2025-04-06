// In this case, we are given the row number r and the column number c, and we need to find out the element at position (r,c). 

// nCr = n! / (r! * (n-r)!)

function factorize(num) {
    let mul = 1;
    for (let i = 1; i <= num; i++) {
        mul *= i;
    }
    return mul;
}

function nCr(n, r) {
    let result = factorize(n) / (factorize(r) * (factorize(n - r)));
    return result;
}

let numRow = 7;
let numCol = 4;
let n = numRow - 1
let r = numCol - 1
let position = nCr(n, r);
console.log("position:", position);