let stack = new Array(6).fill(0);
let top = -1;
let minEle = Infinity;

function push(data) {
    if (top === stack.length) {
        console.log("OverFlow");
        return;
    }
    if (data < minEle) {
        minEle = data;
    }
    top++;
    stack[top] = data;
}
function pop() {
    if (top === -1) {
        console.log("UnderFlow");
        return;
    }
    stack[top] = 0;
    top--;
}
function peek() {
    if (top === -1) {
        console.log("UnderFlow");
        return;
    }
    console.log(stack[top]);
}
function getMin() {
    console.log("minEle:", minEle);
}
push(1);
push(2);
push(3);
push(4);
push(-1);
push(2);
pop();
pop();
peek();
getMin();
console.log("Stack:", stack);