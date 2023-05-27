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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 23.0, left: 20.0, right: 20.0),
                        child: HeadingRow(
                          text: 'Enter the Swath Width  (m)',
                          callback: () {},
                        ),
                      ),
                      InputField(
                        textEditingController: swathCtrl,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter the Area of the Field  (ac)',
                            callback: () {}),
                      ),
                      InputField(
                        textEditingController: areaCtrl,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter Drone Speed   (m/s)', callback: () {}),
                      ),
                      InputField(
                        textEditingController: speedCtrl,
                      ),
                      const SizedBox(height: 30),
                      Calculate(
                        calculate: () {
                          String result =
                              calculateTime(areaCtrl, swathCtrl, speedCtrl);
                          Get.to(const TimeResult(), arguments: result);
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
