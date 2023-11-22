class Solution {
  /// prefix and suffix.
  List<int> productExceptSelf(List<int> nums) {
    final result = List.filled(nums.length, 1);

    for (int i = 1; i < nums.length; i++) {
      result[i] = nums[i - 1] * result[i - 1];
    }

    var postfix = 1;

    for (int i = nums.length - 1; i >= 0; i--) {
      result[i] *= postfix;
      postfix *= nums[i];
    }

    return result;
  }
}

void main(List<String> args) {
  final solution = Solution();
  final input = [1, 2, 3, 4];

  // [1,1,2, 6]

  // [24,12,4,1]
  // [24, 12, 8, 6]
  final output = solution.productExceptSelf(input);
  print(output);
}
