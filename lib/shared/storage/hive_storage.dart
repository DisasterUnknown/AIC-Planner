// planner_save_storage.dart
import 'dart:typed_data';

import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/config/config.dart' show AppConfig;
import 'package:aic_planner/shared/model/saved_facility_model.dart';
import 'package:aic_planner/shared/service/shared_pref_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class PlannerSaveStorage {
  static final _box = Hive.box(AppConfig.hiveBoxName);

  // -----------------
  // SAVE SLOT
  // -----------------
  static Future<void> saveSlot({
    required String name,
    required String description,
    required Uint8List mapImageBytes,
    required List<FacilityInstance> facilities,
  }) async {
    final String slotId = Uuid().v4();

    final savedFacilities = facilities.map((f) {
      return {
        'id': f.def.id,
        'x': f.position.dx.toInt(),
        'y': f.position.dy.toInt(),
        'row': f.def.row,
        'col': f.def.col,
      };
    }).toList();

    final data = {
      'name': name,
      'description': description,
      'mapImage': mapImageBytes,
      'facilities': savedFacilities,
    };

    await _box.put('${AppConfig.hiveSlotKey}$slotId', data);
    await LocalSharedPreferences.setString(
      AppConfig.sharedPrefSaveSlotKey,
      '${AppConfig.hiveSlotKey}$slotId',
    );
  }

  static Future<bool> updateSlot({
    required List<FacilityInstance> facilities,
    String? name,
    String? description,
  }) async {
    final String? slotSaveId = await LocalSharedPreferences.getString(
      AppConfig.sharedPrefSaveSlotKey,
    );

    if (slotSaveId == null || !_box.containsKey(slotSaveId)) {
      return false;
    }

    final existing = _box.get(slotSaveId) ?? {};

    final savedFacilities = facilities.map((f) {
      return {
        'id': f.def.id,
        'x': f.position.dx.toInt(),
        'y': f.position.dy.toInt(),
        'row': f.def.row,
        'col': f.def.col,
      };
    }).toList();

    final updatedData = {
      'name': name ?? existing['name'] ?? '',
      'description': description ?? existing['description'] ?? '',
      'facilities': savedFacilities,
    };

    await _box.put(slotSaveId, updatedData);
    return true;
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

    return {'facilities': facilities, 'slot': raw['slot']};
  }

  // -----------------
  // CLEAR
  // -----------------
  static Future<void> clearSlot(int slot) async {
    await _box.delete('${AppConfig.hiveSlotKey}$slot');
  }
}
