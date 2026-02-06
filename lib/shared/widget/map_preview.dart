import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MapPreviewWidget extends StatefulWidget {
  final Widget mapContent;

  const MapPreviewWidget({super.key, required this.mapContent});

  @override
  MapPreviewWidgetState createState() => MapPreviewWidgetState();
}

class MapPreviewWidgetState extends State<MapPreviewWidget> {
  final GlobalKey _repaintKey = GlobalKey();
  Uint8List? mapImageBytes;

  /// Call this to capture the map as image bytes
  Future<void> captureMap() async {
    RenderRepaintBoundary boundary =
        _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    mapImageBytes = byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _repaintKey,
      child: Container(
        width: 150,
        height: 237,
        decoration: BoxDecoration(
          color: const Color(0xFF1B1B1B),
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xB3717171), width: 2),
          boxShadow: [
            BoxShadow(
              color: const Color(0xB3717171).withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: ClipRect(
          child: InteractiveViewer(
            constrained: false,
            minScale: 0.1,
            maxScale: 2.0,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 3,
                height: MediaQuery.of(context).size.height * 3,
                child: widget.mapContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
