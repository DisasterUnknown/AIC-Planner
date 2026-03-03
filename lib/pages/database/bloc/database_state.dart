import 'dart:typed_data';

import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

sealed class DatabaseState {
  final FacilityType? selectedType;
  final FacilityDefinition? selectedFacility;
  final Uint8List? topImages;
  final Map<String, Uint8List?>? sideImages;

  const DatabaseState({this.selectedType, this.selectedFacility, this.topImages, this.sideImages});

  DatabaseInitial toInitial() => DatabaseInitial();

  DatabaseLoading toLoading() => DatabaseLoading();

  DatabaseReady toReady({
    FacilityType? selectedType,
    FacilityDefinition? selectedFacility,
    Uint8List? topImages,
    Map<String, Uint8List?>? sideImages,
  }) => DatabaseReady(
    selectedType: selectedType,
    selectedFacility: selectedFacility,
    topImages: topImages,
    sideImages: sideImages ?? {},
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
  });
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  const DatabaseError({required this.errorMessage});
}
