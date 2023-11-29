class Solution {
  bool isPalindrome(String s) {
    final clearedString =
        s.replaceAll(RegExp('[^A-Za-z0-9]'), "").toLowerCase();

    final len = clearedString.length;

    var p1 = 0;
    var p2 = len - 1;

    while (p1 < len) {
      final v1 = clearedString[p1];
      final v2 = clearedString[p2];

      if (v1 != v2) {
        return false;
      }

      p1++;
      p2--;
    }

    return true;
  }
}

void main() {
  final solution = Solution();
  final example1 = 'A man, a plan, a canal: Panama';
  final example2 = 'race a car';

  print(solution.isPalindrome(example1));
  print(solution.isPalindrome(example2));
}
