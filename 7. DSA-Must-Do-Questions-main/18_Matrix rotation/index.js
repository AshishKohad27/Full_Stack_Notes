function MatrixRotation(mat) {
    for (let i = mat.length - 1; i >= 0; i--) {
        let bag = "";
        for (let j = 0; j < mat[0].length; j++) {
            bag += mat[j][i] + " ";
        }
        console.log(bag);
    }
}

let mat = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];
MatrixRotation(mat)
