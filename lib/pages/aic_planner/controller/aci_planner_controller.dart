import 'dart:async';
import 'package:aic_planner/pages/aic_planner/config/app_config.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:flutter/material.dart';

class AciPlannerController extends ChangeNotifier {
  // -----------------
  // WORLD STATE
  // -----------------
  final List<FacilityInstance> facilities = []; // permanently placed
  final List<FacilityInstance> editingFactories = []; // in-edit factories

  FacilityInstance? activeFactoryType; // selected type for edit

  Timer? _timer;

  AciPlannerController() {
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
    // ⚡ electricity checks
    // 🏭 production simulation
    // 🎞 animations later
    notifyListeners();
  }

  // -----------------
  // UI UPDATES
  // -----------------
  bool showCancelBtn() {
    if (editingFactories.isEmpty) return false;
    return true;
  }

  // -----------------
  // USER ACTIONS
  // -----------------

  /// Start placing a factory type
  void startPlacing(FacilityInstance instance) {
    activeFactoryType = instance;
    notifyListeners();
  }

  /// Cancel all editing factories
  void cancelEditing() {
    editingFactories.clear();
    notifyListeners();
  }

  /// Confirm all editing factories
  void confirmEditing() {
    for (var f in editingFactories) {
      facilities.add(f);
    }
    editingFactories.clear();
    activeFactoryType = null;
    notifyListeners();
  }

  /// Place a factory on a single click
  /// Place a factory on a single click
  void placeFactoryAt(Offset position) {
    if (activeFactoryType == null) return;

    final def = activeFactoryType!.def;

    // Center the facility on the click
    final offset = Offset(
      def.col * AppConfig.gridStep / 2,
      def.row * AppConfig.gridStep / 2,
    );

    // Calculate the top-left corner so the center is at the click
    final snapped = snapToGrid(position - offset);

    // Check if clicking on the same facility: remove it
    for (var f in editingFactories) {
      if (f.def == def &&
          _rectFromPosition(f.position, f.def).contains(position)) {
        editingFactories.remove(f);
        notifyListeners();
        return;
      }
    }

    // Check for overlap with existing facilities or editing factories
    if (!_overlaps(snapped, newDef: def)) {
      editingFactories.add(FacilityInstance(def: def, position: snapped));
      notifyListeners();
    }
  }

  /// Helper to get a Rect for a facility from its position and def
  Rect _rectFromPosition(Offset pos, FacilityDefinition def) {
    return Rect.fromLTWH(
      pos.dx,
      pos.dy,
      def.col * AppConfig.gridStep,
      def.row * AppConfig.gridStep,
    );
  }

  /// Move all editing factories (click + drag)
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

  /// Check if a position would overlap existing facilities or editing factories
  /// Check if a position would overlap existing facilities or editing factories
  bool _overlaps(Offset pos, {FacilityInstance? ignore, FacilityDefinition? newDef}) {
    final all = [...facilities, ...editingFactories];

    // Use newDef if provided, otherwise fallback to activeFactoryType
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
