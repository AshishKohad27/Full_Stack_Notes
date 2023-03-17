function RotatedArray(mat, r) {
    let n = mat.length;
    let top = 0
    let left = 0;
    let right = mat[0].length - 1;
    let bottom = mat.length - 1;
    let count = 0;
    if (n % 2 === 0) {
        count = 0;
    } else if (n % 2 === 1) {
        count = 1;
    }

    while (count < n * n) {
        let startEle
        if (right > 0) {
             startEle = mat[top + 1][right];
        }
        // console.log('startEle:', startEle)
        // console.log("top:", top);
        // console.log("left:", left);
        // console.log("right:", right);
        // console.log("bottom:", bottom);
        for (let i = right; i >= left && count < n * n; i--) {
            let current = mat[top][i];
            mat[top][i] = startEle;
            startEle = current;
            count++;
        }
        top++;

        for (let i = top; i <= bottom && count < n * n; i++) {
            let current = mat[i][left];
            mat[i][left] = startEle;
            startEle = current;
            count++;
        }
        left++;

        for (let i = left; i <= right && count < n * n; i++) {
            let current = mat[bottom][i];
            mat[bottom][i] = startEle;
            startEle = current;
            count++;
        }
        bottom--;

        for (let i = bottom; i >= top && count < n * n; i--) {
            let current = mat[i][right];
            mat[i][right] = startEle;
            startEle = current;
            count++;
        }
        right--;
        // console.log('startEle:', startEle)
    }
}
let mat = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
]

let r = 2;
for (let i = 0; i < r; i++) {
    RotatedArray(mat, r);
}

PrintMatrix(mat);
function PrintMatrix(mat) {
    for (let i = 0; i < mat.length; i++) {
        console.log(mat[i].join(" "));
    }
}