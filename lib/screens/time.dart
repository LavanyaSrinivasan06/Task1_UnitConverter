import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TimeScreen()));

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  String fromUnit = 'Seconds';
  String toUnit = 'Minutes';

  TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;
  FocusNode _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void convertTime() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      double inputValue = double.tryParse(numberController.text) ?? 0;
      double convertedValue = 0;

      // Conversion logic for time units
      if (fromUnit == 'Seconds' && toUnit == 'Minutes') {
        convertedValue = inputValue / 60;
      } else if (fromUnit == 'Minutes' && toUnit == 'Seconds') {
        convertedValue = inputValue * 60;
      } else if (fromUnit == 'Minutes' && toUnit == 'Hours') {
        convertedValue = inputValue / 60;
      } else if (fromUnit == 'Hours' && toUnit == 'Minutes') {
        convertedValue = inputValue * 60;
      } else if (fromUnit == 'Hours' && toUnit == 'Days') {
        convertedValue = inputValue / 24;
      } else if (fromUnit == 'Days' && toUnit == 'Hours') {
        convertedValue = inputValue * 24;
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
          title: Text('Time Converter'),
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
                  items: ['Seconds', 'Minutes', 'Hours', 'Days']
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
                  items: ['Seconds', 'Minutes', 'Hours', 'Days']
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
                  onPressed: convertTime,
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
