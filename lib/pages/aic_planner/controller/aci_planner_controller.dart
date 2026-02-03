import 'dart:async';
import 'package:aic_planner/pages/aic_planner/config/app_config.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:flutter/material.dart';

class AciPlannerController extends ChangeNotifier {
  // -----------------
  // WORLD STATE
  // -----------------
  final List<FacilityInstance> facilities = [];
  FacilityInstance? editingFactory;

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
  // USER ACTIONS
  // -----------------
  void startPlacing(FacilityInstance instance) {
    editingFactory = instance;
    notifyListeners();
  }

  void updateEditing(Offset delta) {
    if (editingFactory == null) return;
    editingFactory!.position += delta;
    notifyListeners();
  }

  void placeEditing() {
    if (editingFactory == null) return;

    editingFactory!.position = snapToGrid(editingFactory!.position);
    facilities.add(editingFactory!);
    editingFactory = null;

    notifyListeners();
  }

  void cancelEditing() {
    editingFactory = null;
    notifyListeners();
  }

  // -----------------
  // HELPERS
  // -----------------
  Offset snapToGrid(Offset pos) {
    final step = AppConfig.gridStep;
    return Offset(
      (pos.dx / step).round() * step,
      (pos.dy / step).round() * step,
    );
  }
}
