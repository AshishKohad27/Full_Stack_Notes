// Given the row number n. Print the n-th row of Pascal’s triangle.

// Our first observation regarding Pascal’s triangle should be that the n-th row of the triangle has exactly n elements. With this observation, we will proceed to solve this problem.

// In this approach, for every column from 1 to n, we will calculate the element (n, c)(where n is the given row number and c is the column number that will vary from 1 to n) using the previous method. Thus, we will print the row.  
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

function pascalTriangle(n) {
    // printing the entire row n:
    for (let c = 1; c <= n; c++) {
        console.log(nCr(n - 1, c - 1) + " ");
    }
    console.log("n");
}

const n = 5;
pascalTriangle(n);