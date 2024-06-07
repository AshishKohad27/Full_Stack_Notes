let arr = [1, 2, 3, 4, 5];
let n = arr.length;
let k = 3;
let count = 0;

while (count < k) {
    let start_ele = arr[n - 1];
    for (let i = 0; i < n; i++) {
        let current_ele = arr[i];
        arr[i] = start_ele;
        start_ele = current_ele;
    }
    count++;
}

console.log("arr:", arr);