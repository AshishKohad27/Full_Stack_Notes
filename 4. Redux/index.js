

function hello(x) {
    // console.log(x);
    return function world(y) {
        // console.log(x, y);
        return function ashish(z) {
            console.log(x, y, z)
        }
    }
}
hello("hello")("world")("ashish");


// let lang = ["java", "javascript", "python"]
// let lang = ["java", "javascript", "c++"]

// const [something, setSomething] = useState(0);

// ussEffect(() => {

// }, [])

