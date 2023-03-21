// function toggle(...args) {
//     console.log('args:', args)
//     let index = 0;
//     return function () {
//         if (index === args.length) {
//             index = 0;
//         }
//         console.log("index", index)
//         return args[index++];
//     }
// }

// let result = toggle("on", "off", 1, 2, 3, 4, 5)
// console.log('result:', result()) // on
// console.log('result:', result()) // off
// console.log('result:', result()) // 1
// console.log('result:', result()) // 2


function totalChocolate(n) {
    // 3 wrapper = 1chocolate
    let chocolate = n;
    let sum = n;
    let offerChocolate = 0;
    let wrapper = Math.floor(n / 3)
    console.log('wrapper:', wrapper)

    while (chocolate !== 1) {
        let rem = chocolate % 3;
        console.log('rem:', rem)
        if (rem === 0) {
            offerChocolate += chocolate / 3;
            sum += offerChocolate;
            chocolate = offerChocolate;
        } else {
            sum += 1;
            chocolate = 1;
        }
        console.log('chocolate:', chocolate)
        console.log('sum:', sum)
        console.log('offerChocolate:', offerChocolate)
    }
    sum += 1;// last chocolate


}
totalChocolate(5);