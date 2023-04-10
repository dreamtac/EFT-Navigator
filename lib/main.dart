import 'package:flutter/material.dart';
import 'package:testamp/custom_icons_icons.dart';
import 'package:testamp/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static const Size ENABLE_ICON_SIZE = Size(30, 30);
  static const Size DISABLE_ICON_SIZE = Size(5000, 5000);
  static const double NORMAL_ICON_SIZE = 30;
  static const double TOGGLE_iCON_SIZE = 50;

  static bool filterToggle = false;

  static Icon hiddenStash = const Icon(
    CustomIcons.hiddenstash,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon safe = const Icon(
    CustomIcons.safe,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon deadScav = const Icon(
    CustomIcons.deadscav,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon cabinet = const Icon(
    CustomIcons.cabinet,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon weaponBox = const Icon(
    CustomIcons.weaponbox,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon grenadeBox = const Icon(
    CustomIcons.grenadebox,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon ammoBox = const Icon(
    CustomIcons.ammobox,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon jacket = const Icon(
    CustomIcons.jacket,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon meds = const Icon(
    CustomIcons.meds,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon pc = const Icon(
    CustomIcons.pc,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon rationCrate = const Icon(
    CustomIcons.rationbox,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon duffleBag = const Icon(
    CustomIcons.dufflebag,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon toolBox = const Icon(
    CustomIcons.toolbox,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon woodenCrate = const Icon(
    CustomIcons.woodencrate,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon lockedRoom = const Icon(
    CustomIcons.lockedroom,
    size: TOGGLE_iCON_SIZE,
  );
  static Icon looseLoot = const Icon(
    CustomIcons.looseloot,
    size: TOGGLE_iCON_SIZE,
  );

  static Icon hiddenStashPin = Icon(
    CustomIcons.hiddenstashpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon safePin = Icon(
    CustomIcons.safepin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon deadScavPin = Icon(
    CustomIcons.dadescavpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon cabinetPin = Icon(
    CustomIcons.cabinetpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon weaponBoxPin = Icon(
    CustomIcons.weaponboxpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon grenadeBoxPin = Icon(
    CustomIcons.grenadeboxpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon ammoBoxPin = Icon(
    CustomIcons.ammoboxpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon jacketPin = Icon(
    CustomIcons.jacketpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon medsPin = Icon(
    CustomIcons.medspin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon pcPin = Icon(
    CustomIcons.pcpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon rationCratePin = Icon(
    CustomIcons.rationcratepin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon duffleBagPin = Icon(
    CustomIcons.dufflebagpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon toolBoxPin = Icon(
    CustomIcons.toolboxpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon woodenCratePin = Icon(
    CustomIcons.woodencratepin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon lockedRoomPin = Icon(
    CustomIcons.lockedroompin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon looseLootPin = Icon(
    CustomIcons.looselootpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );

  static Icon hiddenStashPinPic = Icon(
    CustomIcons.hiddenstashpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon safePinPic = Icon(
    CustomIcons.safepin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon deadScavPinPic = Icon(
    CustomIcons.dadescavpin,
    color: Colors.green[900],
    size: NORMAL_ICON_SIZE,
  );
  static Icon cabinetPinPic = const Icon(
    CustomIcons.cabinetpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon weaponBoxPinPic = const Icon(
    CustomIcons.weaponboxpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon grenadeBoxPinPic = const Icon(
    CustomIcons.grenadeboxpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon ammoBoxPinPic = const Icon(
    CustomIcons.ammoboxpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon jacketPinPic = const Icon(
    CustomIcons.jacketpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon medsPinPic = const Icon(
    CustomIcons.medspin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon pcPinPic = const Icon(
    CustomIcons.pcpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon rationCratePinPic = const Icon(
    CustomIcons.rationcratepin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon duffleBagPinPic = const Icon(
    CustomIcons.toolboxpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon toolBoxPinPic = const Icon(
    CustomIcons.dufflebagpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon woodenCratePinPic = const Icon(
    CustomIcons.woodencratepin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon lockedRoomPinPic = const Icon(
    CustomIcons.lockedroompin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );
  static Icon looseLootPinPic = const Icon(
    CustomIcons.looselootpin,
    color: Colors.black,
    size: NORMAL_ICON_SIZE,
  );

  static Icon allFilter = const Icon(
    CustomIcons.all,
    size: 30,
  );
  static Icon enterBuildingPin = Icon(
    CustomIcons.buildingenterpin,
    color: Colors.yellow[400],
    size: NORMAL_ICON_SIZE,
  );

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
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: Colors.green[400],
          selectedColor: Colors.white,
          fillColor: Colors.green[200],
          selectedBorderColor: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
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
