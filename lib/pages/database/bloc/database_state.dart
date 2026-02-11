import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

sealed class DatabaseState {
  final int selectedIndex;
  final FacilityType? selectedType;
  final FacilityDefinition? selectedFacility;

  const DatabaseState({
    required this.selectedIndex,
    this.selectedType,
    this.selectedFacility,
  });

  DatabaseInitial toInitial() =>
      DatabaseInitial(selectedIndex: selectedIndex);

  DatabaseLoading toLoading() =>
      DatabaseLoading(selectedIndex: selectedIndex);

  DatabaseReady toReady({
    int? selectedIndex,
    FacilityType? selectedType,
    FacilityDefinition? selectedFacility,
  }) => DatabaseReady(
    selectedType: selectedType,
    selectedFacility: selectedFacility,
    selectedIndex: selectedIndex ?? this.selectedIndex,
  );

  DatabaseError toError(String errorMessage) => DatabaseError(
    errorMessage: errorMessage,
    selectedIndex: selectedIndex,
  );
}

class DatabaseInitial extends DatabaseState {
  const DatabaseInitial({required super.selectedIndex});
}

class DatabaseLoading extends DatabaseState {
  const DatabaseLoading({required super.selectedIndex});
}

class DatabaseReady extends DatabaseState {
  const DatabaseReady({
    required super.selectedIndex,
    required super.selectedType,
    required super.selectedFacility,
  });
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  const DatabaseError({
    required this.errorMessage,
    required super.selectedIndex,
  });
}
