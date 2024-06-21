import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI APP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter your Weight in kgs'),
                      prefixIcon: Icon(Icons.line_weight)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in feet)'),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in inches)'),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != '' && ft != '' && inch != '') {
                        //Bmi Calcuation
                        var iWt = double.parse(wt);
                        var iFt = double.parse(ft);
                        var iIn = double.parse(inch);

                        var tInch = (iFt * 12) + iIn;
                        var tMetre = (tInch * 2.54) / 100;
                        var bmi = iWt / (tMetre * tMetre);
                        var msg = '';

                        if (bmi > 25) {
                          msg = 'You are OverWeight';
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = 'You are UnderWieght';
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = 'You are Healthy';
                          bgColor = Colors.green.shade200;
                        }
                        setState(() {
                          result =
                              '$msg \nYour BMI is ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please Fill all the required blanks';
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(
                  height: 16,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
