class Solution {
  static List<int> twoSum(List<int> numbers, int target) {
    int p1 = 0;
    int p2 = numbers.length - 1;

    while(p1 != p2) {
      final number1 = numbers[p1];    
      final number2 = numbers[p2 ];    
      final sumOfNumbers = number1 + number2;


      if(sumOfNumbers > target) {
        p2--;
      } else if(sumOfNumbers < target){
        p1++;
      } else {
        break;
      }
    } 

    return [p1 + 1, p2 + 1];
  }
}

void main(List<String> args) {
  print(Solution.twoSum([2, 7, 11, 15], 9));
  print(Solution.twoSum([2, 3, 4], 6));
  print(Solution.twoSum([-1, 0], -1));
  print(Solution.twoSum([5, 25, 75], 100));
}
