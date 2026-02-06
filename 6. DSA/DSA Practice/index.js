// Solution class containing removeDuplicates method
class Solution {
  // Removes duplicates using Set and returns count of unique elements
  removeDuplicates(nums) {
    // Set to store unique numbers encountered
    const seen = new Set();

    // Index where next unique element will be placed
    let index = 0;

    // Loop over each number in nums
    for (const num of nums) {
      // If num not already in set, it's unique
      if (!seen.has(num)) {
        // Add num to set
        seen.add(num);

        // Overwrite nums[index] with num
        nums[index] = num;

        // Move index forward
        index++;
      }
    }
    // Return count of unique elements
    return index;
  }
}

// Driver code
let nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
console.log('nums: ', nums);
const sol = new Solution();
let k = sol.removeDuplicates(nums);

console.log("k =", k);
console.log("Array after removing duplicates:", nums.slice(0, k));
