import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/filling_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/fitting_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/gearing_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/grinding_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/moulding_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/packaging_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/planting_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/reactor_crucible_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/refining_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/seed_picking_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/separating_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes_registry/refining_unit_recipes_registry/shredding_unit_recipes.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';

class RefiningUnitRecipesRegistry {
  static const List<UnitRecipes> kRefiningUnitRecipes = RefiningRecipesRegistryClass.data;
  
  static const List<UnitRecipes> kShreddingUnitRecipes = ShreddingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kGearingUnitRecipes = GearingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kMouldingUnitRecipes = MouldingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kFittingUnitRecipes = FittingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kFillingUnitRecipes = FillingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kPackagingUnitRecipes = PackagingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kSeedPickingUnitRecipes = SeedPickingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kPlantingUnitRecipes = PlantingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kGrindingUnitRecipes = GrindingUnitRecipesRegistryClass.data;

  static const List<UnitRecipes> kReactorCrucibleRecipes = ReactorCrucibleRecipesRegistryClass.data;

  static const List<UnitRecipes> kSeparatingUnitRecipes = SeparatingUnitRecipesRegistryClass.data;
}
