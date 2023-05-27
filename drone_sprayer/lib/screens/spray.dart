import 'package:drone_sprayer/screens/result_spray.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import '../widgets/head_container.dart';
import '../widgets/heading.dart';
import '../widgets/input.dart';

class SprayCalculations extends StatefulWidget {
  const SprayCalculations({super.key});

  @override
  State<SprayCalculations> createState() => _SprayCalculationsState();
}

class _SprayCalculationsState extends State<SprayCalculations> {
  int? selectedValueIndex = 0;
  List<String> buttonText = ['5', '8', '10', '16', '20'];

  @override
  Widget build(BuildContext context) {
    final TextEditingController rateCtrl = TextEditingController();
    final TextEditingController areaCtrl = TextEditingController();
    final TextEditingController outputCtrl = TextEditingController();

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
                heading: 'How much Spray Mix and tank refills will be required',
                iconImage: 'asset/icons/spray_mix.png',
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
                            text: 'Select the size of Sprayer Tank  (L)',
                            callback: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ...List.generate(
                                buttonText.length,
                                (index) => button(
                                  index: index,
                                  text: buttonText[index],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                          text: 'Enter the rate of Pesticide  (L/ac)',
                          callback: () {},
                        ),
                      ),
                      InputField(textEditingController: rateCtrl),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                          text: 'Enter the Area of Field  (ac)',
                          callback: () {},
                        ),
                      ),
                      InputField(textEditingController: areaCtrl),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter Sprayer Output   (L/ac)',
                            callback: () {}),
                      ),
                      InputField(textEditingController: outputCtrl),
                      Calculate(
                        calculate: () {
                          List<String> result = sprayCalculation(rateCtrl, areaCtrl, outputCtrl);
                          Get.to(() => const ResultSpray(), arguments: result);
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

  sprayCalculation(TextEditingController rateCtrl,
      TextEditingController areaCtrl, TextEditingController outputCtrl) {
    double rate = double.parse(rateCtrl.text);
    double area = double.parse(areaCtrl.text);
    double output = double.parse(outputCtrl.text);
    int tankSize = int.parse(buttonText[selectedValueIndex!]);

    double pesticideAmount = rate * area;
    double sprayMix = (output * area).roundToDouble();
    double waterAmount = (sprayMix - pesticideAmount).roundToDouble();
    int refill = (sprayMix / tankSize).round();

    List<String> answer = [
      sprayMix.toString(),
      waterAmount.toString(),
      refill.toString()
    ];

    return answer;
  }

  Widget button({required String text, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedValueIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              index == selectedValueIndex ? Colors.teal : Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: index == selectedValueIndex ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
