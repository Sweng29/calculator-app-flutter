import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0.00";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonTitle) {
    print(buttonTitle);
    if (buttonTitle == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonTitle == "+" ||
        buttonTitle == "-" ||
        buttonTitle == "/" ||
        buttonTitle == "x") {
      num1 = double.parse(output);
      operand = buttonTitle;
      _output = "0";
    } else if (buttonTitle == ".") {
      if (_output.contains(".")) {
        return;
      }
      _output = _output + buttonTitle;
    } else if (buttonTitle == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonTitle == "()") {
      return;
    } else {
      _output = _output + buttonTitle;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonTitle) {
    return new Expanded(
      child: new OutlineButton(
        child: new Text(
          buttonTitle,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        onPressed: () => buttonPressed(buttonTitle),
        padding: EdgeInsets.all(25.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              output,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            alignment: Alignment.centerRight,
          ),
          new Expanded(
              child: new Divider(
            indent: 0,
            height: 0,
          )),
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  buildButton("C"),
                  buildButton("()"),
                  buildButton("%"),
                  buildButton("/")
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("x")
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-")
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+")
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("."),
                  buildButton("=")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
