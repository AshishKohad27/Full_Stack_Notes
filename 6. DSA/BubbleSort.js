let arr = [8, 5, 1, 3, 2, 4];
//BubbleSort:- it sort from rear end of an arr
/**
 * TC:- O(N^2);
 * SC:- O(1);
 */

console.log("Before Sort:", arr);
for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
            [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
        }
    }
}
console.log("After Sort :", arr);
