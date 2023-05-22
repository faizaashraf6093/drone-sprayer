import 'package:flutter/material.dart';

class TankSize extends StatefulWidget {
  const TankSize({super.key});

  @override
  State<TankSize> createState() => _TankSizeState();
}

class _TankSizeState extends State<TankSize> {
  int? _selectedValueIndex = 0;
  List<String> buttonText = ['5', '8', '10', '16', '20'];

  Widget button({required String text, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 90,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: index == _selectedValueIndex ? Colors.teal : Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: index == _selectedValueIndex ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: const BorderRadius.all(Radius.circular(8.0))
      ),
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
    );
  }
}
