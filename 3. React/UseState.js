
function mockUseState(initialValue) {
    let value = initialValue; // block scope:- because of this our code or obj 
    // is not mutable because we have not set our value globally

    const getValue = () => {
        return value;
    }; // this is the only way to update our value

    const setValue = (val) => {
        value = val;
    }; // this is only way to SET value from code

    return [getValue, setValue];
}

// mockUseState(0)--> it return this [value,getValue,setValue] so we can destructure
let [getValue, setValue] = mockUseState(120); //initial value
// value = value + 1;// we can;t update this from outside we need this to be update from
//  inside only and that keep away from bugs

setValue(getValue() + 800); //--> internally we update only by setValue;
// console.log('value:', value)
console.log(getValue()); //--> only way to getValue from function vai getValue;
// console.log(getValue()); //--> only way to getValue from function vai getValue;

//original state
// [todo,setTodo]=useState(0);
//same thing happened over here only change or update our value is setTodo or todo
//1 . so instead of doing all that thing react give us this flexibility react done for us.
//2. react get help from clouser to set data or get data from react
//3. first element:- state
//4. second element:- function which updates that state this is the only way;
//5. use_State:- it is parent function and inside this two child function;