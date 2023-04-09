import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:testamp/main.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class Factory3F extends StatefulWidget {
  Factory3F({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;

  final String title;

  final List<Facility> _facilityList = [
    Facility(2, 'Factory_3F_Safe1', -655, 218),
    Facility(8, 'Factory_3F_Jacket1', -556, 378),
    Facility(8, 'Factory_3F_Jacket2', -555, 202),
    Facility(8, 'Factory_3F_Jacket3', -555, 188),
    Facility(4, 'Factory_3F_Filing_Cabinet1', -558, 103),
    Facility(4, 'Factory_3F_Filing_Cabinet2', -558, 91),
    Facility(15, 'Factory_3F_Locked_Room1', -548, 357),
  ];

  @override
  _Factory3FState createState() => _Factory3FState();
}

class _Factory3FState extends State<Factory3F> {
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
      point14 = [], //나무 박스 Wooden crate
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

  var size = const Size(3690.0, 2660.0);
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
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
                      //heroTag: 'Filter All',
                      onPressed: () => pressAllButton(),
                      backgroundColor:
                          allToggle ? Colors.green[200] : Colors.black38,
                      foregroundColor:
                          allToggle ? Colors.white : Colors.green[400],
                      child: const Icon(Icons.abc),
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
                          borderRadius: BorderRadius.circular(8),
                          selectedBorderColor: Colors.green,
                          color: Colors.green[400],
                          selectedColor: Colors.white,
                          fillColor: Colors.green[200],
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
                            _createToggleButton(
                                MyApp.hiddenStash), //히든 스태쉬 Hidden Stash
                            _createToggleButton(
                                MyApp.safe), //돈통, 금고 Cash register, Safe
                            _createToggleButton(
                                MyApp.deadScav), //죽은 스캐브 Dead Scav
                            _createToggleButton(
                                MyApp.cabinet), //캐비넷 Filing Cabinet
                            _createToggleButton(
                                MyApp.weaponBox), //무기 박스 Weapon Box
                            _createToggleButton(
                                MyApp.grenadeBox), //수류탄 박스 Grenade Box
                            _createToggleButton(MyApp.ammoBox), //탄 박스 Ammo Box
                            _createToggleButton(MyApp.jacket), //자켓 Jacket
                            _createToggleButton(MyApp.meds), //의약품 Meds
                            _createToggleButton(MyApp.pc), //컴퓨터 본체 PC
                            _createToggleButton(
                                MyApp.rationCrate), //음식 상자 Ration Crate
                            _createToggleButton(
                                MyApp.duffleBag), //더플백 Duffle Bag
                            _createToggleButton(MyApp.toolBox), //공구 박스 Toolbox
                            _createToggleButton(
                                MyApp.woodenCrate), //나무 박스 Wooden crate
                            _createToggleButton(
                                MyApp.lockedRoom), //잠긴 문 Locked Room
                            _createToggleButton(
                                MyApp.looseLoot), //바닥 룻 Loose Loot
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
                  const SizedBox(
                    height: 100,
                  ),
                  FloatingFloorButton(
                    movePage: () => Navigator.pop(context, _filterVisible),
                    up: false,
                    heroTag: 'Factory 2F',
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
    if (scale > 3) {
      print('enLarge');
    }
    Facility facility = data.data;
    switch (facility.facilityId) {
      case 1:
        point1.add(data);
        return Icon(
          MyApp.hiddenStashPin,
          color: Colors.blue,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 2:
        point2.add(data);
        return Icon(
          MyApp.safePin,
          color: Colors.yellow,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 3:
        point3.add(data);
        return Icon(
          MyApp.deadScavPin,
          color: Colors.black,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 4:
        point4.add(data);
        return facility.picture ? MyApp.cabinetPinPic : MyApp.cabinetPin;
      // case 4:
      //   point4.add(data);
      //   return Icon(
      //     MyApp.cabinetPin,
      //     color: Colors.green,
      //     size: widget.NORMAL_ICON_SIZE,
      //   );
      case 5:
        point5.add(data);
        return Icon(
          MyApp.weaponBoxPin,
          color: Colors.red,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 6:
        point6.add(data);
        return Icon(
          MyApp.grenadeBoxPin,
          color: Colors.purple,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 7:
        point7.add(data);
        return Icon(
          MyApp.ammoBoxPin,
          color: const Color.fromARGB(255, 0, 255, 234),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 8:
        point8.add(data);
        return Icon(
          MyApp.jacketPin,
          color: const Color.fromARGB(255, 255, 0, 149),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 9:
        point9.add(data);
        return Icon(
          MyApp.medsPin,
          color: const Color.fromARGB(213, 59, 100, 61),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 10:
        point10.add(data);
        return Icon(
          MyApp.pcPin,
          color: const Color.fromARGB(255, 255, 136, 0),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 11:
        point11.add(data);
        return Icon(
          MyApp.rationCratePin,
          color: const Color.fromARGB(255, 61, 63, 211),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 12:
        point12.add(data);
        return Icon(
          MyApp.duffleBagPin,
          color: const Color.fromARGB(255, 141, 192, 112),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 13:
        point13.add(data);
        return Icon(
          MyApp.toolBoxPin,
          color: const Color.fromARGB(255, 158, 158, 158),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 14:
        point14.add(data);
        return Icon(
          MyApp.woodenCratePin,
          color: const Color.fromARGB(255, 7, 14, 22),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 15:
        point15.add(data);
        return Icon(
          MyApp.lockedRoomPin,
          color: const Color.fromARGB(255, 143, 118, 35),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 16:
        point15.add(data);
        return Icon(
          MyApp.looseLootPin,
          color: const Color.fromARGB(255, 143, 118, 35),
          size: widget.NORMAL_ICON_SIZE,
        );
      default:
        return Container();
    }
  }

  _createToggleButton(IconData icon) {
    return Icon(
      icon,
    );
  }

  _onMarkerClicked(MarkerModel markerModel) {
    print((markerModel.data as Facility).name);
    if ((markerModel.data as Facility).name == 'Dorm') {
      inToBuilding(Dorm01(title: '3Story Dorm 1F'), const Offset(1.0, 0.0));
    } else if ((markerModel.data as Facility).name == 'facility1') {
      return popDialog('tarkov02');
    }
    if ((markerModel.data as Facility).picture) {
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
    final MapContainer map = MapContainer(
      Image.asset('assets/images/factory_3F.png'),
      size,
      markers: _getMarker(widget._facilityList, 3690.0, 2660.0),
      markerWidgetBuilder: _getMarkerWidget,
      onMarkerClicked: _onMarkerClicked,
      onTab: _onTab(size),
    );
    //await Future.delayed(const Duration(milliseconds: 500));
    return map;
  }

  void _update(bool value) {
    setState(() {
      _filterVisible = value;
    });
  }
}
