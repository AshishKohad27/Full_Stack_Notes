function BalanceParenthesis(str) {
    let obj = {
        ")": "(",
        "}": "{",
        "]": "[",
    };
    let stack = [];
    for (let i = 0; i < str.length; i++) {
        // console.log(str[i]);
        if (stack.length !== 0 && obj[str[i]] === stack[stack.length - 1]) {
            stack.pop();
        } else {
            stack.push(str[i]);
        }
    }
    // console.log("stack:", stack);
    if (stack.length === 0) {
        console.log("Yes");
    } else {
        console.log("No");
    }
}
BalanceParenthesis("[()]{}");
BalanceParenthesis("[()]{}]");
BalanceParenthesis("[(])");
BalanceParenthesis("()");
BalanceParenthesis("())");
