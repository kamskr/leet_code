class Solution {
  String encode(List<String> strs) {
    String encoded = '';

    if (strs.length == 0) {
      return encoded;
    }

    for (var i = 0; i < strs.length; i++) {
      final element = strs[i];
      final length = element.length;

      final encodedValue = '$length#$element';
      encoded = '$encoded$encodedValue';
    }

    // write your code here
    return encoded;
  }

  List<String> decode(String str) {
    var decoded = <String>[];

    if (str == '') {
      return decoded;
    }

    var startingIndex = 0;

    while (startingIndex < str.length) {
      var countString = '';

      while (str[startingIndex] != '#') {
        countString = '$countString${str[startingIndex]}';
        startingIndex++;
      }

      final charactersCount = int.tryParse(countString) ?? 0;

      startingIndex++;

      var value = '';

      if (charactersCount == 0) {
        decoded.add(value);
        continue;
      }

      final initialStartingIndex = startingIndex;

      for (var i = initialStartingIndex;
          i < (initialStartingIndex + charactersCount);
          i++) {
        value = '$value${str[i]}';
        startingIndex++;
      }

      decoded.add(value);
    }

    return decoded;
  }
}

void main() {
  var example1 = ["hello", "world", "leetcode"];
  testEncodeDecode(example1);

  var example2 = ["abc", "123", "xyz"];
  testEncodeDecode(example2);

  var example3 = ["", "test", ""];
  testEncodeDecode(example3);

  var example4 = ["apple", "orange", "banana", "grape"];
  testEncodeDecode(example4);

  var example5 = ["12345", "67890"];
  testEncodeDecode(example5);

  var example6 = ["", "", ""];
  testEncodeDecode(example6);

  var example7 = ["python", "java", "cpp"];
  testEncodeDecode(example7);

  var example8 = ["a", "b", "c", "d"];
  testEncodeDecode(example8);

  var example9 = ["open", "ai", "gpt", "3"];
  testEncodeDecode(example9);

  var example10 = ["test"];
  testEncodeDecode(example10);

  var example11 = <String>[];
  testEncodeDecode(example11);

  var example12 = ["abc", "", "123", "xyz"];
  testEncodeDecode(example12);

  var example13 = ["programming", "coding", "challenge"];
  testEncodeDecode(example13);

  var example14 = ["", "hello", "", "world", ""];
  testEncodeDecode(example14);

  var example15 = ["a", "", "b", "", "c"];
  testEncodeDecode(example15);

  var example16 = ["apple", "banana", "cherry"];
  testEncodeDecode(example16);

  var example17 = ["a", "bb", "ccc", "dddd"];
  testEncodeDecode(example17);

  var example18 = ["leetcode", "is", "fun"];
  testEncodeDecode(example18);

  var example19 = ["", "", "", ""];
  testEncodeDecode(example19);

  var example20 = ["123", "456", "789", "0"];
  testEncodeDecode(example20);
}

void testEncodeDecode(List<String> input) {
  var solution = Solution();
  var encoded = solution.encode(input);
  var decoded = solution.decode(encoded);

  final result = input.toString() == decoded.toString();
  if (result == true) {
    return;
  }

  print("Original: $input");
  print("Encoded: $encoded");
  print("Decoded: $decoded");
  print("Match: ${result}");
  print("--------");
}
