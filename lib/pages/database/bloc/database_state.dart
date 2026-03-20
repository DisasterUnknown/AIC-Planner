import 'dart:typed_data';

import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

sealed class DatabaseState {
  final FacilityType? selectedType;
  final FacilityDefinition? selectedFacility;
  final Uint8List? topImages;
  final Map<String, Uint8List?>? sideImages;
  final bool isProductSelection;

  const DatabaseState({this.selectedType, this.selectedFacility, this.topImages, this.sideImages, this.isProductSelection = false});

  DatabaseInitial toInitial() => DatabaseInitial();

  DatabaseLoading toLoading() => DatabaseLoading();

  DatabaseReady toReady({
    FacilityType? selectedType,
    FacilityDefinition? selectedFacility,
    Uint8List? topImages,
    Map<String, Uint8List?>? sideImages,
    bool isProductSelection = false,
  }) => DatabaseReady(
    selectedType: selectedType,
    selectedFacility: selectedFacility,
    topImages: topImages,
    sideImages: sideImages ?? {},
    isProductSelection: isProductSelection,
  );

  DatabaseError toError(String errorMessage) =>
      DatabaseError(errorMessage: errorMessage);
}

class DatabaseInitial extends DatabaseState {
  const DatabaseInitial();
}

class DatabaseLoading extends DatabaseState {
  const DatabaseLoading();
}

class DatabaseReady extends DatabaseState {
  const DatabaseReady({
    required super.selectedType,
    required super.selectedFacility,
    required super.topImages,
    required super.sideImages,
    required super.isProductSelection,
  });
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  const DatabaseError({required this.errorMessage});
}
