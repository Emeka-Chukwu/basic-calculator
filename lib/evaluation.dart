class Evaluation {
  String calculateExpression(String expression) {
    var operandIndex, startIndex, endIndex, checkIndex;
    var output = 0.0;
    var numConcate = "";
    var newArray = [];
    var evaluator = [];
    var evaluate = expression;
    // var evaluate = "9((88-9+5)6+7-8)2";

    var splittedStrings = evaluate.split("");
    for (var i = 0; i < splittedStrings.length; i++) {
      if (checkForNumber(splittedStrings[i])) {
        numConcate += splittedStrings[i];
        if (i == splittedStrings.length - 1) {
          evaluator.add(numConcate);
          numConcate = "";
        }
      } else {
        if (numConcate != "") {
          evaluator.add(numConcate);
        }
        evaluator.add(splittedStrings[i]);
        numConcate = '';
      }
    }
    print(evaluator);
    print(newArray);
//     print(splice(evaluator, 0, 0,"55555"));

    // sorting the mathematical expression

    for (var i = 0; i < evaluator.length; i++) {
      if (i != evaluator.length - 1) {
        if (checkForNumber(evaluator[i]) && evaluator[i + 1] == "(") {
          splice(evaluator, i + 1, 0, "x");
        }
      }

      if (i != evaluator.length - 1) {
        if (checkForNumber(evaluator[i + 1]) && evaluator[i] == ")") {
          splice(evaluator, i + 1, 0, "x");
        }
      }
    }

    // sorted the expression for actual evalution
    print(evaluator);
    print("newArraygg");

//   the while loop to determine everything is here for proper evaluation
    while (evaluator.length > 2) {
      print("eme");
      print(evaluator.contains("("));
      if (evaluator.contains("(")) {
        startIndex = evaluator.lastIndexOf("(");
        endIndex = evaluator.indexOf(")", startIndex);
        // splice(evaluator, startIndex, endIndex - startIndex + 1, "checked");
        newArray = evaluator.sublist(startIndex + 1, endIndex);
        splice(evaluator, startIndex, endIndex - startIndex + 1, "checked");
        print(evaluator);
        print(newArray);
        // }

        // break;
        // }
        print(endIndex - startIndex);
        print(newArray);
        print("newArray");
        print("kkkkkkkkkkkkkkkkkkkk");

        while (newArray.length > 1) {
          print(1);
          if (newArray.contains("x")) {
            operandIndex = newArray.indexOf("x");
            output = double.parse(newArray[operandIndex - 1]) *
                double.parse(newArray[operandIndex + 1]);
          } else if (newArray.contains("/")) {
            operandIndex = newArray.indexOf("/");
            output = double.parse(newArray[operandIndex - 1]) /
                double.parse(newArray[operandIndex + 1]);
          } else if (newArray.contains("+")) {
            operandIndex = newArray.indexOf("+");
            if (operandIndex != 1) {
              if (newArray[operandIndex - 2] == "+") {
                output = double.parse(newArray[operandIndex - 1]) +
                    double.parse(newArray[operandIndex + 1]);
              } else {
                output = double.parse(newArray[operandIndex + 1]) -
                    double.parse(newArray[operandIndex - 1]);
                if (double.parse(newArray[operandIndex - 1]) >
                    double.parse(newArray[operandIndex + 1])) {
                  splice(newArray, operandIndex - 2, 1, "+");
                }
              }
            } else {
              output = double.parse(newArray[operandIndex - 1]) +
                  double.parse(newArray[operandIndex + 1]);
            }
          } else if (newArray.contains("-")) {
            operandIndex = newArray.indexOf("-");
            output = double.parse(newArray[operandIndex - 1]) -
                double.parse(newArray[operandIndex + 1]);
          }

          splice(newArray, operandIndex - 1, 3, output.toString());
          print(newArray);
          print(output);
        }
      } else {
        print(evaluator);
        print(
            "eeeeeeeeeeeeeeeeeeellllllllllllllllssssssssssssssseeeeeeeeeeeeeeee");
        newArray = evaluator;
        while (newArray.length > 1) {
          if (newArray.contains("x")) {
            operandIndex = newArray.indexOf("x");
            output = double.parse(newArray[operandIndex - 1]) *
                double.parse(newArray[operandIndex + 1]);
          } else if (newArray.contains("/")) {
            operandIndex = newArray.indexOf("/");
            output = double.parse(newArray[operandIndex - 1]) /
                double.parse(newArray[operandIndex + 1]);
          } else if (newArray.contains("+")) {
            operandIndex = newArray.indexOf("+");
            if (operandIndex != 1) {
              if (newArray[operandIndex - 2] == "+") {
                output = double.parse(newArray[operandIndex - 1]) +
                    double.parse(newArray[operandIndex + 1]);
              } else {
                output = double.parse(newArray[operandIndex + 1]) -
                    double.parse(newArray[operandIndex - 1]);
                if (double.parse(newArray[operandIndex - 1]) >
                    double.parse(newArray[operandIndex + 1])) {
                  splice(newArray, operandIndex - 2, 1, "+");
                }
              }
            } else {
              output = double.parse(newArray[operandIndex - 1]) +
                  double.parse(newArray[operandIndex + 1]);
            }
          } else if (newArray.contains("-")) {
            operandIndex = newArray.indexOf("-");
            output = double.parse(newArray[operandIndex - 1]) -
                double.parse(newArray[operandIndex + 1]);
          }

          splice(newArray, operandIndex - 1, 3, output.toString());
          print(newArray);
          print(output);
        }
      }
      if (evaluator.contains("checked")) {
        checkIndex = evaluator.indexOf("checked");
        splice(evaluator, checkIndex, 1, output.toString());
      } else {
        evaluator = newArray;
      }
      print("checked      fff");
      print(evaluator);
      print(checkIndex);
    }

    print(evaluator);
    return evaluator[0];
  }

  bool checkForNumber(String num) {
    var operandOperator = [
      "1",
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '0',
      '.'
    ];
    print(operandOperator);
    return operandOperator.contains(num);
  }

  List<T> splice<T>(List<T> list, int index,
      [num howMany = 0, /*<T | List<T>>*/ elements]) {
    var endIndex = index + howMany.truncate();
    list.removeRange(index, endIndex >= list.length ? list.length : endIndex);
    if (elements != null)
      list.insertAll(index, elements is List<T> ? elements : <T>[elements]);
    return list;
  }
}
