import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

sealed class DatabaseState {
  final FacilityType? selectedType;
  final FacilityDefinition? selectedFacility;

  const DatabaseState({
    this.selectedType,
    this.selectedFacility,
  });

  DatabaseInitial toInitial() =>
      DatabaseInitial();

  DatabaseLoading toLoading() =>
      DatabaseLoading();

  DatabaseReady toReady({
    FacilityType? selectedType,
    FacilityDefinition? selectedFacility,
  }) => DatabaseReady(
    selectedType: selectedType,
    selectedFacility: selectedFacility,
  );

  DatabaseError toError(String errorMessage) => DatabaseError(
    errorMessage: errorMessage,
  );
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
  });
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  const DatabaseError({
    required this.errorMessage,
  });
}
