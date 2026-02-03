import 'dart:async';
import 'package:aic_planner/pages/aic_planner/config/app_config.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
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
    activeFactoryType = null;
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
  void placeFactoryAt(Offset position) {
    if (activeFactoryType == null) return;

    final snapped = snapToGrid(position);

    if (!_overlaps(snapped)) {
      editingFactories.add(
        FacilityInstance(def: activeFactoryType!.def, position: snapped),
      );
      notifyListeners();
    }
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
  bool _overlaps(Offset pos, {FacilityInstance? ignore}) {
    final all = [...facilities, ...editingFactories];
    for (var f in all) {
      if (ignore != null && f == ignore) continue;

      final rect1 = Rect.fromLTWH(
        pos.dx,
        pos.dy,
        f.def.col * AppConfig.gridStep,
        f.def.row * AppConfig.gridStep,
      );

      final rect2 = Rect.fromLTWH(
        f.position.dx,
        f.position.dy,
        f.def.col * AppConfig.gridStep,
        f.def.row * AppConfig.gridStep,
      );

      if (rect1.overlaps(rect2)) return true;
    }
    return false;
  }
}
