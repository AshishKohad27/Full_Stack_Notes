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

for (let i = 0; i < n; i++) {
  for (let j = 0; j < m; j++) {
    // console.log(`i:${i}`, `j:${j}`, `=>${matrix[i][j]}`);
    if (matrix[i][j] === 0) {
      //   console.log("hello");
      for (let col = 0; col < m; col++) {
        if (matrix[i][col] !== 0) {
          matrix[i][col] = -1;
        }
      }

      for (let row = 0; row < n; row++) {
        if (matrix[row][j] !== 0) {
          matrix[row][j] = -1;
        }
      }
    }
  }
}

console.log(matrix);

for (let i = 0; i < n; i++) {
  for (let j = 0; j < m; j++) {
    if ((matrix[i][j] === -1)) matrix[i][j] = 0;
  }
}
console.log(matrix);
