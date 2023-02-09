function PrimeNumber(n) {
    //Tc:- O(N);
    let factor = 0;
    for (let i = 1; i <= n; i++) {
        if (n % i === 0) {
            // console.log("i:", i)
            factor++;
        }
    }
    // console.log("factor:", factor);
    if (factor > 2) {
        console.log("No");
    } else {
        console.log("Yes");
    }
}
// PrimeNumber(23);

//mETHOD 2:-
function OptimizedPrimeNumber(n) {
    let factor = 0;
    for (let i = 2; i <= n ** 0.5; i++) {
        if (n % i === 0) {
            factor++;
        }
    }
    if (factor === 0) {
        console.log("Yes");
    } else {
        console.log("No");
    }
}
OptimizedPrimeNumber(7);
