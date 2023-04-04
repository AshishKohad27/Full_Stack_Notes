let arr = new Array(5).fill(0);
let top = -1;
// console.log('arr:', arr)

function myPush(data) {
    if (top === arr.length - 1) {
        console.log("OverFlow");
        return;
    }
    top++;
    arr[top] = data;
}

function myPop() {
    if (top === -1) {
        console.log("UnderFlow");
        return;
    }
    arr[top] = 0
    console.log("Pop Element", arr[top]);
    top--;
}

function peek() {
    if (top === -1) {
        console.log("UnderFlow");
        return;
    }
    console.log("Peek Element", arr[top]);
}
function SizeofTheStack() {
    console.log("Size", top + 1);
}
function isEmpty() {
    if (top === -1) {
        console.log("Yes it is Empty");
        return;
    }
    console.log("No it is not Empty")
}

function isFull() {
    if (top === arr.length - 1) {
        console.log("Yes it is Full");
        return;
    }
    console.log("No it is not Full")
}
peek();
myPush(2);
myPush(4);
myPush(8);
myPush(10);
myPush(10);
myPush(10);
myPop()
myPop()
myPop()
myPop()
myPop()
myPop()

SizeofTheStack()
isEmpty();
isFull();
console.log(arr);