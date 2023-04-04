function reverseString(str) {
    let leftIndex = 0;
    let rightIndex = str.length - 1;

    while (leftIndex < rightIndex) {
        let temp = str[leftIndex];
        str[leftIndex] = str[rightIndex];
        str[rightIndex] = temp;
        leftIndex++;
        rightIndex--;
    }

    return str;
}

let originalStr = "Hello World!";
let reversedStr = reverseString(originalStr);

//   console.log(reversedStr); // Output: !dlroW olleH

function elementInIndex(arr, ele, pos) {
    let i = pos;
    while (i < arr.length) {
        let store = arr[i];
        arr[i] = ele;
        ele = store;
        i++;
    }
    arr.push(ele);
    console.log(arr);
}
let arr = [1, 2, 3, 4];
let ele = 5;
let pos = 0;
elementInIndex(arr, ele, pos);

