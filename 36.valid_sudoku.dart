class Solution {
  static bool isValidSudoku(List<List<String>> board) {
    Set<int> rows = {};
    Set<int> columns = {};

    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        final rowValue = int.tryParse(board[i][j]);
        final colValue = int.tryParse(board[j][i]);

        if (rowValue != null) {
          if (rows.contains(rowValue)) {
            return false;
          }

          rows.add(rowValue);
        }
        if (colValue != null) {
          if (columns.contains(colValue)) {
            return false;
          }
          columns.add(colValue);
        }
      }

      rows.clear();
      columns.clear();
    }

    // 0,0; 3,0; 6,0
    // 3,0; 3,3 3,6
    // 6,0 ,6,3 6,6

    for (var i = 0; i <= 6; i += 3) {
      for (var j = 0; j <= 6; j += 3) {
        final check = validateBlock(board, i, j);
        if (check == false) {
          return false;
        }
      }
    }

    return true;
  }

  static bool validateBlock(List<List<String>> board, int startX, int startY) {
    Set<int> values = {};

    for (var i = startX; i < startX + 3; i++) {
      for (var j = startY; j < startY + 3; j++) {
        final val = int.tryParse(board[i][j]);

        if (val != null) {
          if (values.contains(val)) {
            return false;
          }

          values.add(val);
        }
      }
    }

    return true;
  }
}

void main() {
  final correct = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];

  final incorrect = [
    ["8", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];

  final failing = [
    [".", ".", ".", ".", "5", ".", ".", "1", "."],
    [".", "4", ".", "3", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "3", ".", ".", "1"],
    ["8", ".", ".", ".", ".", ".", ".", "2", "."],
    [".", ".", "2", ".", "7", ".", ".", ".", "."],
    [".", "1", "5", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "2", ".", ".", "."],
    [".", "2", ".", "9", ".", ".", ".", ".", "."],
    [".", ".", "4", ".", ".", ".", ".", ".", "."]
  ];

  print(Solution.isValidSudoku(correct));
  print(Solution.isValidSudoku(incorrect));
  print(Solution.isValidSudoku(failing));
}
