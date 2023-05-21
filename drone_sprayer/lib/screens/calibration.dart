import 'package:flutter/material.dart';

class Calibration extends StatelessWidget {
  const Calibration({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                color: Colors.blue[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}