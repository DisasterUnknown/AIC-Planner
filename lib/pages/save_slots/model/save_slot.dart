import 'dart:typed_data';
import 'package:aic_planner/shared/model/saved_facility_model.dart';

class SaveSlot {
  final int index;
  final String? title;
  final String? description;
  final List<SavedFacility> facilities;
  final Uint8List? mapImageBytes;

  const SaveSlot({
    required this.index,
    required this.title,
    required this.description,
    required this.facilities,
    required this.mapImageBytes,
  });
}
