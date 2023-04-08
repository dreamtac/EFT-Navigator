import 'package:flutter/material.dart';
import 'package:image_overlay_map/image_overlay_map.dart';
import 'package:testamp/map_customs/dorm/customs_full_map.dart';

class Dorm01 extends StatefulWidget {
  Dorm01({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<Facility> _facilityList = [];

  @override
  _Dorm01State createState() => _Dorm01State();
}

class _Dorm01State extends State<Dorm01> {
  var size = const Size(3690.0, 2100.0);
  @override
  Widget build(BuildContext context) {
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
    Facility facility = data.data;
    if (facility.facilityId == 1) {
      return const Icon(Icons.location_on, color: Colors.blue);
    } else if (facility.facilityId == 10) {
      return const Icon(Icons.location_on, color: Colors.yellow);
    }

    if (scale > 3) {
      print('enLarge');
    }

    return const Icon(Icons.location_on, color: Colors.redAccent);
  }

  _onMarkerClicked(MarkerModel markerModel) {
    if ((markerModel.data as Facility).name == 'Dorm') {
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
          pageBuilder: (context, animation, secondaryAnimation) =>
              CustomsFullMap(
            title: 'Customs',
          ),
        ),
      );
    }
  }

  _onTab(Size size) {}

  Future<MapContainer> _loadImage() async {
    final MapContainer map = MapContainer(
      Image.asset('assets/images/customsDorm01.png'),
      size,
      markers: _getMarker(widget._facilityList, 3690.0, 2100.0),
      markerWidgetBuilder: _getMarkerWidget,
      onMarkerClicked: _onMarkerClicked,
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
