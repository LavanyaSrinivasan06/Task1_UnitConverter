import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AreaScreen()));

class AreaScreen extends StatefulWidget {
  @override
  _AreaScreenState createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  String fromUnit = 'sq m';
  String toUnit = 'sq cm';
  TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;
  FocusNode _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void convertArea() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      double inputValue = double.tryParse(numberController.text) ?? 0;
      double convertedValue = 0;

      // Conversion logic for area units
      if (fromUnit == 'sq mm' && toUnit == 'sq cm') {
        convertedValue = inputValue / 100;
      } else if (fromUnit == 'sq cm' && toUnit == 'sq mm') {
        convertedValue = inputValue * 100;
      } else if (fromUnit == 'sq mm' && toUnit == 'sq m') {
        convertedValue = inputValue / 1000000;
      } else if (fromUnit == 'sq m' && toUnit == 'sq mm') {
        convertedValue = inputValue * 1000000;
      } else if (fromUnit == 'sq cm' && toUnit == 'sq m') {
        convertedValue = inputValue / 10000;
      } else if (fromUnit == 'sq m' && toUnit == 'sq cm') {
        convertedValue = inputValue * 10000;
      } else if (fromUnit == 'sq m' && toUnit == 'hectare') {
        convertedValue = inputValue / 10000;
      } else if (fromUnit == 'hectare' && toUnit == 'sq m') {
        convertedValue = inputValue * 10000;
      } else if (fromUnit == 'sq m' && toUnit == 'sq km') {
        convertedValue = inputValue / 1000000;
      } else if (fromUnit == 'sq km' && toUnit == 'sq m') {
        convertedValue = inputValue * 1000000;
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
          title: Text('Area Converter'),
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
                  items: ['sq mm', 'sq cm', 'sq m', 'hectare', 'sq km']
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
                  items: ['sq mm', 'sq cm', 'sq m', 'hectare', 'sq km']
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
                  onPressed: convertArea,
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
