function ndLargest(arr) {
    let first = -Infinity;
    let second = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > first) {
            second = first;
            first = arr[i];
        }
        else if (arr[i] > second && arr[i] !== first) {
            second = arr[i]
        }
    }
    console.log('first:', first)
    console.log('second:', second)

}
let arr = [10, 5, 20, 30, 15, 25]
ndLargest(arr);