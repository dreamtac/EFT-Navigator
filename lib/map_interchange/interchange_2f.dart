import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/main.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:testamp/map_interchange/interchange_3f.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class Interchange_2F extends StatefulWidget {
  Interchange_2F({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;

  final String title;

  final List<Facility> _facilityList = [
    //탄 박스
    Facility(7, 'Interchange_2F_Ammo_Box1', 1887, -654),
    Facility(7, 'Interchange_2F_Ammo_Box2', 644, -428),
    Facility(7, 'Interchange_2F_Ammo_Box3', -235, -1288),
    Facility(7, 'Interchange_2F_Ammo_Box4', -251, -1653),
    //나무 박스
    Facility(14, 'Interchange_2F_Wooden_Crate1', 645, 1900),
    Facility(14, 'Interchange_2F_Wooden_Crate2', 1119, 526),
    Facility(14, 'Interchange_2F_Wooden_Crate3', 1478, 261),
    //죽은 스캐브
    Facility(3, 'Interchange_2F_Dead_Scav1', 135, 1383),
    //더플 백
    Facility(12, 'Interchange_2F_Duffle_Bag1', 417, 2475),
    Facility(12, 'Interchange_2F_Duffle_Bag2', 735, 1997),
    Facility(12, 'Interchange_2F_Duffle_Bag3', 784, 1979),
    Facility(12, 'Interchange_2F_Duffle_Bag4', 1402, 1840),
    Facility(12, 'Interchange_2F_Duffle_Bag5', 591, 1459),
    Facility(12, 'Interchange_2F_Duffle_Bag6', 1901, 1287),
    Facility(12, 'Interchange_2F_Duffle_Bag7', 1783, 1076),
    Facility(12, 'Interchange_2F_Duffle_Bag8', 2018, 819),
    Facility(12, 'Interchange_2F_Duffle_Bag9', 1461, 995),
    Facility(12, 'Interchange_2F_Duffle_Bag10', 383, 1024),
    Facility(12, 'Interchange_2F_Duffle_Bag11', 239, 1076),
    Facility(12, 'Interchange_2F_Duffle_Bag12', 406, 833),
    Facility(12, 'Interchange_2F_Duffle_Bag13', 260, 468),
    Facility(12, 'Interchange_2F_Duffle_Bag14', 73, 239),
    Facility(12, 'Interchange_2F_Duffle_Bag15', 287, 82),
    Facility(12, 'Interchange_2F_Duffle_Bag16', 6, 1646),
    Facility(12, 'Interchange_2F_Duffle_Bag17', 1092, -253),
    Facility(12, 'Interchange_2F_Duffle_Bag18', 725, -388),
    Facility(12, 'Interchange_2F_Duffle_Bag19', 1003, -500),
    Facility(12, 'Interchange_2F_Duffle_Bag20', 1069, -554),
    Facility(12, 'Interchange_2F_Duffle_Bag21', 1113, -548),
    Facility(12, 'Interchange_2F_Duffle_Bag22', 1659, -573),
    Facility(12, 'Interchange_2F_Duffle_Bag23', 505, -531),
    Facility(12, 'Interchange_2F_Duffle_Bag24', 282, -591),
    Facility(12, 'Interchange_2F_Duffle_Bag25', 123, -741),
    Facility(12, 'Interchange_2F_Duffle_Bag26', 961, -832),
    Facility(12, 'Interchange_2F_Duffle_Bag27', 1299, -837),
    Facility(12, 'Interchange_2F_Duffle_Bag28', 1432, -1088),
    Facility(12, 'Interchange_2F_Duffle_Bag29', 1675, -1248),
    Facility(12, 'Interchange_2F_Duffle_Bag30', 674, -1365),
    Facility(12, 'Interchange_2F_Duffle_Bag31', 375, -1304),
    Facility(12, 'Interchange_2F_Duffle_Bag32', -56, -178),
    Facility(12, 'Interchange_2F_Duffle_Bag33', -354, -713),
    Facility(12, 'Interchange_2F_Duffle_Bag34', -126, -1441),
    Facility(12, 'Interchange_2F_Duffle_Bag35', -218, -1655),
    Facility(12, 'Interchange_2F_Duffle_Bag36', -100, 2090),
    Facility(12, 'Interchange_2F_Duffle_Bag37', -216, 866),
    Facility(12, 'Interchange_2F_Duffle_Bag38', -353, 738),
    Facility(12, 'Interchange_2F_Duffle_Bag39', -216, 643),
    //캐비넷
    Facility(4, 'Interchange_2F_Filing_Cabinet1', -18, 179),
    Facility(4, 'Interchange_2F_Filing_Cabinet2', -18, 163),
    Facility(4, 'Interchange_2F_Filing_Cabinet3', -18, 147),
    //수류탄 박스
    Facility(6, 'Interchange_2F_Grenade_Box1', 2053, 397),
    Facility(6, 'Interchange_2F_Grenade_Box2', 2010, -695),
    Facility(6, 'Interchange_2F_Grenade_Box3', 628, -1452),
    //자켓
    Facility(8, 'Interchange_2F_Jacket1', 204, 913),
    Facility(8, 'Interchange_2F_Jacket2', 285, 913),
    Facility(8, 'Interchange_2F_Jacket3', 405, 793),
    Facility(8, 'Interchange_2F_Jacket4', 683, 680),
    Facility(8, 'Interchange_2F_Jacket5', 675, 590),
    Facility(8, 'Interchange_2F_Jacket6', 416, 579),
    Facility(8, 'Interchange_2F_Jacket7', 244, 468),
    Facility(8, 'Interchange_2F_Jacket8', 49, 190),
    Facility(8, 'Interchange_2F_Jacket9', 194, 113),
    Facility(8, 'Interchange_2F_Jacket10', 197, 91),
    Facility(8, 'Interchange_2F_Jacket11', 775, 40),
    Facility(8, 'Interchange_2F_Jacket12', 315, -98),
    Facility(8, 'Interchange_2F_Jacket13', 308, -98),
    Facility(8, 'Interchange_2F_Jacket14', 392, -152),
    Facility(8, 'Interchange_2F_Jacket15', 1174, -582),
    //의약품
    Facility(9, 'Interchange_2F_Meds1', 392, 793),
    Facility(9, 'Interchange_2F_Meds2', 214, 775),
    Facility(9, 'Interchange_2F_Meds3', 230, 554),
    Facility(9, 'Interchange_2F_Meds4', 444, 460),
    //PC
    Facility(10, 'Interchange_2F_PC1', 509, 2481),
    Facility(10, 'Interchange_2F_PC2', 546, 2426),
    Facility(10, 'Interchange_2F_PC3', 491, 2403),
    Facility(10, 'Interchange_2F_PC4', 1073, 1272),
    Facility(10, 'Interchange_2F_PC5', 1176, 1257),
    Facility(10, 'Interchange_2F_PC6', 1176, 1220),
    Facility(10, 'Interchange_2F_PC7', 1176, 1188),
    Facility(10, 'Interchange_2F_PC8', 1176, 1163),
    Facility(10, 'Interchange_2F_PC9', 1185, -472),
    Facility(10, 'Interchange_2F_PC10', 1113, -474),
    Facility(10, 'Interchange_2F_PC11', 1167, -504),
    Facility(10, 'Interchange_2F_PC12', 1168, -521),
    Facility(10, 'Interchange_2F_PC13', 1169, -542),
    Facility(10, 'Interchange_2F_PC14', 1210, -944),
    Facility(10, 'Interchange_2F_PC15', 1287, -950),
    Facility(10, 'Interchange_2F_PC16', 1211, -980),
    Facility(10, 'Interchange_2F_PC17', 1270, -1001),
    Facility(10, 'Interchange_2F_PC18', 1169, -1059),
    Facility(10, 'Interchange_2F_PC19', 1352, -1055),
    Facility(10, 'Interchange_2F_PC20', 1359, -1105),
    Facility(10, 'Interchange_2F_PC21', 1345, -1120),
    Facility(10, 'Interchange_2F_PC22', 1290, -1126),
    Facility(10, 'Interchange_2F_PC23', 1313, -1239),
    Facility(10, 'Interchange_2F_PC24', 870, -1210),
    Facility(10, 'Interchange_2F_PC25', 903, -1237),
    Facility(10, 'Interchange_2F_PC26', 155, -932),
    Facility(10, 'Interchange_2F_PC27', 177, -973),
    Facility(10, 'Interchange_2F_PC28', 153, -1381),
    Facility(10, 'Interchange_2F_PC29', 181, -1379),
    Facility(10, 'Interchange_2F_PC30', -131, -1495),
    Facility(10, 'Interchange_2F_PC31', -211, -1539),
    Facility(10, 'Interchange_2F_PC32', -245, -1464),
    Facility(10, 'Interchange_2F_PC33', -269, -1231),
    Facility(10, 'Interchange_2F_PC34', -231, -1207),
    Facility(10, 'Interchange_2F_PC35', -145, -1172),
    Facility(10, 'Interchange_2F_PC36', -268, -1134),
    Facility(10, 'Interchange_2F_PC37', -154, -1069),
    Facility(10, 'Interchange_2F_PC38', -266, -981),
    //공구 박스
    Facility(13, 'Interchange_2F_Toolbox1', 1423, 2475),
    Facility(13, 'Interchange_2F_Toolbox2', 1495, 1781),
    Facility(13, 'Interchange_2F_Toolbox3', 1408, 1626),
    Facility(13, 'Interchange_2F_Toolbox4', 1446, 1476),
    Facility(13, 'Interchange_2F_Toolbox5', 1701, 1210),
    Facility(13, 'Interchange_2F_Toolbox6', 1948, 891),
    Facility(13, 'Interchange_2F_Toolbox7', 2050, 130),
    Facility(13, 'Interchange_2F_Toolbox8', 524, 1690),
    Facility(13, 'Interchange_2F_Toolbox9', 333, 1051),
    Facility(13, 'Interchange_2F_Toolbox10', 86, 951),
    Facility(13, 'Interchange_2F_Toolbox11', 229, 246),
    Facility(13, 'Interchange_2F_Toolbox12', 2005, -27),
    Facility(13, 'Interchange_2F_Toolbox13', 1944, -351),
    Facility(13, 'Interchange_2F_Toolbox14', 1647, -940),
    Facility(13, 'Interchange_2F_Toolbox15', 1269, -1290),
    Facility(13, 'Interchange_2F_Toolbox16', 1138, -1692),
    //무기 박스
    Facility(5, 'Interchange_2F_Weapon_Box1', 77, 2493),
    Facility(5, 'Interchange_2F_Weapon_Box2', 882, 978),
    Facility(5, 'Interchange_2F_Weapon_Box3', 1637, 910),
    Facility(5, 'Interchange_2F_Weapon_Box4', 64, 667),
    Facility(5, 'Interchange_2F_Weapon_Box5', 691, 611),
    Facility(5, 'Interchange_2F_Weapon_Box6', 1967, 574),
    Facility(5, 'Interchange_2F_Weapon_Box7', 2134, 583),
    Facility(5, 'Interchange_2F_Weapon_Box8', 1635, 345),
    Facility(5, 'Interchange_2F_Weapon_Box9', 1817, 350),
    Facility(5, 'Interchange_2F_Weapon_Box10', 826, 73),
    Facility(5, 'Interchange_2F_Weapon_Box11', 695, 29),
    Facility(5, 'Interchange_2F_Weapon_Box12', 677, 11),
    Facility(5, 'Interchange_2F_Weapon_Box13', 615, -11),
    Facility(5, 'Interchange_2F_Weapon_Box14', 677, -11),
    Facility(5, 'Interchange_2F_Weapon_Box15', 936, -23),
    Facility(5, 'Interchange_2F_Weapon_Box16', 213, -65),
    Facility(5, 'Interchange_2F_Weapon_Box17', 716, -49),
    Facility(5, 'Interchange_2F_Weapon_Box18', 732, -49),
    Facility(5, 'Interchange_2F_Weapon_Box19', 749, -49),
    Facility(5, 'Interchange_2F_Weapon_Box20', 241, -341),
    Facility(5, 'Interchange_2F_Weapon_Box21', 1114, -240),
    Facility(5, 'Interchange_2F_Weapon_Box22', 1089, -475),
    Facility(5, 'Interchange_2F_Weapon_Box23', 1220, -512),
    Facility(5, 'Interchange_2F_Weapon_Box24', 1652, -509),
    Facility(5, 'Interchange_2F_Weapon_Box25', 1069, -692),
    Facility(5, 'Interchange_2F_Weapon_Box26', 1659, -709),
    Facility(5, 'Interchange_2F_Weapon_Box27', 1662, -713),
    Facility(5, 'Interchange_2F_Weapon_Box28', 1705, -682),
    Facility(5, 'Interchange_2F_Weapon_Box29', 2100, -766),
    Facility(5, 'Interchange_2F_Weapon_Box30', 663, -1185),
    Facility(5, 'Interchange_2F_Weapon_Box31', 1753, -1874),
    Facility(5, 'Interchange_2F_Weapon_Box32', -219, -1540),
    //잠긴 문
    Facility(15, 'Interchange_2F_Locked_Room1', 204, 811),
    Facility(15, 'Interchange_2F_Locked_Room2', 309, 853),
    Facility(15, 'Interchange_2F_Locked_Room3', 448, 809),
    Facility(15, 'Interchange_2F_Locked_Room4', 582, 154),
    Facility(15, 'Interchange_2F_Locked_Room5', 599, 154),
    Facility(15, 'Interchange_2F_Locked_Room6', 1373, -814),
    Facility(15, 'Interchange_2F_Locked_Room7', -228, -1017),
    Facility(15, 'Interchange_2F_Locked_Room8', -217, -1115),
    //바닥 룻
    Facility(16, 'Interchange_2F_Loose_Loot1', 462, 601), //레덱스
    Facility(16, 'Interchange_2F_Loose_Loot2', 1910, 331), //레덱스
    Facility(16, 'Interchange_2F_Loose_Loot3', 649, 2444), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot4', 491, 2444), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot5', 294, 1975), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot6', 284, 980), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot7', 272, 780), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot8', 647, 564), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot9', 326, -338), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot10', 425, -418), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot11', -8, -476), //고급 전자 제품
    Facility(16, 'Interchange_2F_Loose_Loot12', 1478, 1238), //고샨 음식 스폰
    Facility(16, 'Interchange_2F_Loose_Loot13', 1087, -98), //고급 귀금속
  ];

  @override
  _Interchange_2FState createState() => _Interchange_2FState();
}

class _Interchange_2FState extends State<Interchange_2F> {
  bool allToggle = true;
  bool _filterVisible = MyApp.filterToggle;
  final List<bool> selections = List.generate(16, (index) => true);
  var size = const Size(8000.0, 8000.0);
  String imageName = 'interchange_2F.png';

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
                        Interchange_3F(
                          title: 'Interchange 2F',
                        ),
                        const Offset(0.0, -1.0)),
                    up: true,
                    heroTag: 'Interchange 2F',
                  ),
                  const TextFloor(floor: 2),
                  FloatingFloorButton(
                    movePage: () => Navigator.pop(context, _filterVisible),
                    up: false,
                    heroTag: 'Interchange 1F',
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
    print('$path/$imageName');
    final MapContainer map = MapContainer(
      //Image.asset('assets/images/interchange_2F.png'),
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
