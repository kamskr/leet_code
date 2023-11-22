class Solution {
  // Binary search
  static double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    // Check if num1 is smaller than num2
    // If not, then we will swap num1 with num2
    if (nums1.length > nums2.length) {
      return findMedianSortedArrays(nums2, nums1);
    }

    final total = nums1.length + nums2.length;
    final half = total / 2;

    final l = 0;
    final r = nums1.length;

    while (l <= r) {}

    return 0;
  }
}

void main() {
  print(Solution.findMedianSortedArrays([1, 3], [2, 5, 10, 11]));
}
