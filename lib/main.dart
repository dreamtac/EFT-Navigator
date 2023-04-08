import 'package:flutter/material.dart';
import 'package:testamp/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static Size ENABLE_ICON_SIZE = const Size(20, 20);
  static Size DISABLE_ICON_SIZE = const Size(5000, 5000);
  static double NORMAL_ICON_SIZE = 20;

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

  static IconData hiddenStashPin = Icons.apps;
  static IconData safePin = Icons.screen_lock_portrait_rounded;
  static IconData deadScavPin = Icons.man_3_rounded;
  static IconData cabinetPin = Icons.view_comfortable_outlined;
  static IconData weaponBoxPin = Icons.fire_extinguisher_rounded;
  static IconData grenadeBoxPin = Icons.sports_baseball_rounded;
  static IconData ammoBoxPin = Icons.animation_outlined;
  static IconData jacketPin = Icons.join_inner_sharp;
  static IconData medsPin = Icons.local_hospital_rounded;
  static IconData pcPin = Icons.computer_rounded;
  static IconData rationCratePin = Icons.fastfood_rounded;
  static IconData duffleBagPin = Icons.shopping_bag_rounded;
  static IconData toolBoxPin = Icons.design_services_sharp;
  static IconData woodenCratePin = Icons.wordpress_outlined;
  static IconData lockedRoomPin = Icons.lock_outline_rounded;
  static IconData looseLootPin = Icons.point_of_sale_rounded;

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
        toggleButtonsTheme: const ToggleButtonsThemeData(),
        iconTheme: const IconThemeData(size: 20),
      ),

      home: const HomeScreen(),
      // title: 'image overlay map Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: CustomsFullMap(title: 'Customs'),
    );
  }
}
