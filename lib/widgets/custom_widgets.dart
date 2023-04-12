import 'package:flutter/material.dart';
import 'package:image_overlay_map/image_overlay_map.dart';

//마커 클릭시 상세 룻 이미지
class LootImage {
  static Future<Image> loadLootImage(String imageName) async {
    final String name = imageName;
    final Image img = Image(
      image: AssetImage('assets/images/lootImage/$name.webp'),
      // width: 300,
      // height: 200,
    );
    return img;
  }
}

//마커 클릭시 생성되는 AlertDialog
class MarkerClickBox extends StatelessWidget {
  final String imgName;
  const MarkerClickBox({
    super.key,
    required this.imgName,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(3),
      backgroundColor: Colors.grey.withOpacity(0.2),
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
  }
}

class FloatingFilterButton extends StatefulWidget {
  final Function() onPressed;

  const FloatingFilterButton({super.key, required this.onPressed});

  @override
  State<FloatingFilterButton> createState() => _FloatingFilterButtonState();
}

class _FloatingFilterButtonState extends State<FloatingFilterButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Colors.green[200],
      onPressed: widget.onPressed,
      tooltip: 'Filter',
      heroTag: 'Filter Toggle Hero',
      child: const Icon(
        Icons.location_on_outlined,
        size: 30,
      ),
    );
  }
}

class FloatingFloorButton extends StatefulWidget {
  Function()? movePage;
  final bool up;
  final String heroTag;
  bool isNull = false;

  FloatingFloorButton({
    super.key,
    required this.movePage,
    required this.up,
    required this.heroTag,
  });

  FloatingFloorButton.isNull({
    super.key,
    required this.up,
    required this.heroTag,
  }) {
    movePage = () {};
    isNull = true;
  }

  @override
  State<FloatingFloorButton> createState() => _FloatingFloorButtonState();
}

class _FloatingFloorButtonState extends State<FloatingFloorButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: widget.isNull ? Colors.grey : Colors.green[200],
        enableFeedback: widget.isNull ? false : true,
        heroTag: widget.heroTag,
        onPressed: widget.isNull ? null : widget.movePage,
        child: widget.up
            ? const Icon(
                Icons.arrow_upward_rounded,
                size: 30,
              )
            : const Icon(
                Icons.arrow_downward_rounded,
                size: 30,
              ));
  }
}

class FloorToggleButton extends StatefulWidget {
  final int floor, minFloor, maxFloor, initIndex;
  const FloorToggleButton({
    super.key,
    required this.floor,
    required this.minFloor,
    required this.maxFloor,
    required this.initIndex,
  });

  @override
  State<FloorToggleButton> createState() => _FloorToggleButtonState();
}

class _FloorToggleButtonState extends State<FloorToggleButton> {
  @override
  void initState() {
    selections[widget.initIndex] = true;
    super.initState();
  }

  late final List<bool> selections =
      List.generate(widget.floor, (index) => false);
  // late final List<int> floorNumber = List.generate(widget.floor, (index) => )
  late final List<Icon> addButton = List.generate(
      widget.floor, (index) => const Icon(Icons.format_list_numbered_outlined));
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.vertical,
      isSelected: selections,
      onPressed: (int index) {
        setState(
          () {
            for (int buttonIndex = 0;
                buttonIndex < selections.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                selections[buttonIndex] = true;
              } else {
                selections[buttonIndex] = false;
              }
            }
          },
        );
      },
      children: [for (var icon in addButton) icon],
    );
  }
}

class ToggleFilter extends StatefulWidget {
  final Size ENABLE_ICON_SIZE = const Size(35, 35);
  final Size DISABLE_ICON_SIZE = const Size(5000, 5000);
  final double NORMAL_ICON_SIZE = 35;
  const ToggleFilter({super.key});

  @override
  State<ToggleFilter> createState() => _ToggleFilterState();
}

class _ToggleFilterState extends State<ToggleFilter> {
  bool allToggle = true;
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
      point15 = [],
      point16 = [];
  final List<bool> selections = List.generate(16, (index) => true);
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            setState(() {
              selections[index] = !selections[index];
              lootFilter(index);
            });
          },
          children: [
            _createToggleButton(
                Icons.attach_money_rounded), //히든 스태쉬 Hidden Stash
            _createToggleButton(
                Icons.business_center_rounded), //돈통, 금고 Cash register, Safe
            _createToggleButton(Icons.work_outline_rounded), //죽은 스캐브 Dead Scav
            _createToggleButton(
                Icons.work_outline_rounded), //캐비넷 Filing Cabinet
            _createToggleButton(Icons.work_outline_rounded), //무기 박스 Weapon Box
            _createToggleButton(
                Icons.work_outline_rounded), //수류탄 박스 Grenade Box
            _createToggleButton(Icons.work_outline_rounded), //탄 박스 Ammo Box
            _createToggleButton(Icons.accessibility_rounded), //자켓 Jacket
            _createToggleButton(Icons.medical_services_outlined), //의약품 Meds
            _createToggleButton(Icons.work_outline_rounded), //컴퓨터 본체 PC
            _createToggleButton(
                Icons.work_outline_rounded), //음식 상자 Ration Crate
            _createToggleButton(Icons.work_outline_rounded), //더플백 Duffle Bag
            _createToggleButton(Icons.work_outline_rounded), //공구 박스 Toolbox
            _createToggleButton(
                Icons.check_box_outline_blank), //나무 박스 Wooden crate
            _createToggleButton(Icons.lock_outlined), //잠긴 문 Locked Room
            _createToggleButton(Icons.lock_outlined), //바닥 룻 Loose Loot
          ],
        ),
      ),
    );
  }

  _createToggleButton(IconData icon) {
    return Icon(
      icon,
    );
  }
}

class TextFloor extends StatefulWidget {
  final int floor;
  const TextFloor({super.key, required this.floor});

  @override
  State<TextFloor> createState() => _TextFloorState();
}

class _TextFloorState extends State<TextFloor> {
  //*층 수 표시
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        _floorText(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _floorText() {
    if (widget.floor < 0) {
      return 'B${-widget.floor}';
    } else {
      return '${widget.floor}F';
    }
  }
}
