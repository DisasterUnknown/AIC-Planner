part of '../aic_planner_controller.dart';

// Clear work station
void clearWorkstationController(String workstationId) {
  PlannerSaveStorage.deleteBlueprint(workstationId);
}

// Save last save
void saveLastSaveController(List<FacilityInstance> facilities) {
  PlannerSaveStorage.saveWorkingBlueprint(facilities);
}

// Load last save
Future<void> loadLastSaveController(
  List<FacilityInstance> facilities,
  Function notifyListeners,
) async {
  // Load saved data from Hive
  final savedData = await PlannerSaveStorage.loadWorkingBlueprint();
  if (savedData.isEmpty) return; // nothing to load

  // Clear current facilities
  facilities.clear();

  // Convert SavedFacility → FacilityInstance
  final savedFacilities = savedData['facilities'];
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

  // add save slot to pref
  if (savedData['slot'] != null) {
    await LocalSharedPreferences.setString(
      AppConfig.sharedPrefSaveSlotKey,
      savedData['slot'],
    );
  }

  // Notify UI to rebuild
  notifyListeners();
}
