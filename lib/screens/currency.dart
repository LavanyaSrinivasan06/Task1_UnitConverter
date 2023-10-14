import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  TextEditingController amountController = TextEditingController();
  String result = '';
  bool isLoading = false;

  void convertCurrency() {
    setState(() {
      isLoading = true;
    });

    // Add your currency conversion logic here
    // For example:
    // double inputValue = double.tryParse(amountController.text) ?? 0;
    // double convertedValue = inputValue * conversionRate;

    // Simulate a delay to mimic processing
    Future.delayed(Duration(seconds: 2), () {
      // Update the converted value and result text
      // setState(() {
      //   result = 'Converted: $convertedValue $toCurrency';
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
        title: Text('Currency Converter'),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
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
                      value: fromCurrency,
                      items: ['USD', 'EUR', 'GBP'] // Add more currency codes as needed
                          .map((currency) => DropdownMenuItem(
                        child: Text(
                          currency,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: currency,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromCurrency = value!;
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
                      value: toCurrency,
                      items: ['USD', 'EUR', 'GBP'] // Add more currency codes as needed
                          .map((currency) => DropdownMenuItem(
                        child: Text(
                          currency,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: currency,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          toCurrency = value!;
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
                onPressed: convertCurrency,
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
