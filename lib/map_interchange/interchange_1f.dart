import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/main.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:testamp/map_interchange/interchange_2f.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class Interchange_1F extends StatefulWidget {
  Interchange_1F({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;
  final String title;

  final List<Facility> _facilityList = [
    Facility(7, 'Interchange_1F_Ammo_Box1', 1704, 1912),
    Facility(7, 'Interchange_1F_Ammo_Box2', 1001, 1446),
    Facility(7, 'Interchange_1F_Ammo_Box3', -1540, -1965),
    Facility(1, 'Interchange_1F_Hidden_Stash1', 496, 3411),
    Facility(1, 'Interchange_1F_Hidden_Stash2', 2255, 3192),
    Facility(1, 'Interchange_1F_Hidden_Stash3', 2700, 2118),
    Facility(1, 'Interchange_1F_Hidden_Stash4', 3174, -1586),
    Facility(1, 'Interchange_1F_Hidden_Stash5', 1557, -2193),
    Facility(1, 'Interchange_1F_Hidden_Stash6', 1600, -2271),
    Facility(1, 'Interchange_1F_Hidden_Stash7', 160, -2881),
    Facility(1, 'Interchange_1F_Hidden_Stash8', -459, -3171),
    Facility(1, 'Interchange_1F_Hidden_Stash9', -1166, -3157),
    Facility(1, 'Interchange_1F_Hidden_Stash10', -1144, -1965),
    Facility(1, 'Interchange_1F_Hidden_Stash11', -1489, -891),
    Facility(1, 'Interchange_1F_Hidden_Stash12', -3766, 2390),
    Facility(1, 'Interchange_1F_Hidden_Stash13', -3732, 2000),
    Facility(1, 'Interchange_1F_Hidden_Stash14', -3177, 1875),
    Facility(1, 'Interchange_1F_Hidden_Stash15', -2689, 1609),
    Facility(1, 'Interchange_1F_Hidden_Stash16', -2469, 1108),
    Facility(1, 'Interchange_1F_Hidden_Stash17', -849, 2210),
    Facility(1, 'Interchange_1F_Hidden_Stash18', -757, 2621),
    Facility(1, 'Interchange_1F_Hidden_Stash19', -1344, 2931),
    Facility(14, 'Interchange_1F_Wooden_Crate1', 2444, 2238),
    Facility(14, 'Interchange_1F_Wooden_Crate2', 726, -1078),
    Facility(14, 'Interchange_1F_Wooden_Crate3', -1827, 3520),
    Facility(14, 'Interchange_1F_Wooden_Crate4', -1164, 2972),
    Facility(14, 'Interchange_1F_Wooden_Crate5', -397, 2391),
    Facility(14, 'Interchange_1F_Wooden_Crate6', -675, 520),
    Facility(14, 'Interchange_1F_Wooden_Crate7', -1022, 577),
    Facility(14, 'Interchange_1F_Wooden_Crate8', -948, 371),
    Facility(14, 'Interchange_1F_Wooden_Crate9', -1652, 412),
    Facility(3, 'Interchange_1F_Dead_Scav1', 230, -1058),
    Facility(3, 'Interchange_1F_Dead_Scav2', -919, -1257),
    Facility(12, 'Interchange_1F_Duffle_Bag1', 1858, 2922),
    Facility(12, 'Interchange_1F_Duffle_Bag2', 1038, 2132),
    Facility(12, 'Interchange_1F_Duffle_Bag3', 2114, 2010),
    Facility(12, 'Interchange_1F_Duffle_Bag4', 1406, 1699),
    Facility(12, 'Interchange_1F_Duffle_Bag5', 1938, 1614),
    Facility(12, 'Interchange_1F_Duffle_Bag6', 541, 1366),
    Facility(12, 'Interchange_1F_Duffle_Bag7', 1710, 1397),
    Facility(12, 'Interchange_1F_Duffle_Bag8', 2349, 1332),
    Facility(12, 'Interchange_1F_Duffle_Bag9', 629, -193),
    Facility(12, 'Interchange_1F_Duffle_Bag10', 1106, -608),
    Facility(12, 'Interchange_1F_Duffle_Bag11', 1889, -564),
    Facility(12, 'Interchange_1F_Duffle_Bag12', 1917, -1404),
    Facility(12, 'Interchange_1F_Duffle_Bag13', 1459, -1653),
    Facility(12, 'Interchange_1F_Duffle_Bag14', 1285, -2624),
    Facility(12, 'Interchange_1F_Duffle_Bag15', -139, -3208),
    Facility(12, 'Interchange_1F_Duffle_Bag16', -1537, -1943),
    Facility(12, 'Interchange_1F_Duffle_Bag17', -875, -1314),
    Facility(12, 'Interchange_1F_Duffle_Bag18', -1801, -814),
    Facility(12, 'Interchange_1F_Duffle_Bag19', -1021, -312),
    Facility(12, 'Interchange_1F_Duffle_Bag20', -296, 500),
    Facility(12, 'Interchange_1F_Duffle_Bag21', -1843, 780),
    Facility(12, 'Interchange_1F_Duffle_Bag22', -153, 1416),
    Facility(12, 'Interchange_1F_Duffle_Bag23', -158, 1659),
    Facility(12, 'Interchange_1F_Duffle_Bag24', -234, 1942),
    Facility(12, 'Interchange_1F_Duffle_Bag25', -114, 2050),
    Facility(12, 'Interchange_1F_Duffle_Bag26', -199, 2244),
    Facility(4, 'Interchange_1F_Filing Cabinet1', 2252, 3007),
    Facility(6, 'Interchange_1F_Grenade_Box1', 1261, 1447),
    Facility(6, 'Interchange_1F_Grenade_Box2', 1997, 477),
    Facility(6, 'Interchange_1F_Grenade_Box3', 1145, -586),
    Facility(6, 'Interchange_1F_Grenade_Box4', 686, -635),
    Facility(6, 'Interchange_1F_Grenade_Box5', -252, 1663),
    Facility(8, 'Interchange_1F_Jacket1', 2343, 2985),
    Facility(8, 'Interchange_1F_Jacket2', 2260, 2876),
    Facility(8, 'Interchange_1F_Jacket3', 2260, 2869),
    Facility(8, 'Interchange_1F_Jacket4', 2254, 2876),
    Facility(8, 'Interchange_1F_Jacket5', 2254, 2869),
    Facility(8, 'Interchange_1F_Jacket6', -2869, 2897),
    Facility(9, 'Interchange_1F_Meds', 1588, 2297),
    Facility(10, 'Interchange_1F_PC1', 2396, 2995),
    Facility(10, 'Interchange_1F_PC2', 2335, 2986),
    Facility(10, 'Interchange_1F_PC3', 2290, 3011),
    Facility(13, 'Interchange_1F_Tool_Box1', 2333, 2908),
    Facility(13, 'Interchange_1F_Tool_Box2', 2302, 2885),
    Facility(13, 'Interchange_1F_Tool_Box3', 2334, 2873),
    Facility(13, 'Interchange_1F_Tool_Box4', 2615, 2498),
    Facility(13, 'Interchange_1F_Tool_Box5', 2712, 2454),
    Facility(5, 'Interchange_1F_Weapon_Box1', 916, 3289),
    Facility(5, 'Interchange_1F_Weapon_Box2', 86, 2270),
    Facility(5, 'Interchange_1F_Weapon_Box3', 1024, 2417),
    Facility(5, 'Interchange_1F_Weapon_Box4', 1345, 2456),
    Facility(5, 'Interchange_1F_Weapon_Box5', 1610, 2346),
    Facility(5, 'Interchange_1F_Weapon_Box6', 2444, 2284),
    Facility(5, 'Interchange_1F_Weapon_Box7', 2709, 2435),
    Facility(5, 'Interchange_1F_Weapon_Box8', 999, 2040),
    Facility(5, 'Interchange_1F_Weapon_Box9', 1433, 1821),
    Facility(5, 'Interchange_1F_Weapon_Box10', 2086, 1616),
    Facility(5, 'Interchange_1F_Weapon_Box11', 1438, 1450),
    Facility(5, 'Interchange_1F_Weapon_Box12', 1257, 1309),
    Facility(5, 'Interchange_1F_Weapon_Box13', 1886, 1242),
    Facility(5, 'Interchange_1F_Weapon_Box14', 234, 981),
    Facility(5, 'Interchange_1F_Weapon_Box15', 170, 851),
    Facility(5, 'Interchange_1F_Weapon_Box16', 564, 540),
    Facility(5, 'Interchange_1F_Weapon_Box17', 747, 540),
    Facility(5, 'Interchange_1F_Weapon_Box18', 401, 324),
    Facility(5, 'Interchange_1F_Weapon_Box19', 529, 194),
    Facility(5, 'Interchange_1F_Weapon_Box20', 1970, 160),
    Facility(5, 'Interchange_1F_Weapon_Box21', 2082, 102),
    Facility(5, 'Interchange_1F_Weapon_Box22', 2165, 160),
    Facility(5, 'Interchange_1F_Weapon_Box23', 1, 1449),
    Facility(5, 'Interchange_1F_Weapon_Box24', 534, -246),
    Facility(5, 'Interchange_1F_Weapon_Box25', 827, -369),
    Facility(5, 'Interchange_1F_Weapon_Box26', 938, -484),
    Facility(5, 'Interchange_1F_Weapon_Box27', 938, -501),
    Facility(5, 'Interchange_1F_Weapon_Box28', 914, -501),
    Facility(5, 'Interchange_1F_Weapon_Box29', 778, -998),
    Facility(5, 'Interchange_1F_Weapon_Box30', 1049, -1062),
    Facility(5, 'Interchange_1F_Weapon_Box31', 1516, -1217),
    Facility(5, 'Interchange_1F_Weapon_Box32', 712, -1377),
    Facility(5, 'Interchange_1F_Weapon_Box33', 184, -2278),
    Facility(5, 'Interchange_1F_Weapon_Box34', 2786, -2003),
    Facility(5, 'Interchange_1F_Weapon_Box35', -919, -1233),
    Facility(5, 'Interchange_1F_Weapon_Box36', -682, -2405),
    Facility(5, 'Interchange_1F_Weapon_Box37', -682, -2424),
    Facility(5, 'Interchange_1F_Weapon_Box38', -148, 8),
    Facility(5, 'Interchange_1F_Weapon_Box39', -172, 1308),
    Facility(5, 'Interchange_1F_Weapon_Box40', -1164, 3262),
    Facility(15, 'Interchange_1F_Locked_Room1', 1024, 2369),
    Facility(15, 'Interchange_1F_Locked_Room2', 2454, 2263),
    Facility(15, 'Interchange_1F_Locked_Room3', 981, -512),
    Facility(15, 'Interchange_1F_Locked_Room4', -682, -2365),
    Facility(15, 'Interchange_1F_Locked_Room5', -84, 2048),
    Facility(16, 'Interchange_1F_Loose_Loot1', -14, 2101), //레덱스
    Facility(16, 'Interchange_1F_Loose_Loot2', 2318, 2989), //전자제품
  ];

  @override
  _Interchange_1FState createState() => _Interchange_1FState();
}

class _Interchange_1FState extends State<Interchange_1F> {
  bool allToggle = true;
  bool _filterVisible = MyApp.filterToggle;
  final List<bool> selections = List.generate(16, (index) => true);
  var size = const Size(8000.0, 8000.0);
  String imageName = 'interchange_1F.png';
  String imageName2 = 'interchange_2F.png';
  String imageName3 = 'interchange_3F.png';

  Future<Image> downloadMap() async {
    final ref = FirebaseStorage.instance.ref().child('Customs/$imageName');
    final ref2 = FirebaseStorage.instance.ref().child('Customs/$imageName2');
    final ref3 = FirebaseStorage.instance.ref().child('Customs/$imageName3');
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    if (!await File('$path/$imageName2').exists()) {
      await ref2.writeToFile(File('$path/$imageName2'));
    }
    if (!await File('$path/$imageName3').exists()) {
      await ref3.writeToFile(File('$path/$imageName3'));
    }

    if (await File('$path/$imageName').exists()) {
      return Image.file(File('$path/$imageName'));
    } else {
      await ref.writeToFile(File('$path/$imageName'));
      return Image.file(File('$path/$imageName'));
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  late List<MarkerModel> point1 = [], //히든 스태쉬 Hidden Stash
      point2 = [], //돈통, 금고 Cash register, Safe
      point3 = [], //죽은 스캐브 Dead Scav
      point4 = [], //캐비넷 Filing Cabinet
      point5 = [], //무기 박스 Weapon Box
      point6 = [], //수류탄 박스 Grenade Box
      point7 = [], //탄 박스 Ammo Box
      point8 = [], //자켓 Jacket
      point9 = [], //의약품 Meds
      point10 = [], //컴퓨터 본체 PC
      point11 = [], //음식 상자 Ration Crate
      point12 = [], //더플백 Duffle Bag
      point13 = [], //공구 박스 Toolbox
      point14 = [], //나무 박스 Wooden Crate
      point15 = [], //잠긴 문 Locked Room
      point16 = []; //바닥 룻 Loose Loot

  void lootFilter(int index) {
    setState(() {
      if (index == 0) {
        if (selections[index]) {
          for (var point in point1) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point1) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 1) {
        if (selections[index]) {
          for (var point in point2) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point2) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 2) {
        if (selections[index]) {
          for (var point in point3) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point3) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 3) {
        if (selections[index]) {
          for (var point in point4) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point4) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 4) {
        if (selections[index]) {
          for (var point in point5) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point5) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 5) {
        if (selections[index]) {
          for (var point in point6) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point6) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 6) {
        if (selections[index]) {
          for (var point in point7) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point7) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 7) {
        if (selections[index]) {
          for (var point in point8) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point8) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 8) {
        if (selections[index]) {
          for (var point in point9) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point9) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 9) {
        if (selections[index]) {
          for (var point in point10) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point10) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 10) {
        if (selections[index]) {
          for (var point in point11) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point11) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 11) {
        if (selections[index]) {
          for (var point in point12) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point12) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 12) {
        if (selections[index]) {
          for (var point in point13) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point13) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 13) {
        if (selections[index]) {
          for (var point in point14) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point14) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 14) {
        if (selections[index]) {
          for (var point in point15) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point15) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 15) {
        if (selections[index]) {
          for (var point in point16) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point16) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      }
      for (int i = 0; i < selections.length; i++) {
        if (selections[i] == false) {
          allToggle = false;
          break;
        }
      }
      if (!allToggle) {
        for (int i = 0; i < selections.length; i++) {
          if (selections[i] == true) {
            if (i == selections.length - 1) {
              allToggle = true;
            }
            continue;
          } else {
            break;
          }
        }
      }
    });
  }

  void pressFilterButton() {
    setState(() {
      MyApp.filterToggle = !MyApp.filterToggle;
      _filterVisible = MyApp.filterToggle;
    });
  }

  void pressAllButton() {
    if (_filterVisible) {
      setState(() {
        allToggle = !allToggle;
        if (allToggle) {
          for (int i = 0; i < selections.length; i++) {
            selections[i] = true;
          }
        } else {
          for (int i = 0; i < selections.length; i++) {
            selections[i] = false;
          }
        }
      });
      for (int i = 0; i < selections.length; i++) {
        lootFilter(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder(
        future: downloadMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FutureBuilder<MapContainer>(
                  future: _loadImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MapContainer(
                        snapshot.data!.child,
                        snapshot.data!.size,
                        markers: snapshot.data!.markers,
                        markerWidgetBuilder: snapshot.data!.markerWidgetBuilder,
                        onMarkerClicked: snapshot.data!.onMarkerClicked,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: AnimatedOpacity(
                    opacity: _filterVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 350),
                    child: Column(
                      children: [
                        FloatingActionButton.small(
                          heroTag: 'Filter All',
                          onPressed: () => pressAllButton(),
                          backgroundColor:
                              allToggle ? Colors.green[200] : Colors.black38,
                          foregroundColor:
                              allToggle ? Colors.white : Colors.green[400],
                          child: MyApp.allFilter,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ToggleButtons(
                              borderRadius: Theme.of(context)
                                  .toggleButtonsTheme
                                  .borderRadius,
                              selectedBorderColor: Theme.of(context)
                                  .toggleButtonsTheme
                                  .selectedBorderColor,
                              color: Theme.of(context).toggleButtonsTheme.color,
                              selectedColor: Theme.of(context)
                                  .toggleButtonsTheme
                                  .selectedColor,
                              fillColor: Theme.of(context)
                                  .toggleButtonsTheme
                                  .fillColor,
                              isSelected: selections,
                              onPressed: (int index) {
                                if (_filterVisible) {
                                  setState(
                                    () {
                                      selections[index] = !selections[index];
                                      lootFilter(index);
                                    },
                                  );
                                }
                              },
                              children: [
                                MyApp.hiddenStash, //히든 스태쉬 Hidden Stash
                                MyApp.safe, //돈통, 금고 Cash register, Safe
                                MyApp.deadScav, //죽은 스캐브 Dead Scav
                                MyApp.cabinet,
                                MyApp.weaponBox, //무기 박스 Weapon Box
                                MyApp.grenadeBox, //수류탄 박스 Grenade Box
                                MyApp.ammoBox, //탄 박스 Ammo Box
                                MyApp.jacket, //자켓 Jacket
                                MyApp.meds, //의약품 Meds
                                MyApp.pc, //컴퓨터 본체 PC
                                MyApp.rationCrate, //음식 상자 Ration Crate
                                MyApp.duffleBag, //더플백 Duffle Bag
                                MyApp.toolBox, //공구 박스 Toolbox
                                MyApp.woodenCrate, //나무 박스 Wooden crate
                                MyApp.lockedRoom, //잠긴 문 Locked Room
                                MyApp.looseLoot, //바닥 룻 Loose Loot
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FloatingFilterButton(
                    onPressed: pressFilterButton,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingFloorButton(
                        movePage: () => inToBuilding(
                            Interchange_2F(
                              title: 'Interchange F1',
                            ),
                            const Offset(0.0, -1.0)),
                        up: true,
                        heroTag: 'Interchange 1F',
                      ),
                      const TextFloor(floor: 1),
                      FloatingFloorButton.isNull(
                        up: false,
                        heroTag: 'Interchange B1',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Downloading Map...'),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<MarkerModel> _getMarker(List<Facility> facilities, double x, double y) {
    List<MarkerModel> result = [];
    print('x = $x, y = $y');
    for (var element in facilities) {
      double dx = x / 2 + element.lng;
      double dy = y / 2 - element.lat;
      // offset from left top
      result.add(MarkerModel(element, Offset(dx, dy)));
    }
    return result;
  }

  Widget _getMarkerWidget(double scale, MarkerModel data) {
    if (scale > 3) {
      print('enLarge');
    }
    Facility facility = data.data;
    switch (facility.facilityId) {
      case 1:
        point1.add(data);
        return facility.picture
            ? MyApp.hiddenStashPinPic
            : MyApp.hiddenStashPin;
      case 2:
        point2.add(data);
        return facility.picture ? MyApp.safePinPic : MyApp.safePin;
      case 3:
        point3.add(data);
        return facility.picture ? MyApp.deadScavPinPic : MyApp.deadScavPin;
      case 4:
        point4.add(data);
        return facility.picture ? MyApp.cabinetPinPic : MyApp.cabinetPin;
      case 5:
        point5.add(data);
        return facility.picture ? MyApp.weaponBoxPinPic : MyApp.weaponBoxPin;
      case 6:
        point6.add(data);
        return facility.picture ? MyApp.grenadeBoxPinPic : MyApp.grenadeBoxPin;
      case 7:
        point7.add(data);
        return facility.picture ? MyApp.ammoBoxPinPic : MyApp.ammoBoxPin;
      case 8:
        point8.add(data);
        return facility.picture ? MyApp.jacketPinPic : MyApp.jacketPin;
      case 9:
        point9.add(data);
        return facility.picture ? MyApp.medsPinPic : MyApp.medsPin;
      case 10:
        point10.add(data);
        return facility.picture ? MyApp.pcPinPic : MyApp.pcPin;
      case 11:
        point11.add(data);
        return facility.picture
            ? MyApp.rationCratePinPic
            : MyApp.rationCratePin;
      case 12:
        point12.add(data);
        return facility.picture ? MyApp.duffleBagPinPic : MyApp.duffleBagPin;
      case 13:
        point13.add(data);
        return facility.picture ? MyApp.toolBoxPinPic : MyApp.toolBoxPin;
      case 14:
        point14.add(data);
        return facility.picture
            ? MyApp.woodenCratePinPic
            : MyApp.woodenCratePin;
      case 15:
        point15.add(data);
        return facility.picture ? MyApp.lockedRoomPinPic : MyApp.lockedRoomPin;
      case 16:
        point16.add(data);
        return facility.picture ? MyApp.looseLootPinPic : MyApp.looseLootPin;

      default:
        return Container();
    }
  }

  _onMarkerClicked(MarkerModel markerModel) {
    print((markerModel.data as Facility).name);
    if ((markerModel.data as Facility).name == 'Dorm') {
      inToBuilding(Dorm01(title: '3Story Dorm 1F'), const Offset(1.0, 0.0));
    }
    if ((markerModel.data as Facility).picture) {
      if ((markerModel.data as Facility).name == 'Factory_1F_Wooden_Crate5') {
        return popDialog('Factory_1F_Wooden_Crate4');
      } else if ((markerModel.data as Facility).name ==
          'Factory_1F_Wooden_Crate2') {
        return popDialog('Factory_1F_Jacket1');
      } else if ((markerModel.data as Facility).name == 'Factory_1F_Jacket2') {
        return popDialog('Factory_1F_Jacket1');
      }
      return popDialog((markerModel.data as Facility).name);
    }
  }

  Future<dynamic> popDialog(String imgName) {
    return showDialog(
      context: context,
      builder: (context) {
        return MarkerClickBox(
          imgName: imgName,
        );
      },
    );
  }

  void inToBuilding(Widget widget, Offset offset) {
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => widget),
    ).then((value) => _update(value));
  }

  _onTab(Size size) {}

  Future<MapContainer> _loadImage() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final MapContainer map = MapContainer(
      //Image.asset('assets/images/interchange_1F.png'),
      Image.file(File('$path/$imageName')),
      size,
      markers: _getMarker(widget._facilityList, 8000.0, 8000.0),
      markerWidgetBuilder: _getMarkerWidget,
      onMarkerClicked: _onMarkerClicked,
      onTab: _onTab(size),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    return map;
  }

  void _update(bool value) {
    setState(() {
      _filterVisible = value;
    });
  }
}
