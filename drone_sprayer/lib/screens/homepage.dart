import 'package:flutter/material.dart';
import 'package:drone_sprayer/widgets/containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar( 
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
          title: const Text('Drone Sprayer'),
          actions: [
            IconButton(onPressed: (){},
            icon: const Icon(Icons.settings))
          ],        
          backgroundColor: const Color.fromARGB(255, 138, 101, 203),          
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 280,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -15,
                          height: 280,
                          width: width,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/images/background.png'),
                                fit: BoxFit.fill,
                                opacity: 0.9,
                              ),
                            ),
                          ),
                        ),
                        Positioned(                      
                          child: Container(
                            height: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/images/drone.png'),
                                alignment: Alignment.topCenter,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(bottom: 10),
                      //     child: Text(
                      //       'Welcome',
                      //       style: TextStyle(
                      //           fontSize: 30,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.deepPurple[800]),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 400,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: const [
                            HomeContainer(
                              text: 'Select Nozzle',
                              details: 'lorem ipsum ',
                              icon: Icons.water,
                            ),
                            HomeContainer(
                              text: 'LLLLLL',
                              details: 'lorem ipsum',
                              icon: Icons.access_alarm,
                            ),
                            HomeContainer(
                              text: 'lahore',
                              details: 'japan',
                              icon: Icons.access_alarm_sharp,
                            ),
                            HomeContainer(
                              text: 'lahore',
                              details: 'city',
                              icon: Icons.access_alarm_sharp,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
