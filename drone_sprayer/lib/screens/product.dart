import 'package:flutter/material.dart';

import '../widgets/head_container.dart';
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
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
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

class Calculate extends StatelessWidget {
  final VoidCallback calculate;
  const Calculate({
    super.key,
    required this.calculate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton.icon(
            onPressed: calculate,
            icon: const Icon(
              Icons.calculate_rounded,
              size: 28.0,
            ),
            label: const Text(
              'Calculate',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(280, 48),
              backgroundColor: Colors.teal.shade800,
            )),
      ),
    );
  }
}

class HeadingRow extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const HeadingRow({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        IconButton(
          onPressed: callback,
          icon: const Icon(Icons.info),
          color: Colors.teal,
        )
      ],
    );
  }
}
