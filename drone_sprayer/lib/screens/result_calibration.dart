import 'package:drone_sprayer/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SprayerOutput extends StatelessWidget {
  const SprayerOutput({super.key});

  @override
  Widget build(BuildContext context) {
    var result = Get.arguments.toString();
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    height: 200,
                    width: width - 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            'Sprayer Output ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          result,
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const Text('L/ac', style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: width - 30,
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                        title: Text('Errors and Omission are expected'),
                        subtitle: Text(
                          'The actual value may vary because of the drift, speed, wind direction, and drone resistance to the wind',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: 'Edit Calculation',
                    icon: Icons.edit_rounded,
                    callback: () {
                      Get.back();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: 'Start new calculation',
                    callback: () {
                      Get.offAll(const HomePage());
                    },
                    icon: Icons.home_filled,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final IconData icon;
  const CustomButton({
    super.key,
    required this.text,
    required this.callback,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: callback,
        icon: Icon(
          icon,
          size: 28.0,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(280, 48),
          backgroundColor: Colors.teal.shade800,
        ));
  }
}
