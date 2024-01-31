let arr = [1, 2, 3, 4, 5];
MergeOfLeftRight(arr);

function ProductOfLeftSide(arr) {
    let left = new Array(arr.length).fill(0);
    let productLeft = 1;

    for (let i = 0; i < arr.length; i++) {
        if (i === 0) {
            left[i] = 1;
        } else {
            productLeft *= arr[i - 1];
            left[i] = productLeft;
        }
    }

    console.log("left : " + left);
    return left;
}

function ProductOfRightSide(arr) {
    let right = new Array(arr.length).fill(0);
    let productRight = 1;

    for (let i = arr.length - 1; i >= 0; i--) {
        if (i === arr.length - 1) {
            right[i] = 1;
        } else {
            productRight *= arr[i + 1];
            right[i] = productRight;
        }
    }
    console.log("right: " + right);
    return right;
}

function MergeOfLeftRight(arr) {
    let left = ProductOfLeftSide(arr);
    let right = ProductOfRightSide(arr);
    let ans = [];
    for (let i = 0; i < arr.length; i++) {
        ans[i] = left[i] * right[i];
    }
    console.log(ans);
}