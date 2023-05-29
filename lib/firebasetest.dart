import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/widgets/custom_widgets.dart';

import 'main.dart';
import 'map_customs/Customs_B1.dart';
import 'map_customs/customs_2F.dart';
import 'map_customs/dorm/3story_dorm_1.dart';
import 'widgets/facility_model.dart';

class FirebaseTest extends StatefulWidget {
  FirebaseTest({super.key});

  @override
  State<FirebaseTest> createState() => _FirebaseTestState();
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;

  final List<Facility> _facilityList = [
    //나무 박스
    Facility(14, 'Customs_1F_Wooden_Crate15', -2389, -908),
    Facility(14, 'Customs_1F_Wooden_Crate16', -2986, -466),
    Facility(14, 'Customs_1F_Wooden_Crate17', -3031, -468),
    Facility(14, 'Customs_1F_Wooden_Crate18', 1413, 78),
    //탄약 박스
    Facility(7, 'Customs_1F_Ammo_Box7', 363, 896),
    //히든 스태쉬
    Facility.pic(1, 'Customs_1F_Hidden_Stash20', 213, -1375),
    Facility.pic(1, 'Customs_1F_Hidden_Stash21', -383, -491),
    Facility.pic(1, 'Customs_1F_Hidden_Stash22', -1268, -426),
    Facility.pic(1, 'Customs_1F_Hidden_Stash23', -1316, -613),
    //데드 스캐브
    Facility(3, 'Customs_1F_Dead_Scav6', -485, -902),
    Facility(3, 'Customs_1F_Dead_Scav7', -2677, -675),
    //더플백
    Facility(12, 'Customs_1F_Duffle_Bag25', -2679, -985),
    //캐비넷
    Facility(4, 'Customs_1F_Filing_Cabinet1', 1211, -9),
    Facility(4, 'Customs_1F_Filing_Cabinet6', -2163, -1106),
    //수류탄 박스
    Facility(6, 'Customs_1F_Grenade_Box1', 2570, 93),
    Facility(6, 'Customs_1F_Grenade_Box4', 2570, 93),
    //자켓
    Facility(8, 'Customs_1F_Jacket8', 118, 977),
    //의약품
    Facility(9, 'Customs_1F_Meds1', 428, 1036),
    Facility(9, 'Customs_1F_Meds2', 2035, 712),
    Facility(9, 'Customs_1F_Meds3', 1582, 278),
    Facility(9, 'Customs_1F_Meds9', -2282, -170),
    Facility(9, 'Customs_1F_Meds10', -2612, -986),
    Facility(10, 'Customs_1F_PC9', -2210, -542),
    //금고
    Facility(2, 'Customs_1F_Safe1', 365, 874),
    Facility(2, 'Customs_1F_Safe2', 377, 1056),
    //공구 박스
    Facility(13, 'Customs_1F_Toolbox1', 2768, -703),
    //잠긴 문
    Facility(15, 'Customs_1F_Locked_Room8', 85, 1144),
    //무기 박스
    Facility(5, 'Customs_1F_Weapon_Box1', 351, 930),
    //바닥 룻
    Facility(16, 'Customs_1F_Loose_Loot1', 2072, 36), //글카
    Facility(16, 'Customs_1F_Loose_Loot2', 1559, 300), //글카
  ];
}

class _FirebaseTestState extends State<FirebaseTest> {
  String imageName = 'customs_1F.png';

  Future<Image> downloadMap() async {
    final ref = FirebaseStorage.instance.ref().child('Customs/$imageName');
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    if (await File('$path/$imageName').exists()) {
      return Image.file(File('$path/$imageName'));
    } else {
      await ref.writeToFile(File('$path/$imageName'));
      return Image.file(File('$path/$imageName'));
    }
  }

  Future<MapContainer> _loadImage() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final MapContainer map = MapContainer(
      //Image.asset('assets/images/customs_1F.png'),
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

  bool allToggle = true;
  bool _filterVisible = MyApp.filterToggle;
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

  final List<bool> selections = List.generate(16, (index) => true);
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

  var size = const Size(8000.0, 8000.0);
  @override
  Widget build(BuildContext context) {
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
                            Customs2F(
                              title: 'Customs 2F',
                            ),
                            const Offset(0.0, -1.0)),
                        up: true,
                        heroTag: 'Customs 1F',
                      ),
                      const TextFloor(floor: 1),
                      FloatingFloorButton(
                        movePage: () => inToBuilding(
                            CustomsB1(
                              title: 'Customs B1',
                            ),
                            const Offset(0, 1.0)),
                        up: false,
                        heroTag: 'Customs B1',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
      ),
    );
  }

  List<MarkerModel> _getMarker(List<Facility> facilities, double x, double y) {
    List<MarkerModel> result = [];
    for (var element in facilities) {
      double dx = x / 2 + element.lng;
      double dy = y / 2 - element.lat;
      // offset from left top
      result.add(MarkerModel(element, Offset(dx, dy)));
    }
    return result;
  }

  Widget _getMarkerWidget(double scale, MarkerModel data) {
    if (scale > 3) {}
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

  _createToggleButton(IconData icon) {
    return Icon(
      icon,
    );
  }

  _createToggleButton2(Icon icon) {
    return icon;
  }

  _onMarkerClicked(MarkerModel markerModel) {
    print((markerModel.data as Facility).name);
    if ((markerModel.data as Facility).name == 'Dorm') {
      inToBuilding(Dorm01(title: '3Story Dorm 1F'), const Offset(1.0, 0.0));
    }
    if ((markerModel.data as Facility).picture) {
      if ((markerModel.data as Facility).name == 'Customs_1F_Hidden_Stash4') {
        return popDialog('Customs_1F_Hidden_Stash4');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash6') {
        return popDialog('Customs_1F_Hidden_Stash6');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash3') {
        return popDialog('Customs_1F_Hidden_Stash3');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash5') {
        return popDialog('Customs_1F_Hidden_Stash5');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash7') {
        return popDialog('Customs_1F_Hidden_Stash7');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash8') {
        return popDialog('Customs_1F_Hidden_Stash8');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash9') {
        return popDialog('Customs_1F_Hidden_Stash9');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash10') {
        return popDialog('Customs_1F_Hidden_Stash10');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash11') {
        return popDialog('Customs_1F_Hidden_Stash11');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash12') {
        return popDialog('Customs_1F_Hidden_Stash12');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash13') {
        return popDialog('Customs_1F_Hidden_Stash13');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash1') {
        return popDialog('Customs_1F_Hidden_Stash1');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash2') {
        return popDialog('Customs_1F_Hidden_Stash2');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash18') {
        return popDialog('Customs_1F_Hidden_Stash18');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash19') {
        return popDialog('Customs_1F_Hidden_Stash19');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash20') {
        return popDialog('Customs_1F_Hidden_Stash20');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash17') {
        return popDialog('Customs_1F_Hidden_Stash17');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash16') {
        return popDialog('Customs_1F_Hidden_Stash16');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash14') {
        return popDialog('Customs_1F_Hidden_Stash14');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash15') {
        return popDialog('Customs_1F_Hidden_Stash15');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash21') {
        return popDialog('Customs_1F_Hidden_Stash21');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash23') {
        return popDialog('Customs_1F_Hidden_Stash23');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Hidden_Stash22') {
        return popDialog('Customs_1F_Hidden_Stash22');
      } else if ((markerModel.data as Facility).name ==
          'Customs_1F_Loose_Loot15') {
        return popDialog('Customs_1F_Loose_Loot15');
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(url),
  //           ElevatedButton(
  //             onPressed: () {
  //               testBtn();
  //             },
  //             child: const Text('URL받기'),
  //           ),
  //           FutureBuilder(
  //             future: loadMap(),
  //             builder: (context, snapshot) {
  //               if (snapshot.hasData) {
  //                 return snapshot.data!;
  //               } else {
  //                 return const CircularProgressIndicator();
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

//FutreBuilder를 사용, futre = loadMap(), builder = FutureBuilder(future = MapContainer)