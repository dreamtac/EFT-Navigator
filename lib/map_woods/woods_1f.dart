import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/main.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class Woods_1F extends StatefulWidget {
  Woods_1F({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;
  final String title;

  final List<Facility> _facilityList = [
    //히든 스태쉬
    Facility(1, 'Woods_1F_Hidden_Stash1', 139, 2005),
    Facility(1, 'Woods_1F_Hidden_Stash2', 717, 1899),
    Facility(1, 'Woods_1F_Hidden_Stash3', 1313, 1826),
    Facility(1, 'Woods_1F_Hidden_Stash4', 2318, 1574),
    Facility(1, 'Woods_1F_Hidden_Stash5', 208, 1084),
    Facility(1, 'Woods_1F_Hidden_Stash6', 858, 997),
    Facility(1, 'Woods_1F_Hidden_Stash7', 1745, 1016),
    Facility(1, 'Woods_1F_Hidden_Stash8', 92, 623),
    Facility(1, 'Woods_1F_Hidden_Stash9', 920, 703),
    Facility(1, 'Woods_1F_Hidden_Stash10', 1360, 666),
    Facility(1, 'Woods_1F_Hidden_Stash11', 1323, 166),
    Facility(1, 'Woods_1F_Hidden_Stash12', 2575, 43),
    Facility(1, 'Woods_1F_Hidden_Stash13', 3234, 119),
    Facility(1, 'Woods_1F_Hidden_Stash14', 2409, -795),
    Facility(1, 'Woods_1F_Hidden_Stash15', 1623, -964),
    Facility(1, 'Woods_1F_Hidden_Stash16', 2975, -864),
    Facility(1, 'Woods_1F_Hidden_Stash17', 2510, -1497),
    Facility(1, 'Woods_1F_Hidden_Stash18', 1851, -2058),
    Facility(1, 'Woods_1F_Hidden_Stash19', 1648, -2055),
    Facility(1, 'Woods_1F_Hidden_Stash20', 2670, -2675),
    Facility(1, 'Woods_1F_Hidden_Stash21', 1620, -3286),
    Facility(1, 'Woods_1F_Hidden_Stash22', -1379, -2857),
    Facility(1, 'Woods_1F_Hidden_Stash23', -1397, -1576),
    Facility(1, 'Woods_1F_Hidden_Stash24', -1172, -1562),
    Facility(1, 'Woods_1F_Hidden_Stash25', -907, -436),
    Facility(1, 'Woods_1F_Hidden_Stash26', -2724, -381),
    Facility(1, 'Woods_1F_Hidden_Stash27', -744, 326),
    Facility(1, 'Woods_1F_Hidden_Stash28', -1924, 348),
    Facility(1, 'Woods_1F_Hidden_Stash29', -673, 754),
    Facility(1, 'Woods_1F_Hidden_Stash30', -2254, 1048),
    Facility(1, 'Woods_1F_Hidden_Stash31', -537, 1383),
    Facility(1, 'Woods_1F_Hidden_Stash32', -148, 1911),
    Facility(1, 'Woods_1F_Hidden_Stash33', -952, 1872),
    Facility(1, 'Woods_1F_Hidden_Stash34', -1980, 2166),
    Facility(1, 'Woods_1F_Hidden_Stash35', -1137, 3098),
    Facility(1, 'Woods_1F_Hidden_Stash36', -1712, 2821),
    //탄 박스
    Facility(7, 'Woods_1F_Ammo_Box1', -122, -1578),
    Facility(7, 'Woods_1F_Ammo_Box2', -755, -1314),
    //나무 박스
    Facility(14, 'Woods_1F_Wooden_Crate1', 2774, 1312),
    Facility(14, 'Woods_1F_Wooden_Crate2', 2393, 615),
    Facility(14, 'Woods_1F_Wooden_Crate3', 931, 331),
    Facility(14, 'Woods_1F_Wooden_Crate4', 698, 244),
    Facility(14, 'Woods_1F_Wooden_Crate5', 985, -118),
    Facility(14, 'Woods_1F_Wooden_Crate6', 2945, -857),
    Facility(14, 'Woods_1F_Wooden_Crate7', 2010, -1241),
    Facility(14, 'Woods_1F_Wooden_Crate8', 1988, -1317),
    Facility(14, 'Woods_1F_Wooden_Crate9', 1987, -1330),
    Facility(14, 'Woods_1F_Wooden_Crate10', 2015, -1330),
    Facility(14, 'Woods_1F_Wooden_Crate11', 1669, -1387),
    Facility(14, 'Woods_1F_Wooden_Crate12', 941, -2377),
    Facility(14, 'Woods_1F_Wooden_Crate13', 1034, -2533),
    Facility(14, 'Woods_1F_Wooden_Crate14', 1021, -2547),
    Facility(14, 'Woods_1F_Wooden_Crate15', 1446, -2573),
    Facility(14, 'Woods_1F_Wooden_Crate16', 893, -2759),
    Facility(14, 'Woods_1F_Wooden_Crate17', 633, -3581),
    Facility(14, 'Woods_1F_Wooden_Crate18', -1384, -1883),
    Facility(14, 'Woods_1F_Wooden_Crate19', -2607, -1622),
    Facility(14, 'Woods_1F_Wooden_Crate20', -391, -1246),
    Facility(14, 'Woods_1F_Wooden_Crate21', -1438, -906),
    Facility(14, 'Woods_1F_Wooden_Crate22', -2075, -793),
    Facility(14, 'Woods_1F_Wooden_Crate23', -2065, -779),
    Facility(14, 'Woods_1F_Wooden_Crate24', -1190, 1968),
    Facility(14, 'Woods_1F_Wooden_Crate25', -1393, 2497),
    Facility(14, 'Woods_1F_Wooden_Crate26', -1357, 2655),
    Facility(14, 'Woods_1F_Wooden_Crate27', -862, 2870),
    Facility(14, 'Woods_1F_Wooden_Crate28', -795, 2792),
    //죽은 스캐브
    Facility(3, 'Woods_1F_Dead_Scav1', -1196, -2718),
    Facility(3, 'Woods_1F_Dead_Scav2', -1389, -1758),
    Facility(3, 'Woods_1F_Dead_Scav3', -2857, -1002),
    Facility(3, 'Woods_1F_Dead_Scav4', -2855, -838),
    Facility(3, 'Woods_1F_Dead_Scav5', -1892, 1431),
    Facility(3, 'Woods_1F_Dead_Scav6', -1910, 1533),
    Facility(3, 'Woods_1F_Dead_Scav7', -667, 3447),
    //더플 백
    Facility(12, 'Woods_1F_Duffle_Bag1', 376, 2106),
    Facility(12, 'Woods_1F_Duffle_Bag2', 2364, 880),
    Facility(12, 'Woods_1F_Duffle_Bag3', 2380, 853),
    Facility(12, 'Woods_1F_Duffle_Bag4', 2412, 735),
    Facility(12, 'Woods_1F_Duffle_Bag5', 2646, 859),
    Facility(12, 'Woods_1F_Duffle_Bag6', 2683, 874),
    Facility(12, 'Woods_1F_Duffle_Bag7', 2705, -99),
    Facility(12, 'Woods_1F_Duffle_Bag8', 2473, -299),
    Facility(12, 'Woods_1F_Duffle_Bag9', 27, -1519),
    Facility(12, 'Woods_1F_Duffle_Bag10', 998, -2291),
    Facility(12, 'Woods_1F_Duffle_Bag11', 1051, -2410),
    Facility(12, 'Woods_1F_Duffle_Bag12', 837, -2652),
    Facility(12, 'Woods_1F_Duffle_Bag13', 1149, -3240),
    Facility(12, 'Woods_1F_Duffle_Bag14', 638, -3534),
    Facility(12, 'Woods_1F_Duffle_Bag15', -1180, -2718),
    Facility(12, 'Woods_1F_Duffle_Bag16', -865, -1780),
    Facility(12, 'Woods_1F_Duffle_Bag17', -783, -1357),
    Facility(12, 'Woods_1F_Duffle_Bag18', -2542, -1592),
    Facility(12, 'Woods_1F_Duffle_Bag19', -87, -943),
    Facility(12, 'Woods_1F_Duffle_Bag20', -89, -897),
    Facility(12, 'Woods_1F_Duffle_Bag21', -118, -833),
    Facility(12, 'Woods_1F_Duffle_Bag22', -906, 2691),
    Facility(12, 'Woods_1F_Duffle_Bag23', -1262, 2619),
    Facility(12, 'Woods_1F_Duffle_Bag24', -1396, 2541),
    //캐비넷
    Facility(4, 'Woods_1F_Filing_Cabinet1', 29, -1536),
    Facility(4, 'Woods_1F_Filing_Cabinet2', -1422, -900),
    //수류탄 박스
    Facility(6, 'Woods_1F_Grenade_Box1', 2432, 902),
    Facility(6, 'Woods_1F_Grenade_Box2', 2350, 859),
    Facility(6, 'Woods_1F_Grenade_Box3', -80, -859),
    Facility(6, 'Woods_1F_Grenade_Box4', -744, -1323),
    Facility(6, 'Woods_1F_Grenade_Box5', -844, 2893),
    Facility(6, 'Woods_1F_Grenade_Box6', -1371, 2608),
    //자켓
    Facility(8, 'Woods_1F_Jacket1', 2089, -2990),
    Facility(8, 'Woods_1F_Jacket2', 9, -1525),
    Facility(8, 'Woods_1F_Jacket3', 9, -1519),
    Facility(8, 'Woods_1F_Jacket4', 16, -1516),
    Facility(8, 'Woods_1F_Jacket5', -137, -1568),
    Facility(8, 'Woods_1F_Jacket6', -143, -1565),
    Facility(8, 'Woods_1F_Jacket7', -410, -1246),
    Facility(8, 'Woods_1F_Jacket8', -1187, -1184),
    Facility(8, 'Woods_1F_Jacket9', -124, -899),
    Facility(8, 'Woods_1F_Jacket10', -118, -899),
    Facility(8, 'Woods_1F_Jacket11', -102, -867),
    Facility(8, 'Woods_1F_Jacket12', -124, -835),
    Facility(8, 'Woods_1F_Jacket13', -1232, 2542),
    //금고
    Facility(2, 'Woods_1F_Safe1', -80, -866),
    //공구 박스
    Facility(13, 'Woods_1F_Toolbox1', 635, 2658),
    Facility(13, 'Woods_1F_Toolbox2', 14, 2460),
    Facility(13, 'Woods_1F_Toolbox3', 330, 1796),
    Facility(13, 'Woods_1F_Toolbox4', 2462, 1023),
    Facility(13, 'Woods_1F_Toolbox5', 2311, 991),
    Facility(13, 'Woods_1F_Toolbox6', 2617, 950),
    Facility(13, 'Woods_1F_Toolbox7', 2601, 911),
    Facility(13, 'Woods_1F_Toolbox8', 2657, 781),
    Facility(13, 'Woods_1F_Toolbox9', 2348, 700),
    Facility(13, 'Woods_1F_Toolbox10', 2407, 537),
    Facility(13, 'Woods_1F_Toolbox11', 1031, 243),
    Facility(13, 'Woods_1F_Toolbox12', 1145, -5),
    Facility(13, 'Woods_1F_Toolbox13', 1159, -6),
    Facility(13, 'Woods_1F_Toolbox14', 2841, -151),
    Facility(13, 'Woods_1F_Toolbox15', 2968, -96),
    Facility(13, 'Woods_1F_Toolbox16', 1016, -2397),
    Facility(13, 'Woods_1F_Toolbox17', 1017, -2453),
    Facility(13, 'Woods_1F_Toolbox18', -36, 2803),
    Facility(13, 'Woods_1F_Toolbox19', -1389, 2589),
    Facility(13, 'Woods_1F_Toolbox20', -1132, 1849),
    Facility(13, 'Woods_1F_Toolbox21', -1724, 1469),
    //음식 상자
    Facility(11, 'Woods_1F_Ration_Crate1', 2868, -186),
    Facility(11, 'Woods_1F_Ration_Crate2', 987, -2390),
    Facility(11, 'Woods_1F_Ration_Crate3', 881, -2662),
    Facility(11, 'Woods_1F_Ration_Crate4', -1650, 1130),
    Facility(11, 'Woods_1F_Ration_Crate5', -1793, 1538),
    Facility(11, 'Woods_1F_Ration_Crate6', -894, 2717),
    //의약품
    Facility(9, 'Woods_1F_Meds1', 1036, -2375),
    Facility(9, 'Woods_1F_Meds2', 1050, -2400),
    Facility(9, 'Woods_1F_Meds3', 997, -2412),
    Facility(9, 'Woods_1F_Meds4', 871, -2610),
    Facility(9, 'Woods_1F_Meds5', 869, -2738),
    Facility(9, 'Woods_1F_Meds6', -1374, -898),
    Facility(9, 'Woods_1F_Meds7', -1792, 1233),
    //무기 박스
    Facility(5, 'Woods_1F_Weapon_Box1', 2784, 55),
    Facility(5, 'Woods_1F_Weapon_Box2', 2892, -140),
    Facility(5, 'Woods_1F_Weapon_Box3', 2805, -152),
    Facility(5, 'Woods_1F_Weapon_Box4', 2695, -317),
    Facility(5, 'Woods_1F_Weapon_Box5', 2565, -437),
    Facility(5, 'Woods_1F_Weapon_Box6', 1039, -2300),
    Facility(5, 'Woods_1F_Weapon_Box7', 880, -2402),
    Facility(5, 'Woods_1F_Weapon_Box8', 986, -2463),
    Facility(5, 'Woods_1F_Weapon_Box9', 522, -3465),
    Facility(5, 'Woods_1F_Weapon_Box10', 534, -3476),
    Facility(5, 'Woods_1F_Weapon_Box11', -80, -894),
    Facility(5, 'Woods_1F_Weapon_Box12', -424, -1012),
    Facility(5, 'Woods_1F_Weapon_Box13', -422, -1606),
    Facility(5, 'Woods_1F_Weapon_Box14', -250, -1858),
    Facility(5, 'Woods_1F_Weapon_Box15', -551, -1005),
    Facility(5, 'Woods_1F_Weapon_Box16', -568, -1010),
    Facility(5, 'Woods_1F_Weapon_Box17', -1388, -893),
    Facility(5, 'Woods_1F_Weapon_Box18', -2539, -1544),
    Facility(5, 'Woods_1F_Weapon_Box19', -1834, 1488),
    Facility(5, 'Woods_1F_Weapon_Box20', -1602, 1512),
    Facility(5, 'Woods_1F_Weapon_Box21', -1809, 1259),
    Facility(5, 'Woods_1F_Weapon_Box22', -1720, 1178),
    Facility(5, 'Woods_1F_Weapon_Box23', -1614, 1160),
    Facility(5, 'Woods_1F_Weapon_Box24', -1637, 1134),
    //잠긴 문
    Facility(15, 'Woods_1F_Locked_Room1', -2600, -1585),
    Facility(15, 'Woods_1F_Locked_Room2', -243, -1119),
    //바닥 룻
    Facility(16, 'Woods_1F_Loose_Loot1', 369, 2652), //마크
    Facility(16, 'Woods_1F_Loose_Loot2', 795, -14), //마크
    Facility(16, 'Woods_1F_Loose_Loot3', -1206, -1208), //마크
    Facility(16, 'Woods_1F_Loose_Loot4', 2820, -159), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot5', -424, -1247), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot6', -1362, -1858), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot7', -1608, 1532), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot8', -1828, 1474), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot9', -1643, 1121), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot10', -1536, 1114), //고급 파츠
    Facility(16, 'Woods_1F_Loose_Loot11', 70, 2763), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot12', 445, 2373), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot13', 2355, 905), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot14', 2696, 870), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot15', 894, -3370), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot16', -109, -829), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot17', -893, 2703), //문샤인
    Facility(16, 'Woods_1F_Loose_Loot18', 2682, 883), //고급 전자 제품
    Facility(16, 'Woods_1F_Loose_Loot19', 992, -2424), //레덱스, 검안기
    Facility(16, 'Woods_1F_Loose_Loot20', 996, -2577), //레덱스, 검안기
    Facility(16, 'Woods_1F_Loose_Loot21', -1168, 1922), //레덱스, 검안기
    Facility(16, 'Woods_1F_Loose_Loot22', -1762, 1590), //레덱스, 검안기
  ];

  @override
  _Woods_1FState createState() => _Woods_1FState();
}

class _Woods_1FState extends State<Woods_1F> {
  bool allToggle = true;
  bool _filterVisible = MyApp.filterToggle;
  final List<bool> selections = List.generate(16, (index) => true);
  var size = const Size(8000.0, 8000.0);
  String imageName = 'woods_1F.png';

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
                      FloatingFloorButton.isNull(
                        up: true,
                        heroTag: 'Woods 1F',
                      ),
                      const TextFloor(floor: 1),
                      FloatingFloorButton.isNull(
                        up: false,
                        heroTag: 'Woods B1',
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
    // if ((markerModel.data as Facility).name == 'Dorm') {
    //   inToBuilding(Dorm01(title: '3Story Dorm 1F'), const Offset(1.0, 0.0));
    // }
    // if ((markerModel.data as Facility).picture) {
    //   if ((markerModel.data as Facility).name == 'Factory_1F_Wooden_Crate5') {
    //     return popDialog('Factory_1F_Wooden_Crate4');
    //   } else if ((markerModel.data as Facility).name ==
    //       'Factory_1F_Wooden_Crate2') {
    //     return popDialog('Factory_1F_Jacket1');
    //   } else if ((markerModel.data as Facility).name == 'Factory_1F_Jacket2') {
    //     return popDialog('Factory_1F_Jacket1');
    //   }
    //   return popDialog((markerModel.data as Facility).name);
    // }
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
