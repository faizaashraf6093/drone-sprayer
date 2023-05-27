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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter Flow Rate of Drone Nozzle   (L/min)',
                            callback: () {}),
                      ),
                      InputField(
                        textEditingController: nozzleCtrl,
                      ),
                      Calculate(
                        calculate: () {
                          String result = sprayerOutput(
                              areaCtrl, swathCtrl, speedCtrl, nozzleCtrl);

                          Get.to(() => const SprayerOutput(),
                              arguments: result);
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

  sprayerOutput(TextEditingController areaCtrl, TextEditingController swathCtrl,
      TextEditingController speedCtrl, TextEditingController nozzleCtrl) {
    double area = double.parse(areaCtrl.text) * 4047;
    double width = double.parse(swathCtrl.text);
    double speed = double.parse(speedCtrl.text) * 3.6;
    double flowRate = double.parse(nozzleCtrl.text) * 60;
    double distance = (area / width) / 1000;
    double time = distance / speed;
    double output = (time * flowRate).toPrecision(1);

    return output.toString();
  }
}
