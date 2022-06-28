import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  double _bmi = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Center(
        child: Column(
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKLQjlcIA855hhPOfJWWgktPz2rfqE3ma7BA&usqp=CAU",
              width: 100,
            ),
            Text(
              "We care about your health",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Height (${_heightSliderValue.round()} cm)"),
            Slider(
              value: _heightSliderValue,
              max: 200,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Weight: (${_weightSliderValue.round()} kg)"),
            Slider(
              value: _weightSliderValue,
              max: 200,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: () {
                  // When you do flutter or react, there is the notion of state
                  // state means update the value + refresh the screen
                  // If you only want to update the value, you use =
                  // a = 10, b = 3

                  // In our case we want set the value AND refresh the screen
                  // setState
                  var bmiTemp =_weightSliderValue / pow((_heightSliderValue / 100),2);
                  var messageTemp = "";
                  if (bmiTemp < 18){
                    messageTemp = "You are underweight";
                  }
                  else if (bmiTemp < 25){
                    messageTemp = "You are normal";
                  }
                  else if (bmiTemp < 30){
                    messageTemp = "You are overweight";
                  }
                  else {
                    messageTemp = "You are obese";
                  }
                  setState((){
                    _bmi = bmiTemp;
                    _message = messageTemp;
                  });

                  // Add a new message at the bottom of BMI calculation
                  // if bmi < 18 => You are underweight
                  // If bmi > 18 < 25 =? You are normal
                  // 25 >> 30 ==> You are overweigt
                  // >> 30 => You are obese


                  print("Your bmi is ${_bmi.round()}"); // 170/ 70 - 25
                },
                icon: Icon(Icons.favorite),
                label: Text("Calculate")),
            _bmi !=0 ? Text("Your BMI is ${_bmi.round()}") : SizedBox(),
            Text(_message)
          ],
        ),
      ),
    );
  }
}
