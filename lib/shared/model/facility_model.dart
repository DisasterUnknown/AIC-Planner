import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';

class FacilityDefinition {
  final String id;
  final int row;
  final int col;
  final String name;
  final int? power;
  final String? tier;
  final String? skill;
  final String? node;
  final String description;
  final FacilityType facilityType;

  final String? baseImgPath;
  final String? topDownImgPath;

  // Conbat Stats
  final int? atk;
  final String? atkInterval;
  final String? energyPerUse;
  final int? maxCharge;

  final List<UnitRecipes>? recipes;

  const FacilityDefinition({
    required this.id,
    required this.row,
    required this.col,
    required this.name,
    required this.description,
    required this.facilityType,

    this.power,
    this.tier,

    this.skill,
    this.node,
    this.baseImgPath,
    this.topDownImgPath,

    // Combat Stats
    this.atk,
    this.atkInterval,
    this.energyPerUse,
    this.maxCharge,

    this.recipes,
  });
}
