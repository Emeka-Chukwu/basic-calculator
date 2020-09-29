import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:calculator/evaluation_calc.dart';

class MockEvaluation extends Mock implements EvaluationCalc {}

void main() {
  MockEvaluation mockEvaluation;
  EvaluationCalc evaluation;

  setUp(() {
    mockEvaluation = MockEvaluation();
    evaluation = EvaluationCalc();
  });
  group("Final Evalution of the screen expression", () {
    String case1 = "((4+6)+9x8)";
    String case2 = "6x5+9x4+7";
    String case3 = "9((88-9+5)6+7-8)2";
    String actual1 = "82.0";
    String actual2 = "73.0";
    String actual3 = "9054.0";
    test("The final screen expression calculation ((4+6)+9x8)", () {
      when(mockEvaluation.calculateExpression(case1)).thenReturn(actual1);

      // arrange
      final result = evaluation.calculateExpression(case1);

      //assert
      expect(actual1, result);
    });

    test("The final screen expression calculation 6x5+9x4+7", () {
      when(mockEvaluation.calculateExpression(case2)).thenReturn(actual2);

      // arrange
      final result = evaluation.calculateExpression(case2);

      //assert
      expect(actual2, result);
    });

    test("The final screen expression calculation  9((88-9+5)6+7-8)2", () {
      when(mockEvaluation.calculateExpression(case3)).thenReturn(actual3);

      // arrange
      final result = evaluation.calculateExpression(case3);

      //assert
      expect(actual3, result);
    });
  });
}
