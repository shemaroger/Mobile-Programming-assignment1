import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
      _output = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
    } else if (buttonText == ".") {
      if (!_input.contains(".")) {
        _input += buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);

      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "*") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "/") {
        _output = (_num1 / _num2).toString();
      }

      _input = _output;
      _operator = "";
    } else {
      _input += buttonText;
    }

    setState(() {
      _output = _input;
    });
  }

  Widget buildButton(String buttonText,
      {Color color = const Color.fromARGB(255, 51, 51, 51)}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            255, 255, 255, 255), // Change app bar background color
        title: GestureDetector(
          onTap: () {
            Navigator.popUntil(context,
                ModalRoute.withName('/')); // Navigate back to home page
          },
          child: Text("Calculator"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.black, // Change scaffold background color
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
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
                children: <Widget>[
                  buildButton("C", color: Colors.redAccent),
                  buildButton("+/-", color: Colors.grey),
                  buildButton("%", color: Colors.grey),
                  buildButton("/", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("*", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+", color: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("0"),
                  buildButton("."),
                  buildButton("00"),
                  buildButton("=", color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Calculator'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to CalculatorPage
            },
          ),
          ListTile(
            title: Text('Other Screen'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(
                  context, '/login_page'); // Replace with your route
            },
          ),
          // Add more ListTile widgets for additional screens
        ],
      ),
    );
  }
}
