import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddNumbers(),
    );
  }
}

class AddNumbers extends StatefulWidget {
  @override
  _AddNumbersState createState() => _AddNumbersState();
}

class _AddNumbersState extends State<AddNumbers> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double? _result;

  void _addNumbers() {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Two Numbers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter  number',
              ),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNumbers,
              child: Text('Add'),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text(
                'Result: $_result',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
