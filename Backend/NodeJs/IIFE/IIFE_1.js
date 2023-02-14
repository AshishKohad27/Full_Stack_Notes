// normal function
function callMe() {
    console.log("Hey! you just called me")
}

callMe();


// IIFE: Immediately Invoked Function Expressions
(function () {

    //write your code here

})()

// Note: If you run the above code, it will cause an Uncaught TypeError: callMe(...) 
// is not a function. And it concatenates the callMe function with IIFE next to it.
// The Solution:
// The above code will result in syntax errors during execution. Hence, we use 
// semicolons to avoid unnecessary concatenation with the previous/next line of 
// javascript code.


// Syntax 2
!function callMe() {
    console.log("Ahh! I am a IIFE now")
}()


//Example
//JavaScript's behavior surprises many when callbacks are executed in loops. For example, let's count from 1 to 5 in JavaScript, putting a 1 second gap between every time we log a message. A naïve implementation would be:
for (var i = 1; i <= 5; i++) {
    setTimeout(function () {
        console.log('I reached step ' + i);
    }, 1000 * i);
}

// While the output would be printed 1 second after the other, each line prints that they reached step 6. Why?

// When JavaScript encounters asynchronous code, it defers execution of the callback until the asynchronous task completes. That's how it remains non-blocking. In this example, the console.log() statement will run only after the timeout has elapsed.

// JavaScript also created a closure for our callback. Closures are a combination of a function and its scope when it was created. With closures, our callback can access the variable i even though the for loop has already finished executing.

// However, our callback only has access to the value of i at the time of its execution. As the code within the setTimeout() function were all deferred, the for loop was finished with i being equal to 6. That's why they all log that they reached step 6


for (var j = 1; j <= 5; j++) {
    (function (step) {
        setTimeout(() => {
            console.log('I reached step j ' + step)
        }, 1000 * j)
    })(j)
}
// By using an IIFE, we create a new scope for our callback function.
//  Our IIFE takes a parameter step. Every time our IIFE is called, we give 
// it the current value of i as its argument. Now, when the callback is ready
//  to be executed, its closure will have the correct value of step.