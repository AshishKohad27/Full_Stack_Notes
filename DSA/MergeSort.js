let nums = [4, 5, 1, 3, 2];
let result = MergeSort(nums);
console.log("result:", result);

function MergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }

    let mid = Math.floor(arr.length / 2);

    let left_arr = arr.splice(0, mid); // n
    let right_arr = arr;
    return Merge(MergeSort(left_arr), MergeSort(right_arr));
}

function Merge(left_arr, right_arr) {
    let sorted_arr = [];

    while (left_arr.length && right_arr.length) {
        if (left_arr[0] >= right_arr[0]) {
            sorted_arr.push(left_arr.shift());
        } else {
            sorted_arr.push(right_arr.shift());
        }
    }
    return [...sorted_arr, ...left_arr, ...right_arr];
}
