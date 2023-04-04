let arr = [4, 1, 8, 2, 6, 5];
let low = 0;
let high = arr.length - 1
let result = MergeSort(arr, low, high);
console.log('result:', arr);

// function MergeSort(arr, low, high) {
//     //base Condition
//     if (low === high) {
//         return;
//     }

//     //recursive operation
//     let mid = Math.floor(low + ((high - low) / 2));

//     //1. Left Side
//     MergeSort(arr, low, mid);

//     //2. Right Sort
//     MergeSort(arr, mid + 1, high);

//     //3.MergeTwoUnSortedArray
//     MergeTwoUnSortedArray(arr, low, mid, mid + 1, high)
// }

// function MergeTwoUnSortedArray(arr, low1, high1, low2, high2) {
//     let ans = [];
//     let i = low1;
//     let j = low2;
//     let k = low1;

//     while (i <= high1 && j <= high2) {
//         if (arr[i] >= arr[j]) {
//             ans[k++] = arr[j]
//             j++;
//         }
//         else  {
//             ans[k++] = arr[i]
//             i++;
//         }
//     }
//     while (i <= high1) {
//         ans[k++] = arr[i++]
//     }
//     while (j <= high2) {
//         ans[k++] = arr[j++]
//     }

//     //now replace ans array with original array
//     for (let i = low1; i <= high2; i++) {
//         arr[i] = ans[i];
//     }
// }

function MergeSort(arr, low, high) {
    if (low === high) {
        return;
    }

    let mid = Math.floor(low + ((high - low) / 2));

    //left
    MergeSort(arr, low, mid);

    //right
    MergeSort(arr, mid + 1, high);

    //MergeTwoUnSortedArray
    MergeTwoUnSortedArray(arr, low, mid, mid + 1, high);
}
function MergeTwoUnSortedArray(arr, low1, high1, low2, high2) {
    let ans = [];
    let i = low1;
    let j = low2;
    let k = low1;

    while (i <= high1 && j <= high2) {
        if (arr[i] >= arr[j]) {
            ans[k++] = arr[j];
            j++;
        }
        else {
            ans[k++] = arr[i];
            i++;
        }
    }

    while (i <= high1) {
        ans[k++] = arr[i++]
    }

    while (j <= high2) {
        ans[k++] = arr[j++]
    }

    for (let x = low1; x <= high2; x++) {
        arr[x] = ans[x]
    }
}