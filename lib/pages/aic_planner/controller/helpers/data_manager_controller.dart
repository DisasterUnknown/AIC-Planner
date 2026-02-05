import 'package:aic_planner/pages/aic_planner/controller/helpers/update_def_controller.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:aic_planner/shared/service/hive_storage_service.dart';
import 'package:flutter/material.dart';

class DataManagerController {
  // Save last save
  static void saveLastSave(List<FacilityInstance> facilities) {
    PlannerSaveStorage.saveLast(facilities);
  }

  // Load last save
  static Future<void> loadLastSave(
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

      def = UpdateDefController.updateDef(def, row: saved.row, col: saved.col);

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
}
