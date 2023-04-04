//Divide and conquer
function MergeSort(arr, low, high) {
    if (low === high) {
        return; //single is always sorted;
    }

    let mid = Math.floor(low + (high - low) / 2);

    MergeSort(arr, low, mid);
    MergeSort(arr, mid + 1, high);

    MergerTwoUnSortedArr(arr, low, mid, mid + 1, high);
}

function MergerTwoUnSortedArr(arr, low1, high1, low2, high2) {
    let ans = [];
    let i = low1;
    let j = low2;
    let k = low1;

    while (i <= high1 && j <= high2) {
        if (arr[i] >= arr[j]) {
            ans[k++] = arr[j++]; //smaller element pass;
        } else {
            ans[k++] = arr[i++];
        }
    }

    while (i <= high1) {
        ans[k++] = arr[i++];
    }
    while (j <= high2) {
        ans[k++] = arr[j++];
    }

    for (let i = low1; i <= high2; i++) {
        arr[i] = ans[i];
    }
}
// let arr = [4, 1, 5, 7, 3, 3, 6, 2];
let arr = [5, 3, 4, 2, 1];
let low = 0;
let high = arr.length - 1;
MergeSort(arr, low, high);
console.log("arr:", arr);
