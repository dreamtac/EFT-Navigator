import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testamp/main.dart';
import 'package:testamp/map_customs/Customs_B1.dart';
import 'package:testamp/map_customs/customs_2F.dart';
import 'package:testamp/map_customs/dorm/3story_dorm_1.dart';
import 'package:testamp/widgets/custom_widgets.dart';
import 'package:testamp/widgets/facility_model.dart';

class CustomsFullMap extends StatefulWidget {
  CustomsFullMap({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Size ENABLE_ICON_SIZE = MyApp.ENABLE_ICON_SIZE;
  final Size DISABLE_ICON_SIZE = MyApp.DISABLE_ICON_SIZE;
  final double NORMAL_ICON_SIZE = MyApp.NORMAL_ICON_SIZE;
  final String title;

  final List<Facility> _facilityList = [
    //나무 박스
    Facility(14, 'Customs_1F_Wooden_Crate1', 980, -358),
    Facility(14, 'Customs_1F_Wooden_Crate2', 386, 908),
    Facility(14, 'Customs_1F_Wooden_Crate3', 2447, -250),
    Facility(14, 'Customs_1F_Wooden_Crate4', 2712, -694),
    Facility(14, 'Customs_1F_Wooden_Crate5', 2536, 62),
    Facility(14, 'Customs_1F_Wooden_Crate6', 1688, 31),
    Facility(14, 'Customs_1F_Wooden_Crate7', 1613, 78),
    Facility(14, 'Customs_1F_Wooden_Crate8', 1165, -974),
    Facility(14, 'Customs_1F_Wooden_Crate9', 1289, -411),
    Facility(14, 'Customs_1F_Wooden_Crate10', 1223, -57),
    Facility(14, 'Customs_1F_Wooden_Crate11', -268, 1038),
    Facility(14, 'Customs_1F_Wooden_Crate12', -1000, 463),
    Facility(14, 'Customs_1F_Wooden_Crate13', -1084, -888),
    Facility(14, 'Customs_1F_Wooden_Crate14', -2083, -443),
    Facility(14, 'Customs_1F_Wooden_Crate15', -2389, -908),
    Facility(14, 'Customs_1F_Wooden_Crate16', -2986, -466),
    Facility(14, 'Customs_1F_Wooden_Crate17', -3031, -468),
    Facility(14, 'Customs_1F_Wooden_Crate18', 1413, 78),
    //탄약 박스
    Facility(7, 'Customs_1F_Ammo_Box1', -203, 213),
    Facility(7, 'Customs_1F_Ammo_Box2', 1900, -673),
    Facility(7, 'Customs_1F_Ammo_Box3', 2587, 51),
    Facility(7, 'Customs_1F_Ammo_Box4', 2567, 89),
    Facility(7, 'Customs_1F_Ammo_Box5', 2266, 315),
    Facility(7, 'Customs_1F_Ammo_Box6', 344, 892),
    Facility(7, 'Customs_1F_Ammo_Box7', 363, 896),
    //히든 스태쉬
    Facility.pic(1, 'Customs_1F_Hidden_Stash1', 1636, -21),
    Facility.pic(1, 'Customs_1F_Hidden_Stash2', 1647, -528),
    Facility.pic(1, 'Customs_1F_Hidden_Stash3', 2773, -686),
    Facility.pic(1, 'Customs_1F_Hidden_Stash4', 3052, -970),
    Facility.pic(1, 'Customs_1F_Hidden_Stash5', 2644, -161),
    Facility.pic(1, 'Customs_1F_Hidden_Stash6', 3138, -258),
    Facility.pic(1, 'Customs_1F_Hidden_Stash7', 3055, 1014),
    Facility.pic(1, 'Customs_1F_Hidden_Stash8', 2429, 779),
    Facility.pic(1, 'Customs_1F_Hidden_Stash9', 2058, 821),
    Facility.pic(1, 'Customs_1F_Hidden_Stash10', 2383, 1223),
    Facility.pic(1, 'Customs_1F_Hidden_Stash11', 1582, 1383),
    Facility.pic(1, 'Customs_1F_Hidden_Stash12', 1486, 434),
    Facility.pic(1, 'Customs_1F_Hidden_Stash13', 1126, 539),
    Facility.pic(1, 'Customs_1F_Hidden_Stash14', 739, 458),
    Facility.pic(1, 'Customs_1F_Hidden_Stash15', 244, 472),
    Facility.pic(1, 'Customs_1F_Hidden_Stash16', 624, 215),
    Facility.pic(1, 'Customs_1F_Hidden_Stash17', 397, -334),
    Facility.pic(1, 'Customs_1F_Hidden_Stash18', 773, -1205),
    Facility.pic(1, 'Customs_1F_Hidden_Stash19', 426, -1411),
    Facility.pic(1, 'Customs_1F_Hidden_Stash20', 213, -1375),
    Facility.pic(1, 'Customs_1F_Hidden_Stash21', -383, -491),
    Facility.pic(1, 'Customs_1F_Hidden_Stash22', -1268, -426),
    Facility.pic(1, 'Customs_1F_Hidden_Stash23', -1316, -613),
    //데드 스캐브
    Facility(3, 'Customs_1F_Dead_Scav1', 428, 963),
    Facility(3, 'Customs_1F_Dead_Scav2', 2576, -631),
    Facility(3, 'Customs_1F_Dead_Scav3', 1895, -672),
    Facility(3, 'Customs_1F_Dead_Scav4', -378, 324),
    Facility(3, 'Customs_1F_Dead_Scav5', -786, -680),
    Facility(3, 'Customs_1F_Dead_Scav6', -474, -971),
    Facility(3, 'Customs_1F_Dead_Scav6', -485, -902),
    Facility(3, 'Customs_1F_Dead_Scav7', -2677, -675),
    //더플백
    Facility(12, 'Customs_1F_Duffle_Bag1', 2431, -414),
    Facility(12, 'Customs_1F_Duffle_Bag2', 2560, -431),
    Facility(12, 'Customs_1F_Duffle_Bag3', 429, 995),
    Facility(12, 'Customs_1F_Duffle_Bag4', 2202, -852),
    Facility(12, 'Customs_1F_Duffle_Bag5', 3000, -111),
    Facility(12, 'Customs_1F_Duffle_Bag6', 1546, 278),
    Facility(12, 'Customs_1F_Duffle_Bag7', 2260, 310),
    Facility(12, 'Customs_1F_Duffle_Bag8', 832, 1011),
    Facility(12, 'Customs_1F_Duffle_Bag9', 368, 967),
    Facility(12, 'Customs_1F_Duffle_Bag10', 387, 918),
    Facility(12, 'Customs_1F_Duffle_Bag11', 44, 1041),
    Facility(12, 'Customs_1F_Duffle_Bag12', 221, -707),
    Facility(12, 'Customs_1F_Duffle_Bag13', -516, -963),
    Facility(12, 'Customs_1F_Duffle_Bag14', -454, -894),
    Facility(12, 'Customs_1F_Duffle_Bag15', -532, -927),
    Facility(12, 'Customs_1F_Duffle_Bag16', 413, -92),
    Facility(12, 'Customs_1F_Duffle_Bag17', -211, 213),
    Facility(12, 'Customs_1F_Duffle_Bag18', -695, -497),
    Facility(12, 'Customs_1F_Duffle_Bag19', -1097, -674),
    Facility(12, 'Customs_1F_Duffle_Bag20', -2556, -578),
    Facility(12, 'Customs_1F_Duffle_Bag21', -2212, -558),
    Facility(12, 'Customs_1F_Duffle_Bag22', -2213, -857),
    Facility(12, 'Customs_1F_Duffle_Bag23', -2172, -1106),
    Facility(12, 'Customs_1F_Duffle_Bag24', -2560, -1361),
    Facility(12, 'Customs_1F_Duffle_Bag25', -2679, -985),
    //캐비넷
    Facility(4, 'Customs_1F_Filing_Cabinet1', 1211, -9),
    Facility(4, 'Customs_1F_Filing_Cabinet2', 197, 1155),
    Facility(4, 'Customs_1F_Filing_Cabinet3', 55, 1138),
    Facility(4, 'Customs_1F_Filing_Cabinet4', 117, 984),
    Facility(4, 'Customs_1F_Filing_Cabinet5', -2274, -164),
    Facility(4, 'Customs_1F_Filing_Cabinet6', -2163, -1106),
    //수류탄 박스
    Facility(6, 'Customs_1F_Grenade_Box1', 2570, 93),
    Facility(6, 'Customs_1F_Grenade_Box2', 2707, -775),
    Facility(6, 'Customs_1F_Grenade_Box3', 264, 1150),
    Facility(6, 'Customs_1F_Grenade_Box4', 2570, 93),
    //자켓
    Facility(8, 'Customs_1F_Jacket1', 382, 963),
    Facility(8, 'Customs_1F_Jacket2', 375, 967),
    Facility(8, 'Customs_1F_Jacket3', 411, 855),
    Facility(8, 'Customs_1F_Jacket4', 417, 854),
    Facility(8, 'Customs_1F_Jacket5', 192, 1115),
    Facility(8, 'Customs_1F_Jacket6', 192, 1109),
    Facility(8, 'Customs_1F_Jacket7', 112, 978),
    Facility(8, 'Customs_1F_Jacket8', 118, 977),
    Facility(8, 'Customs_1F_Jacket9', 58, 946),
    Facility(8, 'Customs_1F_Jacket10', 106, 936),
    Facility(8, 'Customs_1F_Jacket11', 113, 935),
    Facility(8, 'Customs_1F_Jacket12', 1167, -335),
    Facility(8, 'Customs_1F_Jacket13', 1848, -378),
    Facility(8, 'Customs_1F_Jacket14', 2716, -699),
    Facility(8, 'Customs_1F_Jacket15', 2710, -698),
    Facility(8, 'Customs_1F_Jacket16', 2478, -285),
    Facility(8, 'Customs_1F_Jacket17', 1343, -684),
    Facility(8, 'Customs_1F_Jacket18', 190, -607),
    Facility(8, 'Customs_1F_Jacket19', 184, -608),
    Facility(8, 'Customs_1F_Jacket20', -515, -930),
    Facility(8, 'Customs_1F_Jacket21', -508, -923),
    Facility(8, 'Customs_1F_Jacket22', -542, -1032),
    Facility(8, 'Customs_1F_Jacket23', -852, -100),
    Facility(8, 'Customs_1F_Jacket24', -2146, -1135),
    Facility(8, 'Customs_1F_Jacket25', -2140, -1135),
    Facility(8, 'Customs_1F_Jacket26', -2496, -1263),
    Facility(8, 'Customs_1F_Jacket27', -2496, -1279),
    Facility(8, 'Customs_1F_Jacket28', -2496, -1286),
    Facility(8, 'Customs_1F_Jacket29', -2222, -492),
    Facility(8, 'Customs_1F_Jacket30', -2587, -382),
    Facility(8, 'Customs_1F_Jacket31', -2789, -652),
    //의약품
    Facility(9, 'Customs_1F_Meds1', 428, 1036),
    Facility(9, 'Customs_1F_Meds2', 2035, 712),
    Facility(9, 'Customs_1F_Meds3', 1582, 278),
    Facility(9, 'Customs_1F_Meds4', 1581, 270),
    Facility(9, 'Customs_1F_Meds5', 790, -1119),
    Facility(9, 'Customs_1F_Meds6', 137, -590),
    Facility(9, 'Customs_1F_Meds7', 116, -603),
    Facility(9, 'Customs_1F_Meds8', -493, -868),
    Facility(9, 'Customs_1F_Meds9', -2282, -170),
    Facility(9, 'Customs_1F_Meds10', -2612, -986),
    //본체
    Facility(10, 'Customs_1F_PC1', 2747, -701),
    Facility(10, 'Customs_1F_PC2', 2738, -700),
    Facility(10, 'Customs_1F_PC3', 2219, -568),
    Facility(10, 'Customs_1F_PC4', 2219, -574),
    Facility(10, 'Customs_1F_PC5', 451, 1044),
    Facility(10, 'Customs_1F_PC6', 56, 1153),
    Facility(10, 'Customs_1F_PC7', -2222, -576),
    Facility(10, 'Customs_1F_PC8', -2219, -542),
    Facility(10, 'Customs_1F_PC9', -2210, -542),
    //금고
    Facility(2, 'Customs_1F_Safe1', 365, 874),
    Facility(2, 'Customs_1F_Safe2', 377, 1056),
    Facility(2, 'Customs_1F_Safe3', 452, 1050),
    Facility(2, 'Customs_1F_Safe4', 1584, 298),
    Facility(2, 'Customs_1F_Safe5', -2210, -527),
    //공구 박스
    Facility(13, 'Customs_1F_Toolbox1', 2768, -703),
    Facility(13, 'Customs_1F_Toolbox2', 2840, -730),
    Facility(13, 'Customs_1F_Toolbox3', 2839, -710),
    Facility(13, 'Customs_1F_Toolbox4', 2579, -662),
    Facility(13, 'Customs_1F_Toolbox5', 3034, -62),
    Facility(13, 'Customs_1F_Toolbox6', 430, 868),
    Facility(13, 'Customs_1F_Toolbox7', 2052, 774),
    Facility(13, 'Customs_1F_Toolbox8', 1735, 1044),
    Facility(13, 'Customs_1F_Toolbox9', 363, 13),
    Facility(13, 'Customs_1F_Toolbox10', 442, -395),
    Facility(13, 'Customs_1F_Toolbox11', 352, -721),
    Facility(13, 'Customs_1F_Toolbox12', -270, -471),
    Facility(13, 'Customs_1F_Toolbox13', -354, -726),
    //잠긴 문
    Facility(15, 'Customs_1F_Locked_Room1', -342, -15),
    Facility(15, 'Customs_1F_Locked_Room2', 415, 1046),
    Facility(15, 'Customs_1F_Locked_Room3', 392, 1048),
    Facility(15, 'Customs_1F_Locked_Room4', 402, 865),
    Facility(15, 'Customs_1F_Locked_Room5', 379, 867),
    Facility(15, 'Customs_1F_Locked_Room6', 375, 887),
    Facility(15, 'Customs_1F_Locked_Room7', 201, 1119),
    Facility(15, 'Customs_1F_Locked_Room8', 85, 1144),
    Facility(15, 'Customs_1F_Locked_Room9', 85, 951),
    Facility(15, 'Customs_1F_Locked_Room10', 1576, 277),
    Facility(15, 'Customs_1F_Locked_Room11', 1578, 294),
    Facility(15, 'Customs_1F_Locked_Room12', 2554, 84),
    Facility(15, 'Customs_1F_Locked_Room13', 2445, -317),
    Facility(15, 'Customs_1F_Locked_Room14', 2499, -271),
    Facility(15, 'Customs_1F_Locked_Room15', 1303, -304),
    Facility(15, 'Customs_1F_Locked_Room16', 1189, -66),
    Facility(15, 'Customs_1F_Locked_Room17', 1193, -3),
    Facility(15, 'Customs_1F_Locked_Room18', 282, 131),
    Facility(15, 'Customs_1F_Locked_Room19', -2233, -586),
    Facility(15, 'Customs_1F_Locked_Room20', -2192, -1213),
    Facility(15, 'Customs_1F_Locked_Room21', -2513, -1284),
    //무기 박스
    Facility(5, 'Customs_1F_Weapon_Box1', 351, 930),
    Facility(5, 'Customs_1F_Weapon_Box2', 354, 883),
    Facility(5, 'Customs_1F_Weapon_Box3', 1938, 832),
    Facility(5, 'Customs_1F_Weapon_Box4', 1965, 740),
    Facility(5, 'Customs_1F_Weapon_Box5', 2022, 812),
    Facility(5, 'Customs_1F_Weapon_Box6', 2395, -762),
    Facility(5, 'Customs_1F_Weapon_Box7', 2532, -719),
    Facility(5, 'Customs_1F_Weapon_Box8', 2443, -289),
    Facility(5, 'Customs_1F_Weapon_Box9', 2455, -284),
    Facility(5, 'Customs_1F_Weapon_Box10', 2459, -270),
    Facility(5, 'Customs_1F_Weapon_Box11', 1868, -274),
    Facility(5, 'Customs_1F_Weapon_Box12', 1086, -507),
    Facility(5, 'Customs_1F_Weapon_Box13', 1596, -483),
    Facility(5, 'Customs_1F_Weapon_Box14', 1294, -553),
    Facility(5, 'Customs_1F_Weapon_Box15', 1573, 298),
    Facility(5, 'Customs_1F_Weapon_Box16', 1136, -121),
    Facility(5, 'Customs_1F_Weapon_Box17', 270, 137),
    Facility(5, 'Customs_1F_Weapon_Box18', 248, 54),
    Facility(5, 'Customs_1F_Weapon_Box19', 224, -727),
    Facility(5, 'Customs_1F_Weapon_Box20', 201, -813),
    Facility(5, 'Customs_1F_Weapon_Box21', 156, -611),
    Facility(5, 'Customs_1F_Weapon_Box22', 126, -592),
    Facility(5, 'Customs_1F_Weapon_Box23', 116, -594),
    Facility(5, 'Customs_1F_Weapon_Box24', -1777, 64),
    Facility(5, 'Customs_1F_Weapon_Box25', -2142, -1118),
    Facility(5, 'Customs_1F_Weapon_Box26', -2212, -549),
    Facility(5, 'Customs_1F_Weapon_Box27', -2564, -351),
    Facility(5, 'Customs_1F_Weapon_Box28', -2811, -662),
    Facility(5, 'Customs_1F_Weapon_Box29', 192, -919),
    //바닥 룻
    Facility(16, 'Customs_1F_Loose_Loot1', 2072, 36), //글카
    Facility(16, 'Customs_1F_Loose_Loot2', 1559, 300), //글카
    Facility(16, 'Customs_1F_Loose_Loot3', -2257, -869), //글카
    Facility(16, 'Customs_1F_Loose_Loot4', -925, 32), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot5', -520, 28), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot6', -913, -846), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot7', -2306, -803), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot8', -2696, -895), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot9', -867, 762), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot10', 1831, -543), //수리 키트
    Facility(16, 'Customs_1F_Loose_Loot11', 2834, -728), //워터 필터
    Facility(16, 'Customs_1F_Loose_Loot12', 1922, -291), //워터 필터
    Facility(16, 'Customs_1F_Loose_Loot13', 2024, -453), //워터 필터
    Facility(16, 'Customs_1F_Loose_Loot14', 778, -1127), //마법 나무
    Facility.pic(16, 'Customs_1F_Loose_Loot15', -2614, -445), //주차장 트렁크 총기
    Facility(16, 'Customs_1F_Loose_Loot16', -498, -963), //귀금속
    Facility(16, 'Customs_1F_Loose_Loot17', -475, -966), //귀금속
    Facility(16, 'Customs_1F_Loose_Loot18', 263, -751), //귀금속
    Facility(16, 'Customs_1F_Loose_Loot19', 2738, -688), //귀금속
    Facility(16, 'Customs_1F_Loose_Loot20', 1346, -681), //귀금속
  ];

  @override
  _CustomsFullMapState createState() => _CustomsFullMapState();
}

class _CustomsFullMapState extends State<CustomsFullMap> {
  bool _filterVisible = MyApp.filterToggle;
  bool allToggle = true;
  final List<bool> selections = List.generate(16, (index) => true);
  var size = const Size(8000.0, 8000.0);
  String imageName = 'customs_1F.png';
  String imageName2 = 'customs_2F.png';
  String imageName3 = 'customs_3F.png';
  String imageName4 = 'customs_B1.png';

  Future<Image> downloadMap() async {
    final ref = FirebaseStorage.instance.ref().child('Customs/$imageName');
    final ref2 = FirebaseStorage.instance.ref().child('Customs/$imageName2');
    final ref3 = FirebaseStorage.instance.ref().child('Customs/$imageName3');
    final ref4 = FirebaseStorage.instance.ref().child('Customs/$imageName4');

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    if (!await File('$path/$imageName2').exists()) {
      await ref2.writeToFile(File('$path/$imageName2'));
    }
    if (!await File('$path/$imageName3').exists()) {
      await ref3.writeToFile(File('$path/$imageName3'));
    }
    if (!await File('$path/$imageName4').exists()) {
      await ref4.writeToFile(File('$path/$imageName4'));
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
}
