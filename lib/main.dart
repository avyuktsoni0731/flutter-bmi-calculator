import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorHomePage(),
    );
  }
}

class BMICalculatorHomePage extends StatefulWidget {
  @override
  _BMICalculatorHomePageState createState() => _BMICalculatorHomePageState();
}

class _BMICalculatorHomePageState extends State<BMICalculatorHomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  void _calculateBMI() {
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);

    if (height > 0 && weight > 0) {
      final double bmi = weight / (height * height);
      String category;

      if (bmi < 18.5) {
        category = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        category = 'Normal weight';
      } else if (bmi >= 25 && bmi < 29.9) {
        category = 'Overweight';
      } else {
        category = 'Obesity';
      }

      setState(() {
        _bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
        _bmiCategory = 'Category: $category';
      });
    } else {
      setState(() {
        _bmiResult = 'Please enter valid values';
        _bmiCategory = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmiResult,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _bmiCategory,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
