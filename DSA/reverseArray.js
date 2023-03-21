let arr = [1, 2, 3, 4, 5];
let n = arr.length;

function reverseArray(arr, n) {
    //time Complexity o(n/2);
    //space Complexity o(1);
    let i = 0;
    let j = n - 1;
    while (i < j) {
        [arr[i], arr[j]] = [arr[j], arr[i]];
        i++;
        j--;
    }
    console.log("array:", arr);
}
reverseArray(arr, n);
