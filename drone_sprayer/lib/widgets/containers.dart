import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final String text;
  final String details;
  final String iconImage;

  const HomeContainer({
    super.key,
    required this.text,
    required this.details,
    required this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(150, 147, 147, 1),
              offset: Offset(-5.0, 5.0),
              blurRadius: 20,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 0.0,
              spreadRadius: 3.0,
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 0.5,
                  fit: BoxFit.scaleDown,
                  image: AssetImage(iconImage),
                ),
                color: Colors.transparent,
              ),
            ),
          ),
          Column(            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ),
              Text(
                details,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
