import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_page.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => ConverterState();
}

class ConverterState extends State<Converter> {
  TextEditingController controller = TextEditingController();

  void _saveAmount() async {
    double? usdAmount = double.tryParse(controller.text);
    if (usdAmount != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('usdAmount', usdAmount);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    } else {
      Get.snackbar("Error!", "Please enter an amount!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Amount in USD',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: _saveAmount,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(95, 203, 239, 1.0),
                    ),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Convert',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
