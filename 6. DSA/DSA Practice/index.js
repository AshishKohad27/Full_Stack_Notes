let n = 6;
let arr1 = [1, 2, 2, 3, 4, 5];
let arr2 = [4, 4, 3, 2, 1, 1];

let bag = '';

let p1 = 0;
let p2 = arr2.length - 1;

while (p1 < n && p2 >= 0) {
    if (arr1[p1] === arr2[p2]) {
        bag += arr1[p1] + " ";
        p1++;
        p2--;
    }
    else if (arr1[p1] > arr2[p2]) {
        p2--;
    }
    else if (arr1[p1] < arr2[p2]) {
        p1++;
    }
}

console.log("bag:", bag);