import 'dart:async';
import 'package:aic_planner/pages/aic_planner/config/aic_planner_config.dart';
import 'package:aic_planner/pages/aic_planner/config/enums.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:aic_planner/shared/service/hive_storage_service.dart';
import 'package:flutter/material.dart';

part 'helpers/data_manager_controller.dart';
part 'helpers/update_def_controller.dart';

class AciPlannerController extends ChangeNotifier {
  // -----------------
  // WORLD STATE
  // -----------------
  final List<FacilityInstance> facilities = [];        // permanently placed factories
  final List<FacilityInstance> editingFactories = [];  // factories currently being edited
  final List<FacilityInstance> deletingFactories = []; // factories selected for deletion

  bool isDeleteMode = false;        // delete mode active
  FacilityInstance? activeFactoryType; // factory type selected for placement
  PlacementDirection placementDirection = PlacementDirection.up;

  Timer? _timer;

  AciPlannerController() {
    // Start periodic game loop
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      _tick();
    });
  }

  void disposeController() {
    _timer?.cancel();
  }

  // -----------------
  // GAME LOOP
  // -----------------
  void _tick() {
    // placeholder for electricity, production, animation updates
    notifyListeners();
  }

  // -----------------
  // DATA
  // -----------------
  Future<void> loadLastSave() async {
    loadLastSaveController(facilities, notifyListeners);
  }

  // -----------------
  // UI HELPERS
  // -----------------
  bool showCancelBtn() {
    return editingFactories.isNotEmpty || deletingFactories.isNotEmpty;
  }

  // -----------------
  // USER ACTIONS
  // -----------------

  /// Select a factory type for placement
  void startPlacing(FacilityInstance? instance) {
    activeFactoryType = instance;
    notifyListeners();
  }

  /// Cancel all edits and delete selections
  void cancelEditing() {
    editingFactories.clear();
    deletingFactories.clear();
    isDeleteMode = false;
    notifyListeners();
  }

  /// Apply edits and deletes, then save
  void confirmEditing() {
    for (var f in deletingFactories) {
      facilities.remove(f);
    }

    for (var f in editingFactories) {
      facilities.add(f);
    }

    editingFactories.clear();
    deletingFactories.clear();
    isDeleteMode = false;
    notifyListeners();

    saveLastSaveController(facilities);
  }

  /// Rotate placement direction clockwise
  void rotatePlacementDirection() {
    switch (placementDirection) {
      case PlacementDirection.up:
        placementDirection = PlacementDirection.right;
        break;
      case PlacementDirection.right:
        placementDirection = PlacementDirection.down;
        break;
      case PlacementDirection.down:
        placementDirection = PlacementDirection.left;
        break;
      case PlacementDirection.left:
        placementDirection = PlacementDirection.up;
        break;
    }
    notifyListeners();
  }

  /// Place a factory at the given position
  void placeFactoryAt(Offset position) {
    // DELETE MODE
    if (isDeleteMode) {
      // remove editing factory if clicked
      for (var f in editingFactories) {
        if (_rectFromPosition(f.position, f.def).contains(position)) {
          editingFactories.remove(f);
          notifyListeners();
          return;
        }
      }

      // toggle delete selection for permanent factories
      for (var f in facilities) {
        if (_rectFromPosition(f.position, f.def).contains(position)) {
          if (deletingFactories.contains(f)) {
            deletingFactories.remove(f);
          } else {
            deletingFactories.add(f);
          }
          notifyListeners();
          return;
        }
      }
    }

    // EDIT MODE
    FacilityDefinition? activeDef = activeFactoryType?.def;

    // remove duplicate editing factory if clicked
    for (var f in editingFactories) {
      if ((activeDef == null || f.def.id == activeDef.id) &&
          _rectFromPosition(f.position, f.def).contains(position)) {
        editingFactories.remove(f);
        notifyListeners();
        return;
      }
    }

    if (activeFactoryType == null) return;

    FacilityDefinition def = activeFactoryType!.def;
    if (placementDirection == PlacementDirection.left ||
        placementDirection == PlacementDirection.right) {
      def = updateDef(def, dir: placementDirection);
    }

    final offset = Offset(
      def.col * AppConfig.gridStep / 2,
      def.row * AppConfig.gridStep / 2,
    );

    final snapped = snapToGrid(position - offset);

    if (!_overlaps(snapped, newDef: def)) {
      editingFactories.add(FacilityInstance(def: def, position: snapped));
      notifyListeners();
    }
  }

  /// Get bounding rect for a factory
  Rect _rectFromPosition(Offset pos, FacilityDefinition def) {
    return Rect.fromLTWH(
      pos.dx,
      pos.dy,
      def.col * AppConfig.gridStep,
      def.row * AppConfig.gridStep,
    );
  }

  /// Move all editing factories by a delta
  void moveEditing(Offset delta) {
    for (var f in editingFactories) {
      final newPos = f.position + delta;
      final snapped = snapToGrid(newPos);

      if (!_overlaps(snapped, ignore: f)) {
        f.position = snapped;
      }
    }
    notifyListeners();
  }

  // -----------------
  // HELPERS
  // -----------------

  /// Snap position to grid
  Offset snapToGrid(Offset pos) {
    final step = AppConfig.gridStep;
    return Offset(
      (pos.dx / step).round() * step,
      (pos.dy / step).round() * step,
    );
  }

  /// Check if a position overlaps existing or editing factories
  bool _overlaps(
    Offset pos, {
    FacilityInstance? ignore,
    FacilityDefinition? newDef,
  }) {
    final all = [...facilities, ...editingFactories];

    final defToCheck = newDef ?? activeFactoryType?.def;
    if (defToCheck == null) return false;

    final newRect = Rect.fromLTWH(
      pos.dx,
      pos.dy,
      defToCheck.col * AppConfig.gridStep,
      defToCheck.row * AppConfig.gridStep,
    );

    for (var f in all) {
      if (ignore != null && f == ignore) continue;

      final existingRect = Rect.fromLTWH(
        f.position.dx,
        f.position.dy,
        f.def.col * AppConfig.gridStep,
        f.def.row * AppConfig.gridStep,
      );

      if (newRect.overlaps(existingRect)) return true;
    }

    return false;
  }
}
