import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aic_planner/shared/data/constants.dart';

class MapPreviewWidget extends StatelessWidget {
  final Widget mapContent;

  const MapPreviewWidget({super.key, required this.mapContent});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: GlobalKey(),
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
              fit: BoxFit.contain, // fit entire map inside the preview
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 3,
                height: MediaQuery.of(context).size.height * 3,
                child: mapContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showSaveAsDialog(BuildContext context, {required Widget mapContent}) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
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
                    // Map preview / Extra data
                    MapPreviewWidget(mapContent: mapContent),
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
                          TextField(
                            controller: nameController,
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
                          TextField(
                            controller: descriptionController,
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
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
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

                                  Navigator.of(context).pop();
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
                                      color: Colors.greenAccent,
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
