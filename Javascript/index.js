// function private(x) {
//     let _name = x;
//     let setX = (newName) => {
//         _name = newName;
//     }
//     let getX = () => {
//         return _name;
//     }
//     return [
//         setX, getX
//     ]
// }

// let [setX, getX] = private();

// setX("Ashish");
// setX(getX() + " " + "Kohad");
// console.log(getX());
// console.log(0 && 90  );


// for (let i = 0; i < 5; i++) {
//     // (function (i) {
//         setTimeout(() => {
//             console.log(i);
//         }, 1000)
//     // })(i)


// }


// let result = 0 || 12
// console.log('result:', result)
let count = 0;
let id;

id = setInterval(() => {
    console.log("hello", count);
    count++;
    if (count === 10) {
        console.log("Stop setInterval")
        clearInterval(id)
    }
}, 1000);

console.log("count:", count);
