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
                                    iconImage: 'asset/icons/time.png',
                                    text: 'Calculate Time',
                                    details:
                                        'Estimate how long it will take to spray the whole area',
                                  ),
                                  HomeContainer(
                                    iconImage: 'asset/icons/insecticide.png',
                                    text: 'Product Calculations',
                                    details:
                                        'How much product in total require to spray the whole area',
                                  ),
                                  HomeContainer(
                                    iconImage: 'asset/icons/pesticide.png',
                                    text: 'Spray Mix Calculations',
                                    details:
                                        'The amount of pesticide to put in a sprayer each time',
                                  ),
                                  HomeContainer(
                                    iconImage: 'asset/icons/nozzle.png',
                                    text: 'Drone Calibration',
                                    details:
                                        'Find Sprayer Output, Swath width, ',
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
