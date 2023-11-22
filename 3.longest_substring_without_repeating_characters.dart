class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.isEmpty) {
      return 0;
    }
    Set charSet = {};
    var l = 0;
    int result = 1;

    for (int i = 0; i < s.length; i++) {
      print(charSet);
      while (charSet.contains(s[i])) {
        charSet.remove(s[l]);

        l++;
      }

      charSet.add(s[i]);
      final subLength = i - l + 1;
      result = result > subLength ? result : subLength;
    }

    return result;
  }
}
