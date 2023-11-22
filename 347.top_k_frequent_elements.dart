class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final countsMap = <int, int>{};

    for (int i = 0; i < nums.length; i++) {
      if (countsMap.containsKey(nums[i])) {
        countsMap[nums[i]] = countsMap[nums[i]]! + 1;
      } else {
        countsMap[nums[i]] = 1;
      }
    }

    final sortedCounts = countsMap.entries.toList()
      ..sort((a, b) => b.value - a.value);

    return sortedCounts.take(k).map((e) => e.key).toList();
  }
}

void main(List<String> args) {
  final solution = Solution();
  final input = [1, 1, 1, 2, 2, 3];
  final output = solution.topKFrequent(input, 2);
  print(output);
}
