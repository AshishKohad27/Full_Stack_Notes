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


for (let i = 0; i < 5; i++) {
    // (function (i) {
        setTimeout(() => {
            console.log(i);
        }, 1000)
    // })(i)


}
