import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/main.dart';
import 'package:testamp/map_customs/Customs_3F.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class Customs2F extends StatefulWidget {
  Customs2F({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;
  final String title;

  final List<Facility> _facilityList = [
    //나무박스
    Facility(14, 'Customs_2F_Wooden Crate1', 2468, -245),
    Facility(14, 'Customs_2F_Wooden Crate2', 437, 1013),
    Facility(14, 'Customs_2F_Wooden Crate3', 425, 1014),
    Facility(14, 'Customs_2F_Wooden Crate4', 87, 1131),
    Facility(14, 'Customs_2F_Wooden Crate5', 75, 1102),
    Facility(14, 'Customs_2F_Wooden Crate6', 61, 1102),
    //더플백
    Facility(12, 'Customs_2F_Duffle_Bag1', 193, 1108),
    Facility(12, 'Customs_2F_Duffle_Bag2', 108, 948),
    //캐비넷
    Facility(4, 'Customs_2F_Filing_Cabinet1', 433, 868),
    Facility(4, 'Customs_2F_Filing_Cabinet2', 372, 825),
    Facility(4, 'Customs_2F_Filing_Cabinet3', 365, 826),
    Facility(4, 'Customs_2F_Filing_Cabinet4', -511, -1028),
    Facility(4, 'Customs_2F_Filing_Cabinet5', -517, -1029),
    //자켓
    Facility(8, 'Customs_2F_Jacket1', 2530, -461),
    Facility(8, 'Customs_2F_Jacket2', 2485, -480),
    Facility(8, 'Customs_2F_Jacket3', 2478, -294),
    Facility(8, 'Customs_2F_Jacket4', 2477, -300),
    Facility(8, 'Customs_2F_Jacket5', 204, 1163),
    Facility(8, 'Customs_2F_Jacket6', 206, 1173),
    Facility(8, 'Customs_2F_Jacket7', 191, 1092),
    Facility(8, 'Customs_2F_Jacket8', 51, 940),
    Facility(8, 'Customs_2F_Jacket9', 112, 963),
    Facility(8, 'Customs_2F_Jacket10', 58, 939),
    Facility(8, 'Customs_2F_Jacket11', 406, 847),
    Facility(8, 'Customs_2F_Jacket12', 413, 846),
    Facility(8, 'Customs_2F_Jacket13', 449, 1006),
    Facility(8, 'Customs_2F_Jacket14', 357, 992),
    Facility(8, 'Customs_2F_Jacket15', 444, 1006),
    Facility(8, 'Customs_2F_Jacket16', 351, 992),
    //의약품
    Facility(9, 'Customs_2F_Meds1', 2505, -493),
    Facility(9, 'Customs_2F_Meds2', 284, -882),
    Facility(9, 'Customs_2F_Meds3', 197, -805),
    //본체
    Facility(10, 'Customs_2F_PC1', 38, 976),
    Facility(10, 'Customs_2F_PC2', 2498, -422),
    Facility(10, 'Customs_2F_PC3', 2482, -420),
    //음식 상자
    Facility(11, 'Customs_2F_Ration_Crate1', 185, -590),
    //금고
    Facility(2, 'Customs_2F_Safe1', 85, 1193),
    Facility(2, 'Customs_2F_Safe2', 50, 947),
    //공구 박스
    Facility(13, 'Customs_2F_Toolbox1', 264, -728),
    Facility(13, 'Customs_2F_Toolbox2', 235, -778),
    Facility(13, 'Customs_2F_Toolbox3', 2417, -495),
    Facility(13, 'Customs_2F_Toolbox4', 2440, -484),
    //잠긴 문
    Facility(15, 'Customs_2F_Locked_Room1', 201, 1119),
    Facility(15, 'Customs_2F_Locked_Room2', 179, 1122),
    Facility(15, 'Customs_2F_Locked_Room3', 89, 1186),
    Facility(15, 'Customs_2F_Locked_Room4', 66, 953),
    Facility(15, 'Customs_2F_Locked_Room5', 85, 951),
    Facility(15, 'Customs_2F_Locked_Room6', 404, 887),
    //무기 박스
    Facility(5, 'Customs_2F_Weapon_Box1', 1042, -358),
    Facility(5, 'Customs_2F_Weapon_Box2', 438, 1036),
    Facility(5, 'Customs_2F_Weapon_Box3', 55, 1094),
    //바닥 룻
    Facility(16, 'Customs_2F_Loose_Loot1', 2499, -317), //롤렉스
    Facility(16, 'Customs_2F_Loose_Loot2', 2487, -417), //글카
    Facility(16, 'Customs_2F_Loose_Loot3', -511, -989), //인텔
    Facility(16, 'Customs_2F_Loose_Loot4', -506, -1012), //인텔
    Facility(16, 'Customs_2F_Loose_Loot5', -516, -961), //인텔
    Facility(16, 'Customs_2F_Loose_Loot6', -523, -928), //인텔
    Facility(16, 'Customs_2F_Loose_Loot7', -533, -949), //인텔
    Facility(16, 'Customs_2F_Loose_Loot8', -527, -979), //인텔
    Facility(16, 'Customs_2F_Loose_Loot9', 2453, -312), //귀금속
    Facility(16, 'Customs_2F_Loose_Loot4', 2479, -247), //수리 키트
  ];

  @override
  _Customs2FState createState() => _Customs2FState();
}

class _Customs2FState extends State<Customs2F> {
  bool allToggle = true;
  bool _filterVisible = MyApp.filterToggle;
  var size = const Size(8000.0, 8000.0);
  final List<bool> selections = List.generate(16, (index) => true);
  String imageName = 'customs_2F.png';

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _filterVisible);
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
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
                          borderRadius:
                              Theme.of(context).toggleButtonsTheme.borderRadius,
                          selectedBorderColor: Theme.of(context)
                              .toggleButtonsTheme
                              .selectedBorderColor,
                          color: Theme.of(context).toggleButtonsTheme.color,
                          selectedColor: Theme.of(context)
                              .toggleButtonsTheme
                              .selectedColor,
                          fillColor:
                              Theme.of(context).toggleButtonsTheme.fillColor,
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
                        Customs3F(
                          title: 'Customs 3F',
                        ),
                        const Offset(0.0, -1.0)),
                    up: true,
                    heroTag: 'Customs 2F',
                  ),
                  const TextFloor(floor: 2),
                  FloatingFloorButton(
                    movePage: () => Navigator.pop(context, _filterVisible),
                    up: false,
                    heroTag: 'Customs 1F',
                  ),
                ],
              ),
            ),
          ],
        ),
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
      //Image.asset('assets/images/customs_2F.png'),
      Image.file(File('$path/$imageName')),
      size,
      markers: _getMarker(widget._facilityList, 8000.0, 8000.0),
      markerWidgetBuilder: _getMarkerWidget,
      onMarkerClicked: _onMarkerClicked,
      onTab: _onTab(size),
    );
    return map;
  }

  void _update(bool value) {
    setState(() {
      _filterVisible = value;
    });
  }
}
