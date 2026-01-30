import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:flutter/material.dart';

class FacilityInstance {
  final FacilityDefinition def;
  Offset position;
  bool active = true;

  FacilityInstance({required this.def, required this.position});
}