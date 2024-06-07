let arr = [1, 2, 3, 4, 5];
let n = arr.length;
let k = 3;
k = k % n;
let count = 0;
let bag = '';

for (let i = 0; i < n; i++) {
    if (i < k) { // taking last element first
        // console.log("i:", i);
        // console.log("index:", n + i - k);
        bag += arr[n + i - k] + " ";
    } else {
        bag += arr[i - k] + " ";
    }
}

console.log("bag:", bag);