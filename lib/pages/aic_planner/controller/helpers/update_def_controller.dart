import 'package:aic_planner/pages/aic_planner/config/enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

class UpdateDefController {
  static FacilityDefinition updateDef(
    FacilityDefinition def, {
    PlacementDirection? dir,
    int? row,
    int? col,
  }) {
    if (dir == PlacementDirection.left || dir == PlacementDirection.right) {
      // swap row and col for rotated placement
      return FacilityDefinition(
        id: def.id,
        row: def.col, // swapped
        col: def.row, // swapped
        name: def.name,
        power: def.power,
        tier: def.tier,
        description: def.description,
        facilityType: def.facilityType,
        skill: def.skill,
        node: def.node,
        baseImgPath: def.baseImgPath,
        topDownImgPath: def.topDownImgPath,
        atk: def.atk,
        atkInterval: def.atkInterval,
        energyPerUse: def.energyPerUse,
        maxCharge: def.maxCharge,
        recipes: def.recipes,
      );
    } else if (row != null && col != null) {
      return FacilityDefinition(
        id: def.id,
        row: row,
        col: col,
        name: def.name,
        power: def.power,
        tier: def.tier,
        description: def.description,
        facilityType: def.facilityType,
        skill: def.skill,
        node: def.node,
        baseImgPath: def.baseImgPath,
        topDownImgPath: def.topDownImgPath,
        atk: def.atk,
        atkInterval: def.atkInterval,
        energyPerUse: def.energyPerUse,
        maxCharge: def.maxCharge,
        recipes: def.recipes,
      );
    }
    return def; // use original
  }
}
