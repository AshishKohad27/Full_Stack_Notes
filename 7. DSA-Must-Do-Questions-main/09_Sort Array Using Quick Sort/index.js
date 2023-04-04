// Pivot and Partition;

function QuickSort(arr, start, end) {
    if (start >= end) return;

    let pivot = Partition(arr, start, end);

    QuickSort(arr, start, pivot - 1);
    QuickSort(arr, pivot + 1, end);
    return;
}

function Partition(arr, start, end) {
    let pivot = arr[end];
    let i = start - 1;

    for (let j = start; j <= end; j++) {
        if (pivot > arr[j]) {
            i++;
            [arr[i], arr[j]] = [arr[j], arr[i]];
        }
    }
    i++;
    [arr[i], arr[end]] = [arr[end], arr[i]];
    return i;
}

let arr = [19, 7, 15, 12, 16, 18, 4, 11, 13];
let start = 0;
let end = arr.length - 1;
QuickSort(arr, start, end);
console.log(arr);