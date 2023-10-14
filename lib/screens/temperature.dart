import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TemperatureScreen()));

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;

  void convertTemperature() {
    setState(() {
      isLoading = true;
    });

    // Simulate a delay to mimic processing
    Future.delayed(Duration(seconds: 2), () {
      double inputValue = double.tryParse(numberController.text) ?? 0;
      double convertedValue = 0;

      // Conversion logic for temperature units
      if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
        convertedValue = (inputValue * 9 / 5) + 32;
      } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
        convertedValue = (inputValue - 32) * 5 / 9;
      }
      // Add more conversion logic for other temperature units here...

      setState(() {
        result = 'Converted: $convertedValue $toUnit';
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Temperature Converter'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter Value'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: fromUnit,
                        items: ['Celsius', 'Fahrenheit']
                            .map((item) => DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            fromUnit = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.arrow_forward, color: Colors.orange),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: toUnit,
                        items: ['Celsius', 'Fahrenheit']
                            .map((item) => DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            toUnit = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                isLoading
                    ? CircularProgressIndicator(color: Colors.orange)
                    : Text(result),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: convertTemperature,
                  child: Text('Convert'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
