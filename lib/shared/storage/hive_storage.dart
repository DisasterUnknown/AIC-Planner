// planner_save_storage.dart
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/config/config.dart' show AppConfig;
import 'package:aic_planner/shared/model/saved_facility_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlannerSaveStorage {
  static final _box = Hive.box(AppConfig.hiveBoxName);

  // -----------------
  // SAVE SLOT
  // -----------------
  static Future<void> saveSlot(
    int slot,
    List<FacilityInstance> facilities,
  ) async {
    // Convert FacilityInstance → SavedFacility
    final saved = facilities
        .map(
          (f) => SavedFacility(
            facilityId: f.def.id,
            x: f.position.dx.toInt(),
            y: f.position.dy.toInt(),
            row: f.def.row,
            col: f.def.col,
          ),
        )
        .toList();

    await _box.put('${AppConfig.hiveSlotKey}$slot', saved);
  }

  static List<SavedFacility> loadSlot(int slot) {
    final raw = _box.get('${AppConfig.hiveSlotKey}$slot') as List?;
    if (raw == null) return [];

    final List<SavedFacility> facilities = [];
    for (var item in raw) {
      facilities.add(
        SavedFacility(
          facilityId: item['id'],
          x: item['x'] as int,
          y: item['y'] as int,
          row: item['row'] as int,
          col: item['col'] as int,
        ),
      );
    }

    return facilities;
  }

  // -----------------
  // LAST SAVE
  // -----------------
  static Future<void> saveLast(
    List<FacilityInstance> facilities, {
    String? fromSlot,
  }) async {
    final savedFacilities = facilities
        .map(
          (f) => {
            'id': f.def.id,
            'x': f.position.dx.toInt(),
            'y': f.position.dy.toInt(),
            'row': f.def.row,
            'col': f.def.col,
          },
        )
        .toList();

    final lastSaveData = {'facilities': savedFacilities, 'slot': fromSlot};

    await _box.put(AppConfig.hiveLastSaveKey, lastSaveData);
  }

  static Map<String, dynamic> loadLast() {
    final raw = _box.get(AppConfig.hiveLastSaveKey) as Map?;
    if (raw == null) return {'facilities': <SavedFacility>[], 'slot': null};

    final facilitiesRaw = raw['facilities'] as List?;
    final facilities = (facilitiesRaw ?? []).map((item) {
      return SavedFacility(
        facilityId: item['id'],
        x: item['x'] as int,
        y: item['y'] as int,
        row: item['row'] as int,
        col: item['col'] as int,
      );
    }).toList();

    return {
      'facilities': facilities,
      'slot': raw['slot'], 
    };
  }

  // -----------------
  // CLEAR
  // -----------------
  static Future<void> clearSlot(int slot) async {
    await _box.delete('${AppConfig.hiveSlotKey}$slot');
  }
}
