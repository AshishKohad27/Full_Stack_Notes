src:- https://www.freecodecamp.org/news/understand-call-apply-and-bind-in-javascript-with-examples/

# Call

- Call is a function that helps you change the context of the invoking function. In layperson's terms, it helps you replace the value of this inside a function with whatever value you want.

```javascript
// syntax
func.call(thisObj, args1, args2, ...)

// func:- is a function that needs to be invoked with a different this object, Note that if you invoke a function without any thisObj argument, then JavaScript considers this property to be a global object.

// thisObj:- is an object or a value that needs to be replaced with the this keyword present inside the function func

// args1, args2:-  are arguments that are passed to the invoking function with the changed this object.
```

# Apply

- Apply is very similar to the call function. The only difference is that in apply you can pass an array as an argument list.

```javascript
// syntax
1. func.apply(thisObj, argumentsArray);
2. func.apply(thisObj, [args1, args2, ...]);
3. func.apply(thisObj, new Array(args1, args2));
// func:-  is a function that needs to be invoked with a different this object

// thisObj:- is an object or a value that needs to be replaced with the this keyword present inside the function func

// argumentsArray:- can be an array of arguments, array object, or the arguments keyword itself.
```

# Bind

- Bind is a function that helps you create another function that you can execute later with the new context of this that is provided.

```javascript
// syntax
func.bind(thisObj, arg1, arg2, ..., argN);

//func is a function that needs to be invoked with a different this object

//thisObj is an object or a value that needs to be replaced with the this keyword present inside the function func

//arg1, arg2…argN – you can pass 1 argument to the calling function or more than that, similar to the call function.
```

### Example

src:-https://codesandbox.io/s/bind-1ir118?file=/src/Hover.jsx
