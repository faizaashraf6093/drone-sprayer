import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/head_container.dart';
import '../widgets/heading.dart';
import '../widgets/input.dart';
import '../widgets/select_container.dart';

class ProductCalculation extends StatelessWidget {
  const ProductCalculation({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'How much pesticide require per tank \nand for the whole area',
                iconImage: 'asset/icons/insecticide.png',
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
                          text: 'Enter the rate of Pesticide  (L/ac)',
                          callback: () {},
                        ),
                      ),
                      const InputField(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter the Area of the Field  (ac)',
                            callback: () {}),
                      ),
                      const InputField(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Enter Sprayer Output   (L/ac)',
                            callback: () {}),
                      ),
                      const InputField(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeadingRow(
                            text: 'Select the size of Sprayer Tank  (L)',
                            callback: () {}),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                        child: TankSize(),
                      ),
                      Calculate(
                        calculate: () {},
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
}

