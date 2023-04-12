/// facilityId (1 = 히든 스태쉬, 2 = 금고, 3 = 데드 스캐브, 4 = 캐비넷, 5 = 무기 박스, 6 = 수류탄 박스, 7 = 탄 박스, 8 = 자켓
///9 = 의약품, 10 = 본체, 11 = 음식 상자, 12 = 더플백, 13 = 공구 박스, 14 = 나무 박스, 15 = 잠긴문, 16 = 바닥 룻
class Facility {
  int facilityId;
  String name;

  double lng;
  double lat;

  bool picture = false;

  Facility(this.facilityId, this.name, this.lng, this.lat);

  Facility.pic(this.facilityId, this.name, this.lng, this.lat) {
    picture = true;
  }
}
