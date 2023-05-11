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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -10,
                        height: 400,
                        width: width,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/images/background.png'),
                              fit: BoxFit.fill,
                              opacity: 0.8,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple[800]),
                        ),
                      ),
                      SizedBox(
                        height: 800,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 40,
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
