import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import '../widgets/head_container.dart';
import '../widgets/heading.dart';
import '../widgets/input.dart';
import 'result_time.dart';

class TimeCalculation extends StatelessWidget {
  const TimeCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController swathCtrl = TextEditingController();
    final TextEditingController areaCtrl = TextEditingController();
    final TextEditingController speedCtrl = TextEditingController();
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
                heading:
                    'How much Time will be needed \nto Spray the whole Area',
                iconImage: 'asset/icons/time.png',
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
                      const SizedBox(height: 30),
                      Calculate(
                        calculate: () {
                          try {
                            String result =
                                calculateTime(areaCtrl, swathCtrl, speedCtrl);
                            Get.to(const TimeResult(), arguments: result);
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

  String calculateTime(TextEditingController areaCtrl,
      TextEditingController swathCtrl, TextEditingController speedCtrl) {
    double area = double.parse(areaCtrl.text) * 4047;
    double width = double.parse(swathCtrl.text);
    double speed = double.parse(speedCtrl.text) * 3.6;
    double distance = (area / width) / 1000;
    double time = distance / speed;
    return getTimeStringFromDouble(time);
  }

  String getTimeStringFromDouble(double value) {
    if (value < 0) return 'Invalid Value';
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    String hourValue = getHourString(flooredValue);
    String minuteString = getMinuteString(decimalValue);

    return '$hourValue:$minuteString';
  }

  String getMinuteString(double decimalValue) {
    return '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
  }

  String getHourString(int flooredValue) {
    return '${flooredValue % 24}'.padLeft(2, '0');
  }
}
