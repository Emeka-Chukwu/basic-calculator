import 'package:calculator/button_expression.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/evaluation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screenExpression = '';
  String evaluatedExpression = "";
  Evaluation evaluation = Evaluation();
  ButtonExpression btn = ButtonExpression();
  Widget numberBtns(BuildContext context, String text, String expressionm) =>
      GestureDetector(
        onTap: () {
          setState(() {
            screenExpression =
                btn.addElementToExpression(text, screenExpression);
          });
        },
        child: Container(
          width: 30,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: white,
            ),
          ),
        ),
      );

  Widget operandsBtns(BuildContext context, String text, String expression) =>
      GestureDetector(
        onTap: () {
          setState(() {
            screenExpression = btn.addOperandToExpression(text, expression);
          });
        },
        child: Container(
          child: Text(text, style: textStyleOperand),
        ),
      );

  Widget dotBtn(BuildContext context, String text, String expression) =>
      GestureDetector(
        onTap: () {
          setState(() {
            screenExpression = btn.addDotToExpression(text, expression);
          });
        },
        child: Text(text, style: textStyle),
      );

  Widget deleteBtn(BuildContext context, String text, String expression) =>
      GestureDetector(
        onTap: () {
          setState(() {
            screenExpression = btn.deleteElementFromExpression(expression);
          });
        },
        child: Text(text, style: textStyleOperand),
      );

  Widget evaluationBtn(BuildContext context, String text, String expression) =>
      GestureDetector(
        onTap: () {
          setState(() {
            try {
              evaluatedExpression = evaluation.calculateExpression(expression);
            } catch (e) {
              evaluatedExpression = "BAD MATHEMATICAL EXPRESSION";
            }
          });
        },
        child: Container(
          child: Text(text, style: textStyleOperand),
        ),
      );

  Widget clearExpressionBtn(
          BuildContext context, String text, String expression) =>
      GestureDetector(
        onTap: () {
          setState(() {
            screenExpression = btn.clearExpressionFromScreen(expression);
            evaluatedExpression = "";
          });
        },
        child: Container(
          child: Text(text, style: textStyleOperand),
        ),
      );
  @override
  Widget build(BuildContext context) {
    // evaluation.calculateExpression();
    // try {
    //   evaluation.calculateExpression();
    // } catch (e) {
    //   print(e);
    // }

    // btn.addOperandToExpression("", "49+4-");
    // btn.deleteElementFromExpression("49+4-");
    // btn.addDotToExpression(".", "49+4-66");
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
          title: Text("Calculator", style: TextStyle(color: Colors.white))),
      body: Container(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$screenExpression",
                          style: textStyleBlack,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "$evaluatedExpression",
                              style: textStyleEvaluatedExpression,
                            ))
                      ]),
                )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        numberBtns(context, "7", screenExpression),
                        numberBtns(context, "8", screenExpression),
                        numberBtns(context, "9", screenExpression),

                        // width,
                        deleteBtn(context, "DEL", screenExpression)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        numberBtns(context, "4", screenExpression),
                        numberBtns(context, "5", screenExpression),
                        numberBtns(context, "6", screenExpression),
                        operandsBtns(context, "/", screenExpression)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        numberBtns(context, "1", screenExpression),
                        numberBtns(context, "2", screenExpression),
                        numberBtns(context, "3", screenExpression),
                        operandsBtns(context, "x", screenExpression)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dotBtn(context, ".", screenExpression),
                        numberBtns(context, "0", screenExpression),

                        clearExpressionBtn(context, "CLR", screenExpression),
                        operandsBtns(context, "-", screenExpression),

                        // operandsBtns(context, "+", screenExpression)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        numberBtns(context, "(", screenExpression),

                        numberBtns(context, ")", screenExpression),

                        evaluationBtn(context, "=", screenExpression),
                        operandsBtns(context, "+", screenExpression),

                        // operandsBtns(context, "+", screenExpression)
                      ],
                    )
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
