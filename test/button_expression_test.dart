import 'package:calculator/button_expression.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockButtonExpression extends Mock implements ButtonExpression {}

void main() {
  MockButtonExpression mockButtonExpression;
  ButtonExpression bt;

  setUp(() {
    mockButtonExpression = MockButtonExpression();
    bt = ButtonExpression();
  });
  group("button_expression_testing", () {
    String addDotToCaseOne = "22.87+22.8";
    String addDotToCaseTwo = "2287+8";
    String addDotToCaseThree = "223.9";
    String expectedOne = "22.87+22.8";
    String expectedTwo = "2287+8.";
    String expectedThree = "223.9";
    test("Adding dot to the screen expresion case 1", () {
      when(mockButtonExpression.addDotToExpression(".", addDotToCaseOne))
          .thenReturn(expectedOne);

      // arrange
      bt.dotTaken = true;
      final caseOne = bt.addDotToExpression(".", addDotToCaseOne);
      print(caseOne);
      // assert
      expect(expectedOne, caseOne);
    });

    // another case

    test("Adding dot to the screen expresion case 3", () {
      when(mockButtonExpression.addDotToExpression(".", addDotToCaseThree))
          .thenReturn(expectedThree);
      bt.dotTaken = true;
      // arrange
      final caseThree = bt.addDotToExpression(".", addDotToCaseThree);
      // assert
      expect(expectedThree, caseThree);
    });

    test("Adding dot to the screen expresion case 2", () {
      when(mockButtonExpression.addDotToExpression(".", addDotToCaseTwo))
          .thenReturn(expectedTwo);

      // arrange
      bt.dotTaken = false;
      final caseTwo = bt.addDotToExpression(".", addDotToCaseTwo);
      // assert
      expect(expectedTwo, caseTwo);
    });
  });

  group("button_expression_testing", () {
    String deleteElement = "22.87+22.898";

    String expectedResult = "22.87+22.89";
    test("Delete element from screen expression", () {
      when(mockButtonExpression.deleteElementFromExpression(deleteElement))
          .thenReturn(expectedResult);

      // arrange
      final result = bt.deleteElementFromExpression(deleteElement);
      // assert
      expect(expectedResult, result);
    });
  });

  group("button_expression_testing", () {
    String deleteElement = "22.87+22.898";

    String expectedResult = "22.87+22.89";
    test("Delete element from screen expression", () {
      when(mockButtonExpression.deleteElementFromExpression(deleteElement))
          .thenReturn(expectedResult);

      // arrange
      final result = bt.deleteElementFromExpression(deleteElement);
      // assert
      expect(expectedResult, result);
    });
  });

  group("button_expression_testing adding operand", () {
    String case1 = "22+8+9";
    String case2 = "22+8+9+";
    String case3 = "22+8+9+";

    String addingPlusToCase1 = "22+8+9+";
    String addingMinusToCase2 = "22+8+9-";
    String addingPlusToCase3 = "22+8+9+";

    test("adding (+) to the screen expression 22+8+9 ", () {
      when(mockButtonExpression.addOperandToExpression("+", case1))
          .thenReturn(addingPlusToCase1);

      // arrange
      final result = bt.addOperandToExpression("+", case1);
      // assert
      expect(addingPlusToCase1, result);
    });

    test("adding (-) to the screen expression 22+8+9+ ", () {
      when(mockButtonExpression.addOperandToExpression("-", case2))
          .thenReturn(addingMinusToCase2);

      // arrange
      final result = bt.addOperandToExpression("-", case2);
      print(result);
      print(addingMinusToCase2);
      // assert
      expect(addingMinusToCase2, result);
    });

    test("adding (+) to the screen expression 22+8+9+ ", () {
      when(mockButtonExpression.addOperandToExpression("+", case3))
          .thenReturn(addingPlusToCase3);

      // arrange
      final result = bt.addOperandToExpression("+", case3);
      // assert
      expect(addingPlusToCase3, result);
    });
  });

  test("adding numbers (9) to the screen expression", () {
    String expression = "223+334";
    String actualResult = "223+3349";

    when(mockButtonExpression.addElementToExpression("9", actualResult))
        .thenReturn(actualResult);

    //arrange
    final result = bt.addElementToExpression("9", expression);

    // assert
    expect(actualResult, result);

    //
  });
}
