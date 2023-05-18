import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  
  final String text;
  final String details;
  final IconData icon;

  const HomeContainer(
      {super.key,
      required this.text,
      required this.details,
      required this.icon});

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
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 150, 147, 147),
                  offset: Offset(-5.0, 5.0),
                  blurRadius: 20,
                  spreadRadius: 0.5,
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 3.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                size: 24,
                color: Colors.red,                
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  details,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
