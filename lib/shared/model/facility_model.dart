import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';

class FacilityDefinition {
  final String id;
  final int row;
  final int col;
  final String name;
  final int power;
  final String tier;
  final String skill;
  final String description;
  final FacilityType facilityType;

  final List<Enum>? products;
  final String? imagePath;

  // Conbat Stats
  final int? atk;
  final String? atkInterval;
  final String? energyPerUse;
  final int? maxCharge;

  const FacilityDefinition({
    required this.id,
    required this.row,
    required this.col,
    required this.name,
    required this.power,
    required this.tier,
    required this.skill,
    required this.description,
    required this.facilityType,

    this.products,
    this.imagePath,

    // Combat Stats
    this.atk,
    this.atkInterval,
    this.energyPerUse,
    this.maxCharge,
  });
}
