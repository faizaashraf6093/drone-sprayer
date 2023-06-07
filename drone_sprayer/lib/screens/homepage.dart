import 'package:drone_sprayer/auth/auth.dart';
import 'package:drone_sprayer/screens/calibration.dart';
import 'package:drone_sprayer/screens/product.dart';
import 'package:drone_sprayer/screens/spray.dart';
import 'package:drone_sprayer/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drone_sprayer/screens/time.dart';
import 'package:drone_sprayer/widgets/containers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drone Sprayer'),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(const AuthPage());
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const MyDrawer(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 600,
                            height: 800,
                            child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => const TimeCalculation()),
                                    child: const HomeContainer(
                                      iconImage: 'asset/icons/time.png',
                                      text: 'Time \n Calculation',
                                      details:
                                          'Estimate how long it will take to spray the whole area',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Get.to(
                                        () => const ProductCalculation()),
                                    child: const HomeContainer(
                                      iconImage: 'asset/icons/insecticide.png',
                                      text: 'Product Calculations',
                                      details:
                                          'How much product is required to spray the whole area',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => const SprayCalculations()),
                                    child: const HomeContainer(
                                      iconImage: 'asset/icons/spray_mix.png',
                                      text: 'Spray Mix Calculations',
                                      details:
                                          'How much Spray Mix will used and how many Sprayer tank will be needed',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => const Calibration()),
                                    child: const HomeContainer(
                                      iconImage: 'asset/icons/nozzle.png',
                                      text: 'Drone \n Calibration',
                                      details:
                                          'Calibrate your drone to find sprayer output, swath width',
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
