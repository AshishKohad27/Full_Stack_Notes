function toggle(...args) {
    console.log('args:', args)
    let index = 0;
    return function () {
        if (index === args.length) {
            index = 0;
        }
        console.log("index", index)
        return args[index++];
    }
}

let result = toggle("on", "off", 1, 2, 3, 4, 5)
console.log('result:', result()) // on
console.log('result:', result()) // off
console.log('result:', result()) // 1
console.log('result:', result()) // 2
