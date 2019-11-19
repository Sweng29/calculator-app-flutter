import 'package:calculator/pages/Calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(myCalculator());

Widget myCalculator() {
  return new MaterialApp(
    color: Colors.blueAccent,
    title: "Calculator",
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: new Text(
          "Calculator",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: new Calculator(),
    ),
  );
}
