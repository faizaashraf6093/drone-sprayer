import 'package:drone_sprayer/screens/result_calibration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import '../widgets/head_container.dart';
import '../widgets/heading.dart';
import '../widgets/input.dart';

class Calibration extends StatelessWidget {
  const Calibration({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController swathCtrl = TextEditingController();
    final TextEditingController areaCtrl = TextEditingController();
    final TextEditingController speedCtrl = TextEditingController();
    final TextEditingController nozzleCtrl = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Color.fromARGB(255, 47, 101, 89),
                Color.fromARGB(255, 11, 93, 59),
              ],
            ),
          ),
          child: Column(
            children: [
              const HeadContainer(
                heading: 'Calculate Sprayer Output',
                iconImage: 'asset/icons/nozzle.png',
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 23.0, left: 20.0, right: 20.0),
                        child: HeadingRow(
                          text: 'Enter the Swath Width  (m)',
                          bottomHeading: 'Swath Width',
                          content:
                              'The swath width of a spraying drone refers to the horizontal coverage width achieved by the drone\'s spraying system in a single pass. The swath width tells us how wide the drone can spray in one go',
                          isSprayer: false,
                        ),
                      ),
                      InputField(
                        textEditingController: swathCtrl,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                          text: 'Enter the Area of the Field  (ac)',
                          bottomHeading: 'Area of field',
                          content:
                              'This is the area of field you want to spray. Area covered by a spraying drone can vary based on factors like turns, overlaps, and flight patterns. Planning and optimizing flight paths can help ensure efficient and accurate coverage of the target area.',
                          isSprayer: false,
                        ),
                      ),
                      InputField(
                        textEditingController: areaCtrl,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                          text: 'Enter Drone Speed   (m/s)',
                          bottomHeading: 'Drone Speed',
                          content:
                              'The speed at which you want to fly your drone. Finding the right speed for a drone during spraying is crucial to achieve proper coverage, minimize drift and over-spray, improve flight efficiency, and optimize battery usage for a successful spraying operation.',
                          isSprayer: false,
                        ),
                      ),
                      InputField(
                        textEditingController: speedCtrl,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                          text: 'Enter Flow Rate of Drone Nozzle   (L/min)',
                          bottomHeading: 'Flow Rate',
                          content:
                              ' Flow rate is the amount of fluid that flows through a sprayer system per unit of time. Flow rate depends on the sprayer output, the number of nozzles, and the pressure. Drones usually report flow rate using a built-in flow meter ',
                          isSprayer: false,
                        ),
                      ),
                      InputField(
                        textEditingController: nozzleCtrl,
                      ),
                      Calculate(
                        calculate: () {
                          try {
                            String result = sprayerOutput(
                                areaCtrl, swathCtrl, speedCtrl, nozzleCtrl);

                            Get.to(() => const SprayerOutput(),
                                arguments: result);
                          } on FormatException catch (e) {
                            String error = e.message;
                            displayMessage(error);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void displayMessage(String error) {
    Get.defaultDialog(
        title: error,
        content: const Text(
          'Please provide all the required values',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('OK'))
        ]);
  }

  sprayerOutput(TextEditingController areaCtrl, TextEditingController swathCtrl,
      TextEditingController speedCtrl, TextEditingController nozzleCtrl) {
    double area = double.parse(areaCtrl.text);
    double width = double.parse(swathCtrl.text);
    double speed = double.parse(speedCtrl.text) * 3.6;
    double flowRate = double.parse(nozzleCtrl.text) * 60;
    double distance = (area * 4047 / width) / 1000;
    double time = distance / speed;
    double output = ((time * flowRate) / area).toPrecision(1);
    return output.toString();
  }
}
