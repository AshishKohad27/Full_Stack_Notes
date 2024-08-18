let arr = [13, 46, 24, 52, 20, 9];
let n = arr.length;

console.log("Before Sort:", arr);
for (let i = 0; i < n; i++) {

    let min = Infinity;
    let swapIndex = -1;

    for (let j = i; j < n; j++) {
        if (arr[j] <= min) {
            min = arr[j];
            swapIndex = j;
        }
    }
    // Swapping
    [arr[i], arr[swapIndex]] = [arr[swapIndex], arr[i]]
}
console.log("After Sort :", arr);