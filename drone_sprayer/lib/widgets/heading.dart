import 'package:drone_sprayer/screens/calibration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadingRow extends StatelessWidget {
  final String text;
  final String bottomHeading;
  final String content;
  final bool isSprayer;
  const HeadingRow({
    super.key,
    required this.text,
    required this.bottomHeading,
    required this.content,
    required this.isSprayer,
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
            icon: const Icon(Icons.info),
            color: Colors.teal,
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bottomHeading,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(content,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16.0)),
                      const SizedBox(height: 10),
                      isSprayer
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(300, 10),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                  )),
                              child: const Text('Calculate Sprayer Output'),
                              onPressed: () => Get.to(const Calibration()),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(200, 10),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                  )),
                              onPressed: () => Get.back(),
                              child: const Text('Close'),
                            ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              );
            })
      ],
    );
  }
}
