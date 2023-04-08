import 'package:flutter/material.dart';
import 'package:testamp/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static bool filterToggle = false;
  static IconData hiddenStash = Icons.apps;
  static IconData safe = Icons.screen_lock_portrait_rounded;
  static IconData deadScav = Icons.man_3_rounded;
  static IconData cabinet = Icons.view_comfortable_outlined;
  static IconData weaponBox = Icons.fire_extinguisher_rounded;
  static IconData grenadeBox = Icons.sports_baseball_rounded;
  static IconData ammoBox = Icons.animation_outlined;
  static IconData jacket = Icons.join_inner_sharp;
  static IconData meds = Icons.local_hospital_rounded;
  static IconData pc = Icons.computer_rounded;
  static IconData rationCrate = Icons.fastfood_rounded;
  static IconData duffleBag = Icons.shopping_bag_rounded;
  static IconData toolBox = Icons.design_services_sharp;
  static IconData woodenCrate = Icons.wordpress_outlined;
  static IconData lockedRoom = Icons.lock_outline_rounded;
  static IconData looseLoot = Icons.point_of_sale_rounded;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE2E2E2),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.green[200]),
          focusColor: Colors.white,
          highlightColor: Colors.green[400],
          disabledColor: Colors.black38,
          toggleButtonsTheme: const ToggleButtonsThemeData()),
      home: const HomeScreen(),
      // title: 'image overlay map Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: CustomsFullMap(title: 'Customs'),
    );
  }
}
