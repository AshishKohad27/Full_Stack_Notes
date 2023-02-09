//Selection Sort :- sort start from start
let arr = [1, 4, 2, 3, 5];
let N = arr.length;
console.log("Before Sort:", arr);

for (let i = 0; i < N - 1; i++) {
    let min = i;
    for (let j = i + 1; j < N; j++) {
        if (arr[min] > arr[j]) {
            min = j;
        }
    }
    [arr[i], arr[min]] = [arr[min], arr[i]];
}
console.log("After Sort :", arr);