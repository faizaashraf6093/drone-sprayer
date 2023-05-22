import 'package:flutter/material.dart';

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
