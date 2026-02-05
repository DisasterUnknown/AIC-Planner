part of '../aic_planner_controller.dart';

// Save last save
void saveLastSaveController(List<FacilityInstance> facilities) {
  PlannerSaveStorage.saveLast(facilities);
}

// Load last save
Future<void> loadLastSaveController(
  List<FacilityInstance> facilities,
  Function notifyListeners,
) async {
  // Load saved data from Hive
  final savedFacilities = PlannerSaveStorage.loadLast();
  if (savedFacilities.isEmpty) return; // nothing to load

  // Clear current facilities
  facilities.clear();

  // Convert SavedFacility → FacilityInstance
  for (var saved in savedFacilities) {
    // Find the definition by ID
    FacilityDefinition def = AllFacilitiesList.allFacilities.firstWhere(
      (f) => f.id == saved.facilityId,
    );

    def = updateDef(def, row: saved.row, col: saved.col);

    facilities.add(
      FacilityInstance(
        def: def,
        position: Offset(saved.x.toDouble(), saved.y.toDouble()),
      ),
    );
  }

  // Notify UI to rebuild
  notifyListeners();
}
