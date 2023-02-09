function FizzBuzz(n) {
    let bag = "";
    for (let i = 1; i <= n; i++) {
        if (i % 3 === 0 && i % 5 === 0) {
            bag += "FizzBuzz" + " ";
        } else if (i % 3 === 0) {
            bag += "Fizz" + " ";
        } else if (i % 5 === 0) {
            bag += "Buzz" + " ";
        } else {
            bag += i + " ";
        }
    }
    console.log(bag);
}
FizzBuzz(10);
