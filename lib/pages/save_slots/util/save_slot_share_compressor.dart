import 'dart:convert';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:image/image.dart' as img;

class SaveSlotCompressor {
  
  static String compress(Map<String, dynamic> data) {
    // 1. Clone the map to avoid modifying the original app state
    final Map<String, dynamic> exportMap = Map.from(data);

    // 2. IMAGE DROP SIZE LOGIC
    if (exportMap['mapImage'] != null && exportMap['mapImage'] is Uint8List) {
      exportMap['mapImage'] = _reduceImageSize(exportMap['mapImage']);
    }

    // 3. Prepare for JSON
    if (exportMap['createdAt'] is DateTime) {
      exportMap['createdAt'] = (exportMap['createdAt'] as DateTime).toIso8601String();
    }

    // 4. Encode to JSON -> GZip -> Base64
    final String jsonString = jsonEncode(exportMap);
    final List<int> stringBytes = utf8.encode(jsonString);
    final List<int> compressed = GZipEncoder().encode(stringBytes);
    
    return base64UrlEncode(compressed);
  }

  /// Shrinks the image to make the shareable string significantly shorter
  static String _reduceImageSize(Uint8List originalBytes) {
    // Decode the image (supports PNG, JPG, etc.)
    img.Image? image = img.decodeImage(originalBytes);
    if (image == null) return base64Encode(originalBytes);
    img.Image resized = img.copyResize(image, width: 400);

    // Encode as JPG with 50% quality (Massive space saver compared to PNG)
    final compressedJpg = img.encodeJpg(resized, quality: 50);
    
    return base64Encode(compressedJpg);
  }

  static Map<String, dynamic> decompress(String compressedString) {
    // 1. Decode Base64 & Decompress GZip
    final List<int> compressedBytes = base64Url.decode(compressedString);
    final List<int> decompressedBytes = GZipDecoder().decodeBytes(compressedBytes);

    // 2. UTF-8 Bytes to JSON Map
    final String jsonString = utf8.decode(decompressedBytes);
    final Map<String, dynamic> data = jsonDecode(jsonString);

    // 3. Restore types
    if (data['mapImage'] != null && data['mapImage'] is String) {
      data['mapImage'] = base64Decode(data['mapImage']);
    }
    if (data['createdAt'] != null) {
      data['createdAt'] = DateTime.parse(data['createdAt']);
    }

    return data;
  }
}