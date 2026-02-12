import 'dart:typed_data';

import 'package:aic_planner/shared/data/config/config.dart';
import 'package:hive/hive.dart';

class ImageStorage {
  static final _box = Hive.box(AppConfig.hiveImageBoxName);

  static Future<void> saveSideImage(String key, Uint8List imageBytes) async {
    await _box.put('$key${AppConfig.hiveSideImageSlotKey}', imageBytes);
  }

  static Future<void> saveTopImage(String key, Uint8List imageBytes) async {
    await _box.put('$key${AppConfig.hiveTopImageSlotKey}', imageBytes);
  }

  static Future<Uint8List?> getByKey(String key, String slotKey) async {
    return _box.get('$key$slotKey');
  }

  static Future<List<String>> getAllKeysBySlot(String slotKey) async {
    final List<String> keys = [];

    for (final key in _box.keys) {
      final keyStr = key.toString();

      if (keyStr.endsWith(slotKey)) {
        final facilityKey = keyStr.replaceAll(slotKey, '');
        keys.add(facilityKey);
      }
    }

    return keys;
  }

  static Future<void> deleteByKey(String key, String slotKey) async {
    await _box.delete('$key$slotKey');
  }
}
