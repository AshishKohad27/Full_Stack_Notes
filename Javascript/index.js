function private(x) {
    let _name = x;
    let setX = (newName) => {
        _name = newName;
    }
    let getX = () => {
        return _name;
    }
    return [
        setX, getX
    ]
}

let [setX, getX] = private();

setX("Ashish");
setX(getX() + " " + "Kohad");
console.log(getX());