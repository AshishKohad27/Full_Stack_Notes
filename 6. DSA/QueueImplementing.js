let arr = [];
let front = 0;
let rear = 0;
let size = 5;

function EnQueue(data) {
    if (size === rear) {
        console.log("OverFlow");
        return;
    }
    arr[rear] = data;
    rear++;
}

function DeQueue() {
    if (front === rear) {
        console.log("UnderFlow");
        return;
    }
    console.log(arr[front]);
    front++;
}

EnQueue(5);
EnQueue(5);
EnQueue(5);
EnQueue(5);
EnQueue(5);
EnQueue(5);
EnQueue(5);
DeQueue();
DeQueue();
console.log("arr:", arr);