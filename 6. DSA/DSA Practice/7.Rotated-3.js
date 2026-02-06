// Right Rotation ✅
function rightReverseMethod(arr, k) {
  let n = arr.length;
  k = k % n; // handle cases where k > n

  function reverse(arr, start, end) {
    while (start < end) {
      let temp = arr[start];
      arr[start] = arr[end];
      arr[end] = temp;
      start++;
      end--;
    }
  }

  // 1. Reverse the entire array
  reverse(arr, 0, n - 1);

  // 2. Reverse first k elements
  reverse(arr, 0, k - 1);

  // 3. Reverse the remaining elements
  reverse(arr, k, n - 1);
}

// Left Rotation ✅
function leftReverseMethod(arr, k) {
  let n = arr.length;
  k = k % n; // handle cases where k > n

  function reverse(arr, start, end) {
    while (start < end) {
      let temp = arr[start];
      arr[start] = arr[end];
      arr[end] = temp;
      start++;
      end--;
    }
  }

  // 1. Reverse first k elements
  reverse(arr, 0, k - 1);

  // 2. Reverse the remaining elements
  reverse(arr, k, n - 1);

  // 3. Reverse the entire array
  reverse(arr, 0, n - 1);
}

let nums = [1, 2, 3, 4, 5, 6, 7];
rightReverseMethod(nums, 3);
console.log(nums); // ✅ [5,6,7,1,2,3,4]
