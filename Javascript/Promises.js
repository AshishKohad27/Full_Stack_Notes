function firstPromise() {
  let myPromise = new Promise((resolve, reject) => {
    let getCondition = true;
    if (getCondition) {
      resolve("Getting data from Response");
    } else {
      reject("Not getting data");
    }
  });

  myPromise
    .then((data) => console.log(data))
    .catch((error) => console.log(error));
}

function delayInPromises() {
  function sleep(delay) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve("Print after 3 sec");
      }, delay);
    });
  }

  sleep("3000")
    .then((res) => console.log(res))
    .catch((e) => console.log(e));
}

function PromiseAll() {
  // Creating 3 promises
  //promise All:- Promise.all() resolves when all the promises resolve.
  const firstPromise = 60;
  const secondPromise = Promise.resolve(25);
  const thirdPromise = new Promise((resolve, reject) => {
    if (false) {
      setTimeout(resolve, 100, "Resolved!");
    } else {
      reject("Got an Error");
    }
  });

  Promise.all([firstPromise, secondPromise, thirdPromise])
    .then((values) => {
      console.log(values);
    })
    .catch((e) => console.log(e));
  // expected output: Array [60, 25, "Resolved!"]
}

// Promise.allSettled() resolves when all the promises settle, i.e., either fulfill or get rejected.
function allSettled() {
  // Creating 3 promises
  const firstPromise = 60;
  const secondPromise = Promise.resolve(25);
  const thirdPromise = new Promise((resolve, reject) => {
    setTimeout(reject, 100, "Rejected");
  });

  Promise.allSettled([firstPromise, secondPromise, thirdPromise]).then(
    (results) => results.forEach((result) => console.log(result))
  );
  // expected output:
  // "fulfilled"
  // "fulfilled"
  // "rejected"
}
// allSettled();

function PromiseAny() {
  // Promise.any(iterable) This method takes an iterable of promises, 
  // and as soon as one of the promises gets resolved, it gets resolved 
  // with the value of the first resolved promise.
  // Creating 3 promises
  const firstPromise = new Promise((resolve, reject) => {
    setTimeout(reject, 1000, "Rejected");
  });
  const secondPromise = new Promise((resolve, reject) => {
    setTimeout(resolve, 2000, "Four");
  });
  const thirdPromise = 60;
  const fourPromises = Promise.resolve(25);

  Promise.any([firstPromise, secondPromise, thirdPromise, fourPromises]).then(
    (results) => console.log(results)
  );
  // expected output:
  // "fulfilled"
  // "fulfilled"
  // "rejected"
}
PromiseAny();


function PromiseRace() {
  let firstPromise = new Promise((resolve, reject) => {
    setTimeout(() => { resolve("First Promises of delay 1000") }, 1000);
  })

  let secondPromise = new Promise((resolve, reject) => {
    setTimeout(() => { resolve("Second Promises of delay 2000") }, 2000);
  })
  Promise.any([secondPromise, firstPromise])
    .then((res) => console.log(res))
    .catch((err) => console.log(err))

  // Both resolve, but firstPromises is faster
  // expected output: "First Promises of delay 1000"

  //In any sequence matter but in race sequence not matter
}
PromiseRace();

function FetchAndPromises() {
  //in real life
  let fetchPromises = fetch(`https://salmon-jackrabbit-boot.cyclic.app/user`);
  // console.log("fetchPromises:", fetchPromises);
  fetchPromises
    .then((res) => {
      console.log("res:", res);
      return res.json();
    })
    .then((data) => console.log("data:", data))
    .catch((err) => console.log(err))
    .finally(console.log("Finally Done"));
}
