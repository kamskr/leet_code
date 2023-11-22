class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final outputMap = <String, List<String>>{};

    for (int i = 0; i < strs.length; i++) {
      final text = strs[i];
      final counts = List.filled(26, 0);

      // Comparing unix values to find index
      for (int j = 0; j < text.length; j++) {
        counts[text.codeUnitAt(j) - 'a'.codeUnitAt(0)]++;
      }

      final key = counts.toString();
      if (outputMap.containsKey(key)) {
        outputMap[key] = outputMap[key]!..add(strs[i]);
      } else {
        outputMap[key] = [strs[i]];
      }
    }

    return outputMap.values.toList();
  }
}

void main(List<String> args) {
  final solution = Solution();
  final input = ["eat", "tea", "tan", "ate", "nat", "bat"];
  final output = solution.groupAnagrams(input);
  print(output);
}
