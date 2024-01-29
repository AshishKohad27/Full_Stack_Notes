let matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16],
];

// makingN(matrix);
function makingN(matrix) {
    let n = '';
    // Step 1
    for (let i = matrix.length - 1; i >= 0; i--) {
        n += matrix[i][0] + " ";
    }
    // Step 2
    for (let i = 0; i < matrix.length; i++) {
        for (let j = 0; j < matrix.length; j++) {
            if (i - j === 0 && i !== 0 && j !== 0) {
                n += matrix[i][j] + " ";
            }
        }
    }

    // Step 3
    for (let i = matrix.length - 2; i >= 0; i--) {
        n += matrix[i][matrix.length - 1] + " ";
    }
    console.log("n:", n);

}

SpiralMatrix(matrix);
function SpiralMatrix(matrix) {
    let spiral = '';
    let count = 0;
    let left = 0;
    let top = 0;
    let right = matrix[0].length - 1;
    let bottom = matrix.length - 1;
    let n = matrix.length;
    let m = matrix[0].length;

    while (count < n * m) {

        for (let i = top; i <= bottom; i++) {
            spiral += matrix[i][left] + " ";
            count++;
        }
        left++;

        for (let i = left; i <= right; i++) {
            spiral += matrix[bottom][i] + " ";
            count++;
        }
        bottom--;

        for (let i = bottom; i >= top; i--) {
            spiral += matrix[i][right] + " ";
            count++;
        }
        right--;

        for (let i = right; i >= left; i--) {
            spiral += matrix[top][i] + " ";
            count++;
        }
        top++;
    }


    console.log("spiral:", spiral);

}