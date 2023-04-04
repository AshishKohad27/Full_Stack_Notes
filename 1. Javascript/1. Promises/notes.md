
# Promises in JavaScript

src:- https://www.scaler.com/topics/javascript/promises-in-javascript/

- Need for Promises in JavaScript

1. JavaScript is single-threaded, i.e., it can perform only one task at a time. To handle asynchronous tasks in JavaScript
2. To handle blocking of execution thread because asynchronous tasks take time to complete.

# What is a Promise in JavaScript?

- Water fall request.

- A promise in JavaScript is no different from a promise in real life. If you take a promise from me that I will bring you a bar of chocolate, there can be three cases here:

- You are waiting for me to come (the promise is in a PENDING state)
  I bought you a bar of chocolate (the promise is in a FULFILLED state)
  The shop was closed, or due to any reason, the promise failed ( the promise goes to the REJECTED state).
  Similarly, when you call an asynchronous function, i.e., a function that might send a response in the future, you are actually taking a promise. At first, the promise remains in the PENDING state because no response has been received. After some time, when the response is received, there are two possible cases:

- We got a response (i.e., the promise goes to the FULFILLED state)
  We got an error and no response (the promise got REJECTED)
  Note: Getting a response means the promise is in the SETTLED state. In other words, the promise is not in the PENDING state now, and it has been either RESOLVED or REJECTED.
  ![Alt text](Images/Promises.webp)

### How Promises Work

- In technical terms, a promise is an object that is returned as a response to an asynchronous function. It can be one of these four possible states:

1. PENDING
2. FULFILLED
3. REJECTED
4. SETTLED

- Let us understand this in a bit more detail. The moment a promise is invoked, it goes to the PENDING state and waits for a response to come. We might get the correct response, which makes the promise FULFILLED, or we might get an error, i.e., the promise goes to the REJECTED state. A promise is said to be SETTLED if it is not in the pending state, i.e., either the response has arrived or an error has occurred.

Note: Once settled, a promise cannot be resettled.

### CallBack Hell

- Before promises came up, callbacks were used to handle asynchronous code. Callbacks showed a serious problem called the Callback Hell

- When it comes to asynchronous tasks, i.e., where we might not get a response immediately, we need to handle this in a very different way. One of the ways is to use callbacks. Consider this:

```javascript

// Callback is a function sent as a parameter to another function.
//

const getData = (id, callbackFunction) => {
    const data = request data for given id user from db
    callbackFunction(data);
}

const data = getData(123, (data) => console.log(data))
```

- We are sending the action to be performed after the completion of the asynchronous task as a parameter to the first function. Suppose we want to filter the data and display an image corresponding to this id.

Note: Loading an image from the database will also need time and is an asynchronous task.

```javascript

// This function return the data
const getData = (id, callbackFunction) => {
    const data = request data for given id user from db
    callbackFunction(data);
}

// This function return the image
const getImage = (data, callbackFunction) => {
    const imageSrc = data.imageSrc;
    callbackFunction(imageSrc);
}
const displayImage = () => {
    //displays the image
}

// This function calls the above functions to get data and THEN get image.
const DisplayImageWithID = (id) => {
    getData(id, (data) => {
        getImage(data, (imageSrc) => {
            displayImage(imageSrc);
        })
    })
}

DisplayImageWithID(123);
```

```javascript
Look at this, the same code with callback being written with promises.


// This function returns data corresponding to an id
const getData = (id) => {
    const data = request data for given id user from db
    return data;
}

// This function send the image source from the data
const getImage = (data) => {
    return data.imageSrc;
}

// This function will displat the image.
const displayImage = () => {
    //displays the image
}

// Main function calling the above functions
const DisplayImageWithID = (id) => {
    getData(id)
    .then(data => getImage(data))
    .then(imageSrc => displayImage(imageSrc))
}
```

Now, this can lead to callback hell,
![Alt text](Images/callback-hell.webp)

# The Important Rules of Promise

1. A standard promise comes with a pre-defined .then() method.
2. A promise is initially in the pending state, which transitions into a fulfilled or rejected state after some time.
   Fulfilled or rejected states are settled states. 3. A promise, once settled, cannot be resettled, i.e., a settled state can not transition into any other state.
3. Once settled, a promise will have value. If fulfilled, the promise will have the data requested. If rejected, it will contain undefined. But it will always have a value after being settled, which cannot be changed.
   ![Alt text](Images/the-important-rules-of-promise.webp)

### Promise Chaining

- Callbacks and promises are both used to handle asynchronous code in JavaScript. When you use callbacks, you send callback functions as parameters to another function. Using promises, you do not need to PASS callback functions. But instead, ATTACH them with the promise using the .then() method.

- So, you still need to use callbacks while working with promises, but differently.
  .then() always returns another promise. So, we can chain promises like this.

```javascript
fetch(url_to_get_data).then(filterData).then(consoleData).catch(handleError);
```

Promise Chaining works like try, and catch, but it makes asynchronous code look more like the synchronous one. The code here works sequentially, i.e., line by line

### Conclusion

1. JavaScript can perform only one task at a time, and if a task takes longer to complete, the JavaScript thread cannot wait for it.
2. Asynchronous tasks need to be handled differently.
3. To handle asynchronous tasks effectively, we have promises in JavaScript.
4. Promises are exactly what you would expect from its name. They make a promise that a response will be sent to the browser. Meanwhile, other tasks can be performed.
5. Promises can have four states - PENDING, FULFILLED, REJECTED, and SETTLED.
6. When a promise is triggered, it is in the Pending state. After some time, this asynchronous task might be completed and return with one of these statuses - fulfilled or rejected.
7. A promise fulfilled or rejected is said to be in the SETTLED state. Once settled, a promise cannot be resettled.
8. How does the browser get to know when a promise gets a response? We have the following methods for the same.

- .then()
- .catch()
- .finally()

##Examples
[label](Promises.js)

  <br/>
  <br/>
  <br/>

# Event Loop in JavaScript

src:- https://www.scaler.com/topics/javascript/event-loop-in-javascript/

<br/>
<br/>
<br/>

# Async Await in JavaScript

src:- https://www.scaler.com/topics/javascript/async-await-javascript/

## Async

- The async keywords stand for asynchronous. It was introduced to solve the issues that were faced by promises. So, async works on Promises.
  The work of async is to make a function work without the need of freezing the complete program.

- The async keyword is used before the function will return a value. Or we can say that it works as resolved/fulfilled in promise.

```javascript
Syntax;

async function Ex() {
  return "Promise";
}
```

Without Await Async will work properly

```javascript
/* Async keyword used before a function */
async function example() {
  return "Resolve";
}

/* if we console.log the function example(),
 we get the result as - 
 Promise {<fulfilled>: 'Resolve'}
*/
/* We use then function to return Promise */
example().then((data) => {
  console.log(data); //Resolve
});
```

## Await

The Await keyword is used inside the async function. The work of await is to wait for the execution thread to wait until the result is resolved and then returns the result. As await is used inside an async function, it only makes it wait, not the complete program.

```javascript
Syntax;

/* It is only used inside async function */
let result = await promise;
```

## Benefits of Using Async Function

There are few benefits or async over promise and the callback function.

1. Code readability - It makes code easy to write and read because async functions can be chained easily using promise.all() makes it easier to read than with plain promises.
2. We can handle errors easily. Errors can be easily handled using try-catch handlers.
3. Async function makes debugging simpler because to the compiler the code looks synchronous.

## Conclusion

1. Async/await works on the concept of Promise. Async defines the fulfillment of a promise and returns a promise.

2. We use async before the function that allows us to return promise-based codes.
3. Await can be used only in async functions. It is used to make the function wait until and unless the promise is resolved or rejected and then returns the result.
4. We use the try...catch method for error handling in async/await.
5. Async/await makes asynchronous code that is easy to read and write.

<br/>
<br/>
<br/>
