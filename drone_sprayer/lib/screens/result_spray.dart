import 'package:drone_sprayer/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultSpray extends StatelessWidget {
  const ResultSpray({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> result = Get.arguments;
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
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomRow(
                          text: 'Total Spray Mix volume required: ',
                          answer: '${result[0]} L',
                        ),
                        CustomRow(
                          text: 'Volume of water required : ',
                          answer: '${result[1]} L',
                        ),
                        CustomRow(
                          text: 'Number of Tank refills:',
                          answer: '${result[2]}  ',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: width - 30,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Instruction',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Fill the sprayer tank half full with water, add the pesticide concentrate and mix. Then fill the sprayer tank to top with water and mix again',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: width - 30,
                  child: const ListTile(
                    leading: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    title: Text('Errors and Omission are expected'),
                    subtitle: Text(
                      'The actual value may vary because of the drift, speed, wind direction, and drone resistance to the wind',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: 'Edit calculation',
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

class CustomRow extends StatelessWidget {
  final String text;
  final String answer;
  const CustomRow({
    super.key,
    required this.text,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          answer,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
