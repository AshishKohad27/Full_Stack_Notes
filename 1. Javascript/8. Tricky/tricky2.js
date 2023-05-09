//1.
function Falsely() {
    console.log(0.1 + 0.2 == 0.3); // false
    // False: Why? 
    /*
    The expression 0.1 + 0.2 == 0.3 evaluates to false when executed in JavaScript.
    
    This might be surprising to some people, as one would expect that adding 0.1 and 0.2 together would result in the value 0.3, which would make the expression true.
    
    However, due to the way that floating-point arithmetic works in computers, it is not always possible to represent decimal numbers with perfect accuracy. This can lead to rounding errors that can cause unexpected behavior.
    
    In the case of 0.1 + 0.2, the result of the addition is not exactly equal to 0.3, but rather a slightly larger number, which when compared to 0.3 using the == operator, returns false.
    
    To perform a more accurate comparison, one could use the Math.abs() function to check the absolute difference between the two numbers is less than a certain threshold, for example:
    
    javascript
    Copy code
    Math.abs(0.1 + 0.2 - 0.3) < Number.EPSILON // true
    The Number.EPSILON constant represents the smallest representable difference between two floating-point numbers in JavaScript, and is commonly used to check for near equality.
    */
}

//2.
console.log(typeof typeof 1); //String;

//3.
function maxly() {
    console.log(Math.max()); //-infinity;
    /*
    When the Math.max() function is called with no arguments, it returns -Infinity.
    
    This is because the Math.max() function is used to find the maximum value from a list of numbers passed as arguments. When no arguments are provided, there are no values to compare and the function returns -Infinity by default.
    
    Here's an example:
    
    javascript
    Copy code
    console.log(Math.max(2, 4, 6)); // Output: 6
    console.log(Math.max()); // Output: -Infinity
    In the first example, Math.max() is called with three arguments 2, 4, and 6, and returns 6, which is the largest number among the arguments.
    
    In the second example, Math.max() is called with no arguments, so it returns -Infinity.
    */
}

//4.
function greatedthan() {
    console.log(5 < 6 < 7); // true 
    console.log(7 > 6 > 5); // false
    /*
    
   The output of the two expressions console.log(5 < 6 < 7); and console.log(7 > 6 > 5); may be surprising to some people.
   
   The first expression console.log(5 < 6 < 7); evaluates to true. This is because the comparison operators are evaluated from left to right, so 5 < 6 returns true, which is then coerced into the number 1, and then 1 < 7 also returns true.
   
   The second expression console.log(7 > 6 > 5); evaluates to false. This is because the comparison operators are still evaluated from left to right, so 7 > 6 returns true, which is then coerced into the number 1, and then 1 > 5 returns false.
   
   To avoid confusion and unexpected behavior when using chained comparison operators, it's important to be aware of how JavaScript evaluates these expressions. It's usually a good practice to use parentheses to explicitly group the comparisons in the desired order.
   
   For example:
   
   scss
   Copy code
   console.log((5 < 6) && (6 < 7)); // Output: true
   console.log((7 > 6) && (6 > 5)); // Output: true
   In the above examples, the parentheses ensure that the comparisons are evaluated in the correct order and the expected results are produced.
    */
    /*
     why 1
 ChatGPT
 I apologize for any confusion caused by my previous response.
 
 In the expression 5 < 6 < 7, the reason why true is ultimately coerced into the number 1 is because of how JavaScript handles the order of operations when evaluating the expression.
 
 When this expression is evaluated, the first comparison 5 < 6 is evaluated first. This comparison is true, since 5 is less than 6. JavaScript then evaluates the second comparison true < 7. In this case, since true is a boolean value and not a number, JavaScript coerces it into a number before performing the comparison. When a boolean value is coerced into a number, true is converted to 1 and false is converted to 0.
 
 So in this case, true is coerced into the number 1, and the expression is effectively reduced to 1 < 7, which is also true, since 1 is less than 7. Therefore, the overall result of the expression is true.
 */
}

//5.
function postIncrement() {
    let x = 1;
    y = x++;
    console.log(x);//2
    console.log(y);//1

    let z = 1;
    z = z++;//postIncrement
    console.log(z); // since we stored postIncrement valuein z thats why it give 1;
}

//6.
console.log(typeof []); // object

//7.
function toStringMethod() {
    console.log([] + []);//""
    /*
    When you use the + operator with two empty arrays [], JavaScript converts them to strings and concatenates them together, resulting in an empty string "".
    
    Here's what happens step by step:
    
   1. JavaScript tries to evaluate the expression [] + [].
   2. Since the + operator is used with two arrays, JavaScript tries to convert the arrays to primitives before adding them together.
   3. To convert the arrays to primitives, JavaScript calls their toString() method.
   4. An empty array [] is converted to an empty string "".
   5. So [] + [] is effectively the same as "" + "", which results in an empty string "".
   6. Therefore, when you run console.log([] + []);, the output will be an empty string "".
    */
}

//8.
function PostIncrement2() {
    let x = 10;
    let y = (x++, x + 5);
    console.log(x); //11
    console.log(y); //16

}

//9.
function NotANumber() {
    console.log(NaN == NaN); //false
    console.log(NaN === NaN); //false
    /*
    
The output of console.log(NaN == NaN) will be false, and the output of console.log(NaN === NaN) will also be false.

In JavaScript, NaN (which stands for "Not a Number") is a special value that represents the result of an undefined or unrepresentable mathematical operation, such as 0/0 or Math.sqrt(-1).

However, NaN is not equal to any other value in JavaScript, including itself. This means that comparing NaN with any other value, including NaN itself, will always return false.

This is why both console.log(NaN == NaN) and console.log(NaN === NaN) both return false.

If you need to check if a value is NaN, you can use the isNaN() function. For example:

javascript
Copy code
console.log(isNaN(NaN)); // Output: true
console.log(isNaN(0/0)); // Output: true
console.log(isNaN("hello")); // Output: true
console.log(isNaN(42)); // Output: false
In the above example, the isNaN() function returns true for values that are NaN, and false for values that are not NaN.
    */
}

//10.
function stringly() {
    console.log("foo" === "foo"); //true
    console.log(new String("foo") === "foo"); //false
    console.log("new String(foo):", new String("foo")); // [String: 'foo']
    console.log(new String("foo") === new String("foo")); //false

    /*
    The first comparison returns true because "foo" is equal to "foo". The second comparison 
    returns false because the types are different, even though the values are the same. The third 
    comparison returns false because the two objects are different instances.
    */
}
