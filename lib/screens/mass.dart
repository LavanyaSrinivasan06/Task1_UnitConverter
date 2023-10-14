import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MassScreen()));

class MassScreen extends StatefulWidget {
  @override
  _MassScreenState createState() => _MassScreenState();
}

class _MassScreenState extends State<MassScreen> {
  String fromUnit = 'Grams';
  String toUnit = 'Kilograms';
  TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;
  FocusNode _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void convertMass() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      double inputValue = double.tryParse(numberController.text) ?? 0;
      double convertedValue = 0;
      // Conversion logic for mass units
      if (fromUnit == 'Grams' && toUnit == 'Kilograms') {
        convertedValue = inputValue / 1000;
      } else if (fromUnit == 'Kilograms' && toUnit == 'Grams') {
        convertedValue = inputValue * 1000;
      } else if (fromUnit == 'Grams' && toUnit == 'Pounds') {
        convertedValue = inputValue * 0.00220462;
      } else if (fromUnit == 'Pounds' && toUnit == 'Grams') {
        convertedValue = inputValue * 453.592;
      } else if (fromUnit == 'Pounds' && toUnit == 'Kilograms') {
        convertedValue = inputValue * 0.453592;
      } else if (fromUnit == 'Kilograms' && toUnit == 'Pounds') {
        convertedValue = inputValue * 2.20462;
      } else if (fromUnit == 'Grams' && toUnit == 'Ounces') {
        convertedValue = inputValue * 0.03527396;
      } else if (fromUnit == 'Ounces' && toUnit == 'Grams') {
        convertedValue = inputValue * 28.34952;
      }


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
          backgroundColor: Colors.purple,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Mass Converter'),
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  focusNode: _textFieldFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Enter Number',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  value: fromUnit,
                  items:  ['Grams', 'Kilograms', 'Pounds', 'Ounces']
                      .map((unit) => DropdownMenuItem(
                    child: Text(
                      unit,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: unit,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'From',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  value: toUnit,
                  items:  ['Grams', 'Kilograms', 'Pounds', 'Ounces']
                      .map((unit) => DropdownMenuItem(
                    child: Text(
                      unit,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: unit,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'To',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.purple),
                    )
                        : Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        result,
                        style:
                        TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: convertMass,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Convert', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
