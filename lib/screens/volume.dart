import 'package:flutter/material.dart';

class VolumeScreen extends StatefulWidget {
  @override
  _VolumeScreenState createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> {
  String fromUnit = 'Liters';
  String toUnit = 'Gallons';
  TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;

  void convertVolume() {
    setState(() {
      isLoading = true;
    });

    // Add your volume conversion logic here
    // For example:
    // double inputValue = double.tryParse(numberController.text) ?? 0;
    // double convertedValue = inputValue * conversionFactor;

    // Simulate a delay to mimic processing
    Future.delayed(Duration(seconds: 2), () {
      // Update the converted value and result text
      // setState(() {
      //   result = 'Converted: $convertedValue $toUnit';
      //   isLoading = false;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Volume Converter'),
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
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      value: fromUnit,
                      items: ['Liters', 'Gallons']
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
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.arrow_forward, color: Colors.blue),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      value: toUnit,
                      items: ['Liters', 'Gallons']
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
                  ),
                ],
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: convertVolume,
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text('Convert', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
