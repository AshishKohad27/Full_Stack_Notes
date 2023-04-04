//Approach 1
// sort algorithm 

//Approach 2
// count_0, count_1-->rewrite array -->TC:_O(N) SC:_O(1);

//Approach 3 :- two pointer 
//TC:_O(N) SC:_O(1);
function ArrayWith0and1(arr) {
    let l = 0;
    let r = arr.length - 1;

    while (l < r) {

        while (arr[l] === 0 && l < r) { // checking any 1 from left side if yes then we stored l value
            l++;
        }
        while (arr[r] === 1 && l < r) { // checking any 0 from right side if yes then we stored r value
            r--;
        }
        if (l < r) { // then here we just give 0 to l and r to 1 and l++ r--; 
            arr[l] = 0;
            arr[r] = 1;
            l++;
            r--;
        }
    }
    console.log(arr);
}
let arr = [1, 1, 0, 1, 0, 0, 0, 1];
ArrayWith0and1(arr);