import 'package:flutter/material.dart';
import 'package:testamp/firebasetest.dart';
import 'package:testamp/map_customs/customs_full_map.dart';

import 'package:testamp/map_factory/factory_full_map.dart';
import 'package:flutter/services.dart';
import 'package:testamp/map_interchange/interchange_1f.dart';
import 'package:testamp/map_woods/woods_1f.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData land = Icons.landscape;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // precacheImage(Image.asset('assets/images/customs.png').image, context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EFT Navigator'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HomeToMap(
                title: 'Woods',
                page: Woods_1F(
                  title: 'Woods',
                ),
              ),
              HomeToMap(
                title: 'Customs',
                page: CustomsFullMap(title: "Customs"),
              ),
              HomeToMap(
                title: 'Factory',
                page: FactoryFullMap(
                  title: 'Factory',
                ),
              ),
              HomeToMap(
                title: 'Interchange',
                page: Interchange_1F(
                  title: 'Interchange',
                ),
              ),
              HomeToMap(title: 'FBTest', page: FirebaseTest()),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeToMap extends StatelessWidget {
  final String title;
  final Widget page;
  const HomeToMap({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) => page,
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
