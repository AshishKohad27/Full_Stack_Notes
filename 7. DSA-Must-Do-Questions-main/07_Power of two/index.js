function PowerOfTwo(n) {
    let count = 0;
    while (n > 1) {
        if (n % 2 === 1) {
            // console.log("n:", n);
            count++;
        }
        n = n / 2;
    }
    // console.log("count", count);
    if (count === 0) {
        console.log("Yes");
    } else {
        console.log("No");
    }
}
PowerOfTwo(4);
PowerOfTwo(64);
PowerOfTwo(54);
PowerOfTwo(100);
PowerOfTwo(84);
PowerOfTwo(1024);
PowerOfTwo(2);
