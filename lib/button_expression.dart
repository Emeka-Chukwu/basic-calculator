class ButtonExpression {
  bool dotTaken = false;
  static final operands = ["+", "-", "/", "x"];
  static List<int> operandsIndex = [];
  String addOperandToExpression(String operand, String mathsExpression) {
    if (operands.contains(mathsExpression[mathsExpression.length - 1])) {
      var toArray = mathsExpression.split("");
      toArray[toArray.length - 1] = operand;
      mathsExpression = toArray.join("");
    } else {
      operandsIndex.add(mathsExpression.length);
      mathsExpression += operand;
    }
    dotTaken = false;
    print(mathsExpression);
    return mathsExpression;
  }

  String addDotToExpression(String dot, String mathsExpression) {
    if (!dotTaken) {
      mathsExpression += dot;
      dotTaken = true;
    }
    return mathsExpression;
  }

  String addElementToExpression(String element, String mathsExpression) {
    mathsExpression += element;
    // print(element);

    print(mathsExpression);
    print("maths");
    return mathsExpression;
  }

  String deleteElementFromExpression(String mathsExpression) {
    if (mathsExpression.length > 0) {
      var newMaths = mathsExpression.split("");
      var elementToBeRemoved = mathsExpression[mathsExpression.length - 1];
      newMaths.removeLast();
      mathsExpression = newMaths.join("");

      if (operands.contains(elementToBeRemoved)) {
        if (checkingForDot(mathsExpression)) {
          dotTaken = true;
        } else {
          dotTaken = false;
        }
      }
    }
    if (mathsExpression.length == 0) {
      dotTaken = false;
    }
    print(mathsExpression);
    print(dotTaken);
    return mathsExpression;
  }

  bool checkingForDot(String mathsExpression) {
    if (operandsIndex.length > 0) {
      int startIndex = operandsIndex[operandsIndex.length - 1];
      int endIndex = operandsIndex.length - 1;
      var newList = mathsExpression.split("").sublist(startIndex, endIndex + 1);
      return newList.contains(".");
    } else {
      int endIndex = mathsExpression.length - 1;
      if (endIndex > 0) {
        var newList = mathsExpression.split("").sublist(0, endIndex + 1);
        return newList.contains(".");
      }
    }
    return false;
  }

  String clearExpressionFromScreen(String expression) {
    return expression = "";
  }
}
