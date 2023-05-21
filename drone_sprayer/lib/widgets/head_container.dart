import 'package:flutter/material.dart';

class HeadContainer extends StatelessWidget {
  final String iconImage;
  final String heading;

  const HeadContainer({
    super.key,
    required this.iconImage,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            iconSize: 32.0,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            child: Image.asset(iconImage),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              heading,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                wordSpacing: 2.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
