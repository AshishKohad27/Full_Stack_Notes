let matrix = [
  [1, 1, 1],
  [1, 0, 1],
  [1, 1, 1],
];
matrix = [
  [1, 1, 0, 1],
  [3, 4, 2, 2],
  [1, 3, 1, 0],
];

let n = matrix.length; // 3
console.log("n:", n);
let m = matrix[0].length; // 4
console.log("m:", m);

let firstRow = false;
let firstCol = false;

for (let i = 0; i < n; i++) {
  if (matrix[i][0] === 0) {
    firstCol = true;
    break;
}
}
for (let j = 0; j < m; j++) {
    if (matrix[0][j] === 0) {
        firstRow = true;
        break;
}
}

console.log('firstRow: ', firstRow);
console.log('firstCol: ', firstCol);

for (let i = 1; i < n; i++) {
  for (let j = 1; j < m; j++) {
    if (matrix[i][j] === 0) {
      matrix[i][0] = 0;
      matrix[0][j] = 0;
    }
  }
}

console.log(matrix);

for (let i = 1; i < n; i++) {
  for (let j = 1; j < m; j++) {
    if (matrix[i][0] === 0 || matrix[0][j] === 0) {
      matrix[i][j] = 0;
    }
  }
}
console.log(matrix);

// Zero the first row if needed
if (firstRow) {
  for (let j = 0; j < m; j++) {
    matrix[0][j] = 0;
  }
}

// Zero the first column if needed
if (firstCol) {
  for (let i = 0; i < n; i++) {
    matrix[i][0] = 0;
  }
}
console.log(matrix);
