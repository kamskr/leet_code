import 'dart:math';

// Must return O(n)
class Solution {
  static int longestConsecutive(List<int> nums) {
    if (nums.length == 0) return 0;

    final set = <int>{};

    set.addAll(nums);
    int longest = 1;

    print(set);
    for (var i = 0; i < nums.length; i++) {
      int offset = 1;
      if (!set.contains(nums[i] - offset)) {
        while (set.contains(nums[i] + offset)) {
          offset++;
        }
        longest = max(longest, offset);
      }
    }

    return longest;
  }
}

void main() {
  final example1 = [100, 4, 200, 1, 3, 2]; // Expected: 4
  final example2 = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]; // Expected 9

  print(Solution.longestConsecutive(example1));
  print(Solution.longestConsecutive(example2));
}
