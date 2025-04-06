// The naive approach is basically a combination of variation 1 and 
// variation 2. Here, for every row from 1 to n, we will try to 
// generate all the row elements by simply using the naive approach 
// of variation 2. So, we will use the same code as 
// variation 2(naive approach), inside a loop (i.e. row runs from 1 to n).



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
    let ans = [];

    for (let row = 1; row <= n; row++) {
        let temp = [];











        
        for (let col = 1; col <= row; col++) {
            let value = nCr(row - 1, col - 1);
            temp.push(value);
        }
        ans.push(temp);
    }

    return ans;
}

const n = 5;
const ans = pascalTriangle(n);
for (let i = 0; i < ans.length; i++) {
    console.log(ans[i].join(" "));
}