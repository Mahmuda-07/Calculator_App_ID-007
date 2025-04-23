import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0;
  String operation = "+";

  void calculate() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    setState(() {});
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 450, 
            child: Card(
              color: Colors.grey.shade200, 
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: num1Controller,
                        decoration: InputDecoration(
                          labelText: "Enter first number",
                          filled: true,
                          fillColor: Colors.deepOrange,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: num2Controller,
                        decoration: InputDecoration(
                          labelText: "Enter second number",
                          filled: true,
                          fillColor: Colors.deepOrange,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    
                    
      Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
     decoration: BoxDecoration(
    color: Colors.lightBlueAccent, 
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.black, width: 1),
  ),
  child: DropdownButton<String>(
    value: operation,
    isExpanded: true,
    style: TextStyle(fontSize: 18, color: Colors.white), 
    dropdownColor: Colors.blueGrey, 
    underline: SizedBox(), 
    items: [
      DropdownMenuItem(value: '+', child: Text("➕  Add")),
      DropdownMenuItem(value: '-', child: Text("➖  Subtract")),
      DropdownMenuItem(value: '*', child: Text("✖  Multiply")),
      DropdownMenuItem(value: '/', child: Text("➗  Divide")),
    ],
    onChanged: (val) {
      setState(() {
        operation = val!;
      });
    },
  ),
),

  SizedBox(height: 20),
   SizedBox(
  width: 100, 
  height: 50, 
  child: ElevatedButton(
    onPressed: calculate,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey, 
    ),
    child: Text("Calculate"),
  ),
),

                    SizedBox(height: 20),
                    Text(
               "Result: $result",
                style: textStyle.copyWith(color: Colors.blue),
                 textAlign: TextAlign.center,
               ),
                    ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




