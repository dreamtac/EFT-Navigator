import 'package:flutter/material.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:flutter/services.dart';
import 'package:testamp/widgets/custom_widgets.dart';

class CustomsFullMap extends StatefulWidget {
  CustomsFullMap({Key? key, required this.title}) : super(key: key);
  final Size ENABLE_ICON_SIZE = const Size(35, 35);
  final Size DISABLE_ICON_SIZE = const Size(5000, 5000);
  final double NORMAL_ICON_SIZE = 35;

  final String title;
  final List<Facility> _facilityList = [
    Facility(1, "facility1", 0, 0), // center
    Facility(2, "facility2", -100, 0),
    Facility(3, "facility3", 100, 0),
    Facility(4, "Dorm", 0, -100),
    Facility(5, "facility5", 0, 100),
    Facility(1, 'Test1', 300, 453),
    Facility(1, 'Test2', 700, -153),
    Facility(1, 'Test3', -200, -183),
    Facility(6, 'Test4', -300, 400),
    Facility(7, 'Test4', -300, 820),
    Facility(8, 'Test4', 300, 1053),
    Facility(9, 'Test4', 500, 7.2),
    Facility(10, 'Test4', 440, 370),
    Facility(11, 'Test4', 550, -100),
    Facility(12, 'Test4', -480, 453),
    Facility(13, 'Test4', 210, -200),
    Facility(14, 'Test4', -710, -753),
    Facility(15, 'Test4', 380, 453),
  ];

  @override
  _CustomsFullMapState createState() => _CustomsFullMapState();
}

class _CustomsFullMapState extends State<CustomsFullMap> {
  late List<MarkerModel> point1 = [],
      point2 = [],
      point3 = [],
      point4 = [],
      point5 = [],
      point6 = [],
      point7 = [],
      point8 = [],
      point9 = [],
      point10 = [],
      point11 = [],
      point12 = [],
      point13 = [],
      point14 = [],
      point15 = [];
  void lootFilter(int index) {
    setState(() {
      if (index == 0) {
        if (_selections[index]) {
          for (var point in point1) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point1) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 1) {
        if (_selections[index]) {
          for (var point in point2) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point2) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 2) {
        if (_selections[index]) {
          for (var point in point3) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point3) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 3) {
        if (_selections[index]) {
          for (var point in point4) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point4) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 4) {
        if (_selections[index]) {
          for (var point in point5) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point5) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 5) {
        if (_selections[index]) {
          for (var point in point6) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point6) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 6) {
        if (_selections[index]) {
          for (var point in point7) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point7) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 7) {
        if (_selections[index]) {
          for (var point in point8) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point8) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 8) {
        if (_selections[index]) {
          for (var point in point9) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point9) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 9) {
        if (_selections[index]) {
          for (var point in point10) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point10) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 10) {
        if (_selections[index]) {
          for (var point in point11) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point11) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 11) {
        if (_selections[index]) {
          for (var point in point12) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point12) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 12) {
        if (_selections[index]) {
          for (var point in point13) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point13) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 13) {
        if (_selections[index]) {
          for (var point in point14) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point14) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      } else if (index == 14) {
        if (_selections[index]) {
          for (var point in point15) {
            point.size = widget.ENABLE_ICON_SIZE;
          }
        } else {
          for (var point in point15) {
            point.size = widget.DISABLE_ICON_SIZE;
          }
        }
      }
    });
  }

  final List<bool> _selections = List.generate(15, (index) => true);
  bool _filterVisible = false;
  var size = const Size(3690.0, 2100.0);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
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
            left: 5,
            bottom: 0,
            child: AnimatedOpacity(
              opacity: _filterVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 350),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(8),
                  selectedBorderColor: Colors.green,
                  color: Colors.green[400],
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                      lootFilter(index);
                    });
                  },
                  children: [
                    _createToggleButton(Icons.attach_money_rounded),
                    _createToggleButton(
                        Icons.business_center_rounded), //히든 스태쉬 Hidden Stash
                    _createToggleButton(
                        Icons.work_outline_rounded), //돈통 Cash register
                    _createToggleButton(
                        Icons.work_outline_rounded), //죽은 스캐브 Dead Scav
                    _createToggleButton(
                        Icons.work_outline_rounded), //캐비넷 Filing Cabinet
                    _createToggleButton(Icons.work_outline_rounded), //금고 Safe
                    _createToggleButton(
                        Icons.work_outline_rounded), //수류탄 박스 Grenade Box
                    _createToggleButton(
                        Icons.work_outline_rounded), //탄 박스 Ammo Box
                    _createToggleButton(Icons.work_outline_rounded), //자켓 Jacket
                    _createToggleButton(Icons.work_outline_rounded), //의약품 Meds
                    _createToggleButton(Icons.work_outline_rounded), //컴퓨터 본체 PC
                    _createToggleButton(
                        Icons.work_outline_rounded), //음식 Ration Crate
                    _createToggleButton(
                        Icons.work_outline_rounded), //더플백 Duffle Bag
                    _createToggleButton(
                        Icons.work_outline_rounded), //공구 박스 Toolbox
                    _createToggleButton(
                        Icons.work_outline_rounded), //나무 박스 Wooden crate
                  ],
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _filterVisible = !_filterVisible;
              });
            },
            tooltip: 'Toggle Opacity',
            child: const Icon(Icons.menu_outlined),
          ),
        ],
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
          Icons.location_on,
          color: Colors.blue,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 2:
        point2.add(data);
        return Icon(
          Icons.location_on,
          color: Colors.yellow,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 3:
        point3.add(data);
        return Icon(
          Icons.location_on,
          color: Colors.black,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 4:
        point4.add(data);
        return Icon(
          Icons.location_on,
          color: Colors.green,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 5:
        point5.add(data);
        return Icon(
          Icons.location_on,
          color: Colors.red,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 6:
        point6.add(data);
        return Icon(
          Icons.location_on,
          color: Colors.purple,
          size: widget.NORMAL_ICON_SIZE,
        );
      case 7:
        point7.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 0, 255, 234),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 8:
        point8.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 255, 0, 149),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 9:
        point9.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(213, 59, 100, 61),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 10:
        point10.add(data);
        return Icon(Icons.location_on,
            color: const Color.fromARGB(255, 255, 136, 0),
            size: widget.NORMAL_ICON_SIZE);
      case 11:
        point11.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 61, 63, 211),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 12:
        point12.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 141, 192, 112),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 13:
        point13.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 158, 158, 158),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 14:
        point14.add(data);
        return Icon(
          Icons.location_on,
          color: const Color.fromARGB(255, 7, 14, 22),
          size: widget.NORMAL_ICON_SIZE,
        );
      case 15:
        point15.add(data);
        return Icon(
          Icons.location_on,
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
      //히든 스태쉬 Hidden Stash
    );
  }

  _onMarkerClicked(MarkerModel markerModel) {
    if ((markerModel.data as Facility).name == 'Dorm') {
      inToBuilding(Dorm01(title: '3Story Dorm 1F'));
    } else if ((markerModel.data as Facility).name == 'facility1') {
      return popDialog('tarkov02');
    }
  }

  Future<dynamic> popDialog(String imgName) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(3),
          backgroundColor: Colors.grey.withOpacity(0.2),
          //title: Text((markerModel.data as Facility).name),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<Image>(
                    future: LootImage.loadLootImage(imgName),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var img = snapshot.data!;
                        return img;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void inToBuilding(Widget widget) {
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
          pageBuilder: (context, animation, secondaryAnimation) => widget),
    );
  }

  _onTab(Size size) {}

  Future<MapContainer> _loadImage() async {
    final MapContainer map = MapContainer(
      Image.asset('assets/images/customs.png'),
      size,
      markers: _getMarker(widget._facilityList, 3690.0, 2100.0),
      markerWidgetBuilder: _getMarkerWidget,
      onMarkerClicked: _onMarkerClicked,
      onTab: _onTab(size),
    );
    await Future.delayed(const Duration(seconds: 1));
    return map;
  }
}

class Facility {
  int facilityId;
  String name;

  // Leaflet CRS.Simple, bounds = [[-height / 2, -width / 2], [height / 2, width / 2]]
  double lng;
  double lat;

  Facility(this.facilityId, this.name, this.lng, this.lat);
}
