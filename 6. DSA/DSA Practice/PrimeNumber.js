let num = 8;
// Method_1(num);
// Method_2(num);
Method_3(num);
function Method_1() {
    // Time Complexcit : O(N)
    let factor = 0;
    for (i = 2; i <= num; i++) {
        if (num % i === 0) {
            factor++;
        }
    }

    if (factor > 1) {
        console.log("Not A Prime Number!");
    } else {
        console.log("Prime Number");
    }
}

function Method_2() {
    // Time Complexcit : O(N/2)
    let factor = false;
    for (i = 2; i <= num / 2; i++) {
        if (num % i === 0) {
            factor = true;
            break;
        }
    }

    if (factor) {
        console.log("Not A Prime Number!");
    } else {
        console.log("Prime Number");
    }
}

function Method_3() {
    // Time Complexcit : O(N**0.5)
    let factor = false;
    for (i = 2; i <= num ** 0.5; i++) {
        if (num % i === 0) {
            factor = true;
            break;
        }
    }

    if (factor) {
        console.log("Not A Prime Number!");
    } else {
        console.log("Prime Number");
    }
}