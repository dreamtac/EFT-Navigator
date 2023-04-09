import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  final Widget child;
  const CustomMarker({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final markerLeft = screenWidth * 0.5; // 화면 가로 중앙
    final markerTop = screenHeight * 0.3; // 화면 세로 상단

    return Positioned(
      left: markerLeft,
      top: markerTop,
      child: Transform.translate(
        offset: const Offset(-12, -24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 48),
            child,
          ],
        ),
      ),
    );
  }
}

class CustomsFullMap extends StatefulWidget {
  const CustomsFullMap({super.key});

  @override
  State<CustomsFullMap> createState() => _CustomsFullMapState();
}

class _CustomsFullMapState extends State<CustomsFullMap> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.1,
      maxScale: 5,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/customs.png',
            fit: BoxFit.cover,
          ),
          const CustomMarker(child: Text('Test'))
        ],
      ),
    );
  }
}
