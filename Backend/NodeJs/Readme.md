Here some questions to ponder on till then
# 0. How Node.js overcome the problem of blocking of I/O operations ?
src:- https://www.geeksforgeeks.org/how-node-js-overcome-the-problem-of-blocking-of-i-o-operations/
# 1. What is non-blocking vs blocking?

Overview of Blocking vs Non-Blocking:-(https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/)

## Blocking

- When javascript execution in Node.js process (each program is a process) has to wait until a non-javascript operation completes is called blocking.

```javascript
function doTask1(){
 const users = getAllUsers() 
 // do something with users here
}

function doTask2(){
 const services = getAllServices()
 // do something with services here
}

// perform some task
doTask1()
doTask2()
```
- In this example, doTask1 internally calls getAllUser which makes the database connection and fetch the list of users. Also, doTask2 internally calls getAllServices which makes an HTTP request to get the list of available services of some 3rd party through their API.

- Here doTask2 will be blocked till doTask1 returns because a single thread can execute only one thing at a time.

```javascript
Synchronous file read:

const fs = require('fs');
const data = fs.readFileSync('/file.html'); // blocks here until file is read
console.log(data);
doSomethingElse(); // will run after console.log
```

## Non-Blocking

- This is the opposite of the blocking i.e. javascript execution do not wait until the non-javascript operation completes.

- Non-Javascript execution refers to mainly I/O operations. So, in the nutshell, I/O operations are blocking.

- I/O refers primarily to the interaction with the system's disk and network.

- When one of these operations completes, the kernel notifies Node.js and then the appropriate callback is eventually executed.
```javascript
function doTask1() {
  const users = getAllUsers((err, data) => {
    // do something with users here
  });
}

function doTask2() {
  const services = getAllServices((err, data) => {
    // do something with services here
  });
}

// perform some task
doTask1();
doTask2();
```

- Here, getAllUsers and getAllServices now take callbacks. These callbacks are then used by the Node.js and called when the Kernel is finished with the I/O operations.

src:- https://janisharali.com/blog/blocking-and-non-blocking-in-node-js-asynchronous-operations-and-callbacks

```javascript
Asynchronous file read:

const fs = require('fs');
fs.readFile('/file.html', (err, data) => {
 if (err) throw err;
 console.log(data);
});
doSomethingElse(); // will run before console.log
```

# 1. What is throughput?

# 1. what is the difference between readFile and readFileSync

-sync and async

# 1. How can you make a network request using http module?

# 1. [https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/](https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/)

# 1. How to create a web server without express?

src:- https://dev.to/yoshiohasegawa/creating-a-node-server-without-express-5dg9#:~:text=const%20http%20%3D%20require

# 1. What is libuv?

# 1. What are the different phases involved in event loop?

# 1. • [The Node.js Event Loop, Timers, and `process.nextTick()`](https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/)

# 1. • [Don't Block the Event Loop (or the Worker Pool)](https://nodejs.org/en/docs/guides/dont-block-the-event-loop/)

# 1. What are timers in Node.js?

# 1. • [Timers in Node.js](https://nodejs.org/en/docs/guides/timers-in-node/)

# 1. What is NVM? how do you use it?

# 1. What is common.js? how is it different from es modules?

# 1. How does the crypto module work?

# 1. What are web sockets?

src:- https://www.geeksforgeeks.org/web-socket-in-node-js/

# 1. What are microservices?

# 1. Creating a CLI based app using Node.js and publish it
