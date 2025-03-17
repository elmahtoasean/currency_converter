import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _convertedAmount = 0.0;

  void _loadAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? usdAmount = prefs.getDouble('usdAmount') ?? 0.0;
    setState(() {
      _convertedAmount = usdAmount * 120; 
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Converted Amount')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Text(
              'Converted Amount in BDT:',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(95, 203, 239, 1.0),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Text(
                '$_convertedAmount BDT',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
