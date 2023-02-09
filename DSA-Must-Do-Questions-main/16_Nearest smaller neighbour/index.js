
function NearestSmallerElement(arr, n) {
    let stack = [];
    let ans = [];
    for (let i = 0; i < n; i++) {
        while (stack.length !== 0 && stack[stack.length - 1] >= arr[i]) {
            stack.pop();
        }
        if (stack.length === 0) {
            ans.push(-1)
        } else {
            ans.push(stack[stack.length - 1]);
        }
        stack.push(arr[i]);
    }
    console.log(ans.join(" "));
}
NearestSmallerElement([1, 2, 5, 1, 5], 5);