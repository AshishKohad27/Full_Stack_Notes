let arr = [13, 46, 24, 52, 20, 9];
let n = arr.length;

console.log("Before Sort:", arr);
let swapCount = 0;
for (let i = n - 1; i >= 0; i--) {
    let didSwap = 0;
    for (let j = 0; j <= i + 1; j++) {
        if (arr[j] > arr[j + 1]) {
            [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]]
            swapCount++;
            didSwap = 1;
        }
    }
    
    if (didSwap === 0) {
        break;
    }
    // Swapping
}
console.log("swapCount:", swapCount);
console.log("After Sort :", arr);