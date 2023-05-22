import 'package:flutter/material.dart';

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
