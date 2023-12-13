function ndLargest(arr) {
    let first = -Infinity;
    let second = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > first) {
            second = first;
            first = arr[i];
        } else if (arr[i] > second && arr[i] !== first) {
            second = arr[i];
        }
    }
    console.log("first:", first);
    console.log("second:", second);
}
let arr = [10, 5, 20, 30, 15, 25];
ndLargest(arr);


function LargestNumber(arr) {
    let max = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }

    console.log("Largest element in array:", max);
}

// LargestNumber(arr);


function smallestNumber(arr) {
    let min = Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    console.log("Smallest element in array:", min);
}

// smallestNumber(arr);


function Largest2ndNumber(arr) {
    let first = -Infinity;
    let second = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > first) {
            second = first;
            first = arr[i];
        }
        else if (arr[i] > second && arr[i] !== first) {
            second = arr[i];
        }
    }

    console.log("Second Largest Element:", second);
}

// Largest2ndNumber(arr);

function Largest3rdNumber(arr) {
    let first = -Infinity;
    let second = -Infinity;
    let third = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > first) {
            third = second;
            second = first;
            first = arr[i];
        }
        else if (arr[i] > second && arr[i] !== first) {
            third = second;
            second = arr[i];
        }
        else if (arr[i] > third && arr[i] !== second) {
            third = arr[i];
        }
    }

    console.log("First Largest Element :", first);
    console.log("Second Largest Element:", second);
    console.log("Third Largest Element :", third);
}

// Largest3rdNumber(arr);

function smallest2ndNumber(arr) {
    let first = Infinity;
    let second = Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] < first) {
            second = first;
            first = arr[i];
        }
        else if (arr[i] < second && arr[i] !== first) {
            second = arr[i];
        }
    }

    console.log("first Largest Element :", first);
    console.log("Second Largest Element:", second);
}
smallest2ndNumber(arr);