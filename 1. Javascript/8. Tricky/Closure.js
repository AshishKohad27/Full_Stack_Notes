function Outer() {
    let x = 0;
    return function () {
        x++;
        console.log(x);
    }
}

let result = Outer();
result();
result();
result();