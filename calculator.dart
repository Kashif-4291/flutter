import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController value1Controller = TextEditingController();
  final TextEditingController value2Controller = TextEditingController();
  String selectedOperation = '+';
  String result = '';

  void calculate() {
    double num1 = double.tryParse(value1Controller.text) ?? 0;
    double num2 = double.tryParse(value2Controller.text) ?? 0;
    double res = 0;

    switch (selectedOperation) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    setState(() {
      result = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: value1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Value 1",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButton<String>(
                value: selectedOperation,
                items: ['+', '-', '*', '/'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 18)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOperation = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: value2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Value 2",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text("Calculate", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    
                    border: const OutlineInputBorder(),
                    hintText: result,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
