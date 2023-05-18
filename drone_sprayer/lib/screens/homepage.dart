import 'package:flutter/material.dart';
import 'package:drone_sprayer/widgets/containers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: width,
                            height: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/images/man.png'),
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
                        Center(
                          child: SizedBox(
                            width: 600,
                            height: 800,
                            child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
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
                                ]),
                          ),
                        )
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
