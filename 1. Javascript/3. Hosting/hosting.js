/*
## "The javascript mechanism in which variables and function declarations are 
moved to the top of their scope before execution of the code is called as Hoisting."


## Execution context:
   --> Global Executing Context
   --> Local Executing Context

   Executing Phases
   1. Creation Phase
   2. Execution Phase

   State in hosting
   1. Declaration
   2. Initialization
   3. Assignment

   Variable Life Cycle
   1. var 
   2. let
   3. const
*/





//phase

//creation phase
// 1. Declaration -->name

// ---> TDZ <---

//execution phase
// 2. Initialization --->undefined   // 3. Assignment 






// console.log(name)
// let name = "ashish";




function example1() {
   console.log("example1")
   //
   var x = 10;
   function foo() {
      console.log(x) // 10
   }
   function bar() {
      var x = 5;
      foo();
   }
   bar();
   //
   console.log("example1")
}
// example1();

function example2() {
   console.log("example2")
   function outer() {
      var x = 10;
      return function () {
         console.log(x);
      }
   }
   var foo = outer();
   var x = 5;
   foo();
   console.log("example2")
}
// example2();

function example3() {
   console.log("example3")
   var variable = 10;
   (() => {
      console.log(variable);   // undefined
      var variable = 20;
      console.log(variable);   // 20
   })();

   console.log(variable);
   var variable = 30;
}
// example3();

function example4() {
   console.log("example4")
   var variable = 10;
   (() => {
      variable_3 = 35;
      console.log(variable_3);//35
      var variable_3 = 45;
      variable_2 = 15;
      console.log(variable);   // 10
   })();

   console.log(variable_2);//15
   console.log(variable_3);// not defined
   var variable = 30;
   console.log("example4")
}
// example4();


function example5() {
   console.log("example5")
   var x = 10;
   function outer() {
      var x = 5
      function inner() {
         console.log(x);
      }
      return inner;
   }
   var foo = outer();
   foo();
   console.log("example5")
}
// example5();

function example6() {
   console.log("example6")

   function outer() {
      var x = 5;
      return function () {
         console.log(x);
         x++;
      }
   }

   var closureFun = outer();
   closureFun();//5
   closureFun();//6
   closureFun();//7
   console.log("example6")
}
// example6();


function example7() {
   console.log("example7")
   function outer(x) {
      return function (y) {
         return x + y;
      }
   }
   var clouserFun1 = outer(3);
   var clouserFun2 = outer(5);
   console.log(clouserFun1(2)) //5
   console.log(clouserFun2(2))// 7
   console.log("example7")
}
// example7();

function example8() {
   console.log("example8");
   function outer() {
      var x = 1;
      return function inner(y) {
         console.log(x + y);
         x++;
      }
   }
   var closureFun = outer();
   closureFun(2)//3
   closureFun(3)//5
   console.log("example8");
}
example8()