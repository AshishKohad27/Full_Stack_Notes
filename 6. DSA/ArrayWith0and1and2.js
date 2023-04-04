// Approach 1:- SORT
// SC:_ O(N)/O(1) TC:_O(NlogN);

//Approach 2:- 
//SC:_O(1) TC:_O(N)-->count_0,count_1,count_2 -->rewrite the two loop

//Approach 3:- three pointer

function ArrayWith0and1and2(arr) {
    console.log('arr:', arr)
    let l = 0;
    let m = 0;
    let h = arr.length - 1;

    while (m <= h) {
        switch (arr[m]) {
            case 0: {
                [arr[l], arr[m]] = [arr[m], arr[l]];
                l++;
                m++;
                break;
            }
            case 1: {
                m++;
                break;
            }
            case 2: {
                [arr[m], arr[h]] = [arr[h], arr[m]];
                h--;
                break;
            }
        }
    }
    console.log(arr);
}
let arr = [0, 0, 2, 1, 1, 0, 2, 1, 0];

ArrayWith0and1and2(arr);