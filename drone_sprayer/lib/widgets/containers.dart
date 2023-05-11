import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final String text;
  final String details;
  final IconData icon;
  const HomeContainer({super.key, required this.text, required this.details, required this.icon});

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width, 

      height: height,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
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
          ]),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
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
              child: Icon(icon,
                size: 50,
                color: Colors.deepPurple[600],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children:  [
              Text(text,
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],),
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
