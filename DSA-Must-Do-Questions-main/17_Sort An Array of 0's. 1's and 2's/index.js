let arr = [0, 1, 2, 0, 1, 2];
let n = arr.length;

SortAnArray(arr, n);

function SortAnArray(arr, n) {
    let count0 = 0;
    let count1 = 0;
    let count2 = 0;

    for (let i = 0; i < n; i++) {
        switch (arr[i]) {
            case 0:
                count0++;
                break;
            case 1:
                count1++;
                break;
            case 2:
                count2++;
                break;
        }
    }
    let i = 0;
    while (count0 > 0) {
        arr[i++] = 0;
        count0--;
    }
    while (count1 > 0) {
        arr[i++] = 1;
        count1--;
    }
    while (count2 > 0) {
        arr[i++] = 2;
        count2--;
    }
    console.log(arr.join(" "))
    // console.log(count0, count1, count2);
}