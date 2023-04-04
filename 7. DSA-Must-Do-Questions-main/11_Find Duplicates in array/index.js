function FindDuplicate(arr) {
    let S1 = 0;
    let n = arr.length - 1;
    for (let i = 0; i < arr.length; i++) {
        S1 += arr[i];
    }
    // console.log(S1);
    let S2 = (n * (n + 1)) / 2;
    // console.log(S2);
    console.log(S1 - S2);
}
FindDuplicate([1, 3, 2, 2, 4]);
