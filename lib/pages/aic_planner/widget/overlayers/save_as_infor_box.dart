import 'dart:ui';
import 'package:aic_planner/pages/aic_planner/controller/aic_planner_controller.dart';
import 'package:aic_planner/shared/storage/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:aic_planner/shared/data/constants.dart';

/// Stateful widget that allows zooming, panning, and snapshotting the map
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
    await WidgetsBinding.instance.endOfFrame;
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

/// Shows the save dialog with name, description, and map preview
Future<bool?> showSaveAsDialog(
  BuildContext context, {
  required Widget mapContent,
  required AciPlannerController controller,
}) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Create a key to access MapPreviewWidgetState
  final mapKey = GlobalKey<MapPreviewWidgetState>();

  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xFF1B1B1B),
        insetPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 400, maxWidth: 500),
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 27, 27, 27),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Map preview
                    MapPreviewWidget(key: mapKey, mapContent: mapContent),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Save As',
                            style: TextStyle(
                              color: AppCustomColors.text,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Name field
                          TextField(
                            controller: nameController,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(color: AppCustomColors.text),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: AppCustomColors.text.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Description field
                          TextField(
                            controller: descriptionController,
                            textCapitalization: TextCapitalization.sentences,
                            style: TextStyle(color: AppCustomColors.text),
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(
                                color: AppCustomColors.text.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  color: const Color(0xFF2C2C2C),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () async {
                                  final name = nameController.text.trim();
                                  final description = descriptionController.text
                                      .trim();

                                  if (name.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Name cannot be empty'),
                                      ),
                                    );
                                    return;
                                  }

                                  // Capture map snapshot
                                  await mapKey.currentState!.captureMap();
                                  final mapImageBytes =
                                      mapKey.currentState!.mapImageBytes!;

                                  // Save slot with name, description, image, and facilities
                                  final bool ressult =
                                      await PlannerSaveStorage.saveSlot(
                                        name: name,
                                        description: description,
                                        mapImageBytes: mapImageBytes,
                                        facilities: controller.getFacilities(),
                                      );

                                  if (!context.mounted) return;
                                  Navigator.of(context).pop(ressult);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  color: const Color(0xFF2C2C2C),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
