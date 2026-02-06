let matrix = [
  [1, 1, 1],
  [1, 0, 1],
  [1, 1, 1],
];
matrix = [
  [0, 1, 2, 0],
  [3, 4, 5, 2],
  [1, 3, 1, 5],
];

let n = matrix.length; // 3
console.log("n:", n);
let m = matrix[0].length; // 4
console.log("m:", m);

let col = new Array(m).fill(false);
let row = new Array(n).fill(false);
console.log("col:", col);
console.log("row:", row);

for (let i = 0; i < n; i++) {
  for (let j = 0; j < m; j++) {
    // console.log(`i:${i}`, `j:${j}`, `=>${matrix[i][j]}`);
    if (matrix[i][j] === 0) {
      row[i] = true;
      col[j] = true;
    }
  }
}

console.log("col:", col);
console.log("row:", row);
console.log(matrix);

for (let i = 0; i < n; i++) {
  for (let j = 0; j < m; j++) {
    if (row[i] || col[j]) {
      matrix[i][j] = 0;
    }
  }
}
console.log(matrix);
