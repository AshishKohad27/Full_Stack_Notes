function BubbleSort(arr) {
    //it start sort from last element of the array;
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
            }
        }
    }
    console.log(arr.join(" "));
}
BubbleSort([5, 1, 6, 3, 7]);
