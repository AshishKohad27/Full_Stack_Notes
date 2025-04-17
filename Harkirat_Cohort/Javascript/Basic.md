## Why Langauges?
- Langauges are use to write application.
- Developer write high level code in these languages.
- Every language has complier which converts the developer code into 01.

## Interpreted vs Complied Languages
### Complied Languages (C++, JAVA,Rust, Golang)
    1. Write code 
    2. Complied Code
    3. Run code
- Frist need to complie, then need to run
- Usually dont complie if there isan error in the code
- More strict code
```java
// Static Languages
int number = 5; // we declare int variable as number
number = "Hello"; // this will cause a complie-time error
```

### Interpreted (JS,Python) (Not Doing complation step)
    1. Write code
    2. Run code
- Usually go line by line
- can run partially if the error comes later

```javascript
// Dynamic Languages
console.log("Hello world!"); // this will run then error occur
console.log(a); // at this we get error but our code run partially

// if in Complied langauges then we got an error we have to fix error then our code get complied.
```

```javascript
int number = 5; // we declare variable as number
number = "Hello"; // then we declare variable as string 
// still we get our output as a string which is not possible in Complied langauges
```

## Single Threaded Nature of JavaScript

## Simple primitives
- Variable (let / var / Const)
- Data Types - strings, numbers and booleans

## Complex primitives
- Array
- Object

### array 
```javascript
let arr = [];

for (let i = 0; i <= 100; i++) {
    arr.push(i);
}
findEven(arr);
findOdd(arr);
findBiggest(arr);
findSmallest(arr);

function findEven(arr) {
    let even = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] % 2 === 0) {
            even.push(arr[i]);
        }
    }
    console.log("Even:", even);
}

function findOdd(arr) {
    let odd = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] % 2 === 1) {
            odd.push(arr[i]);
        }
    }
    console.log("Odd:", odd);
}

function findBiggest(arr) {
    let max = -Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }

    console.log("Biggest Number:", max);
}

function findSmallest(arr) {
    let min = Infinity;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }

    console.log("Smallest Number:", min);
}
```


## Function
- Take certain values as input and return some output

## Callbacks
- function take another function as input
``` javascript
function Calculator(a, b, OperationType) { // calling back function
    const ans = OperationType(a, b);
    return ans;
}

function sum(a, b) {
    console.log("Sum Operations");
    return a + b;
}

function sub(a, b) {
    console.log("Sub Operations");
    return a + b;
}

function mul(a, b) {
    console.log("Mul Operations");
    return a + b;
}

function div(a, b) {
    console.log("Div Operations");
    return a + b;
}

const value = Calculator(1, 2, div);
console.log(value);
```

```javascript
// Clock

let second = 0;
let minutes = 58;
let hours = 0;
let interval = 10; // seconds


setInterval(function () {
    second++;
    const displaySeconds = second <= 9 ? `0${second}` : second;
    const displayMinutes = minutes <= 9 ? `0${minutes}` : minutes;
    const displayHours = hours <= 9 ? `0${hours}` : hours;

    if (second >= 60) {
        second = 0;
        minutes++;
    }

    if (minutes >= 60) {
        minutes = 0;
        hours++;
    }

    let clock = `${displayHours}:${displayMinutes}:${displaySeconds}`
    console.log(clock);
}, interval)
```
## Loop
- when we have to use repited logic then we use loops

```javascript
    let ans = 0;
    for (let i = 0; i <= 50; i++) {
        ans += i;
    }
    console.log("ans: ", ans);
```
- let i = 0 -> initialized
- i <= 50 -> loop limit or we give condition 
- i++ -> how to increased or loop 

## function 
a function in javascript  ia a set of statments that perform a task or calculatea value
it should take some input and return an output where there is some obvious relationship between the input and the output
