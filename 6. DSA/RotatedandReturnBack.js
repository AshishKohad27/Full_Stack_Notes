function Approach_1(arr, k) {
    //SC:_O(N) TC:_O(N);

    k = k % arr.length;
    let n = arr.length;
    let bag = [];
    for (let i = 0; i < arr.length; i++) {
        if (i < k) {
            bag.push(arr[n + i - k]);
        } else {
            bag.push(arr[i - k]);
        }
    }
    console.log("Approach_1:", bag);
}

function Approach_2(arr, k) {
    let n = arr.length
    k = k % n;
    // split arr from o->n-k and reverse it
    reverse(arr, 0, n - k - 1);

    // split arr from o->n-k and reverse it
    reverse(arr, n - k, n - 1);

    //reverse whole arr
    reverse(arr, 0, n - 1);

    console.log("Approach_2:", arr);
}
const reverse = (arr, l, r) => {
    while (l < r) {
        [arr[l], arr[r]] = [arr[r], arr[l]];
        l++;
        r--;
    }
}

let arr_1 = [2, 3, 4, 7, 8, 9];
let arr_2 = [2, 3, 4, 7, 8, 9];
let k = 3;
Approach_1(arr_1, k);
Approach_2(arr_2, k);