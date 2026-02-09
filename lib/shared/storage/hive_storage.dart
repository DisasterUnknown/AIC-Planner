// planner_save_storage.dart
import 'dart:typed_data';

import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/model/save_slot.dart';
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
  static Future<bool> saveSlot({
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
      'id': '${AppConfig.hiveSlotKey}$slotId',
      'name': name,
      'description': description,
      'mapImage': mapImageBytes,
      'facilities': savedFacilities,
      'createdAt': DateTime.now(),
    };

    await _box.put('${AppConfig.hiveSlotKey}$slotId', data);
    await LocalSharedPreferences.setString(
      AppConfig.sharedPrefSaveSlotKey,
      '${AppConfig.hiveSlotKey}$slotId',
    );
    return true;
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

  static Future<Map<String, dynamic>> loadLast() async {
    final String? currentWorkingSlotId = await LocalSharedPreferences.getString(
      AppConfig.sharedPrefSaveSlotKey,
    );

    Map<dynamic, dynamic>? raw;
    if (currentWorkingSlotId != null) {
      raw = _box.get(currentWorkingSlotId) as Map?;
    } else {
      raw = _box.get(AppConfig.hiveLastSaveKey) as Map?;
    }

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
  // GET BY ID
  // -----------------
  static Future<Map<String, dynamic>> getById(String id) async {
    final dynamic rawData = _box.get(id);

    if (rawData != null && rawData is Map) {
      return Map<String, dynamic>.from(rawData);
    }

    return {};
  }

  // -----------------
  // ALL SLOTS
  // -----------------
  static List<SaveSlot> getAllSaveSlotsTyped() {
    final List<SaveSlot> result = [];

    // Load all save slots
    for (final key in _box.keys) {
      if (key is! String) continue;
      if (!key.startsWith(AppConfig.hiveSlotKey)) continue;

      result.add(loadSlotByKey(key, 0));
    }

    // Sort by createdAt ascending; nulls go to the end
    result.sort((a, b) {
      if (a.createdAt == null && b.createdAt == null) return 0;
      if (a.createdAt == null) return 1;
      if (b.createdAt == null) return -1;
      return a.createdAt!.compareTo(b.createdAt!);
    });

    // Reassign index after sorting
    for (int i = 0; i < result.length; i++) {
      result[i] = SaveSlot(
        id: result[i].id,
        index: i,
        title: result[i].title,
        description: result[i].description,
        facilities: result[i].facilities,
        mapImageBytes: result[i].mapImageBytes,
        createdAt: result[i].createdAt,
      );
    }

    return result;
  }

  // Load save slot by key
  static SaveSlot loadSlotByKey(String key, int index) {
    final raw = _box.get(key) as Map?;
    if (raw == null) {
      return SaveSlot(
        id: '',
        index: index,
        title: '',
        description: '',
        facilities: [],
        mapImageBytes: null,
        createdAt: DateTime.now(),
      );
    }

    final facilitiesRaw = raw['facilities'] as List? ?? [];
    final facilities = facilitiesRaw.map((item) {
      return SavedFacility(
        facilityId: item['id'],
        x: item['x'] as int,
        y: item['y'] as int,
        row: item['row'] as int,
        col: item['col'] as int,
      );
    }).toList();

    return SaveSlot(
      index: index,
      id: raw['id'] as String? ?? '',
      title: raw['name'] as String? ?? '',
      description: raw['description'] as String? ?? '',
      facilities: facilities,
      mapImageBytes: raw['mapImage'] as Uint8List?,
      createdAt: raw['createdAt'] as DateTime?,
    );
  }

  // -----------------
  // IMPORT
  // -----------------
  static Future<void> importSlot(Map<String, dynamic> blueprintData) async {
    final String slotId = Uuid().v4();
    final String id = '${AppConfig.hiveSlotKey}$slotId';
    blueprintData['id'] = id;

    await _box.put(id, blueprintData);
  }

  // -----------------
  // DELETE
  // -----------------
  static Future<void> deleteSlot(String slot) async {
    await _box.delete(slot);
  }

  // -----------------
  // CLEAR
  // -----------------
  static Future<void> clearSlot(int slot) async {
    await _box.delete('${AppConfig.hiveSlotKey}$slot');
  }
}
