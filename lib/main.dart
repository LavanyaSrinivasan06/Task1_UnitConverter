import 'package:first/screens/angle.dart';
import 'package:first/screens/area.dart';
import 'package:first/screens/currency.dart';
import 'package:first/screens/frequency.dart';
import 'package:first/screens/speed.dart';
import 'package:first/screens/temperature.dart';
import 'package:first/screens/volume.dart';
import 'package:flutter/material.dart';
import 'screens/length.dart';
import 'screens/time.dart';
import 'screens/mass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets
            .zero, // Set padding to zero to remove any default padding or margin
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Row(
              children: [
                Text(
                  "Unit Converter",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
              ],
            ),
            actions: [
              IconButton(

                icon: Icon(Icons.settings),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.access_time, 'Time')),
                      SizedBox(width: 16),
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.straighten, 'Length')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.scale_outlined, 'Temperature')),
                      SizedBox(width: 16),
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.timeline, 'Frequency')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.fitness_center, 'Mass')),
                      SizedBox(width: 16),
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.landslide_sharp, 'Area')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.speed, 'Speed')),
                      SizedBox(width: 16),
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.opacity, 'Volume')),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.attach_money,
                              'Currency')),
                      SizedBox(width: 16),
                      Expanded(
                          child: _buildUnitContainer(
                              context, Icons.change_circle, 'Angle')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUnitContainer(BuildContext context, IconData icon, String text) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          switch (text) {
            case 'Speed':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpeedScreen()),
              );
              break;
            case 'Volume':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VolumeScreen()),
              );
              break;
            case 'Currency':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyScreen()),
              );
              break;
            case 'Angle':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AngleScreen()),
              );
              break;

            case 'Length':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LengthScreen()),
              );
              break;
            case 'Time':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeScreen()),
              );
              break;
            case 'Mass':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MassScreen()),
              );
              break;
            case 'Frequency':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FrequencyScreen()),
              );
              break;
            case 'Temperature':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TemperatureScreen()),
              );
              break;
            case 'Area':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AreaScreen()),
              );
              break;
            case 'Speed':
            // Handle Speed screen navigation here
              break;
            case 'Volume':
            // Handle Volume screen navigation here
              break;
            case 'Currency':
            // Handle Currency screen navigation here
              break;
            case 'Angle':
            // Handle Angle screen navigation here
              break;
          }
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white12, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.purple,
              ),
              SizedBox(height: 8),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
