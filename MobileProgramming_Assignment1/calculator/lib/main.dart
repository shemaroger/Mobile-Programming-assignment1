import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _result = "0";
  String _operation = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      _result = "0";
      _num1 = 0.0;
      _num2 = 0.0;
      _operation = "";
    } else if (buttonText == "%" || buttonText == "+/-") {
      if (buttonText == "%") {
        _output = (double.parse(_output) / 100).toString();
      } else if (buttonText == "+/-") {
        _output = (double.parse(_output) * -1).toString();
      }
      _result = _output;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (!_result.contains(".")) {
        _result = _result + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);

      if (_operation == "+") {
        _result = (_num1 + _num2).toString();
      }
      if (_operation == "-") {
        _result = (_num1 - _num2).toString();
      }
      if (_operation == "*") {
        _result = (_num1 * _num2).toString();
      }
      if (_operation == "/") {
        _result = (_num1 / _num2).toString();
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operation = "";
    } else {
      _result = _result + buttonText;
    }

    setState(() {
      _output = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(22.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("My Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("AC", Colors.grey, Colors.black),
                    buildButton("+/-", Colors.grey, Colors.black),
                    buildButton("%", Colors.grey, Colors.black),
                    buildButton("/", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", Colors.grey[850]!, Colors.white),
                    buildButton("8", Colors.grey[850]!, Colors.white),
                    buildButton("9", Colors.grey[850]!, Colors.white),
                    buildButton("*", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey[850]!, Colors.white),
                    buildButton("5", Colors.grey[850]!, Colors.white),
                    buildButton("6", Colors.grey[850]!, Colors.white),
                    buildButton("-", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey[850]!, Colors.white),
                    buildButton("2", Colors.grey[850]!, Colors.white),
                    buildButton("3", Colors.grey[850]!, Colors.white),
                    buildButton("+", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey[850]!, Colors.white),
                    buildButton("0", Colors.grey[850]!, Colors.white),
                    buildButton("00", Colors.grey[850]!, Colors.white),
                    buildButton("=", Colors.orange, Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
