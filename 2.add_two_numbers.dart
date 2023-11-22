/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    if (l1 == null || l2 == null) {
      return l1 ?? l2 ?? null;
    }

    var result = ListNode(-1);
    ListNode? temp = result;

    int carry = 0;

    while (l1 != null || l2 != null) {
      int sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry;
      carry = sum ~/ 10;
      sum = sum % 10;

      if (result.val == -1) {
        result.val = sum;
      } else {
        temp?.next = ListNode(sum);
        temp = temp?.next;
      }

      l1 = l1?.next;
      l2 = l2?.next;
    }

    if (temp != null && carry > 0) {
      temp.next = ListNode(carry);
    }

    return result;
  }
}

void main() {
  final solution = Solution();
  final l1 = ListNode(5, ListNode(6));
  final l2 = ListNode(5, ListNode(4, ListNode(9)));
  final result = solution.addTwoNumbers(l1, l2);
  print('${result?.val}${result?.next?.val}${result?.next?.next?.val}');
}
