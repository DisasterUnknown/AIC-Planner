import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/filling_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/fitting_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/gearing_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/grinding_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/moulding_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/packaging_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/planting_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/reactor_crucible_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/seed_picking_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/separating_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/shredding_unit_recipes.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';

class RefiningUnitRecipesRegistry {
  static final List<RefiningUnitRecipes> kRefiningUnitRecipes = GearingUnitRecipesRegistryClass.data;
  
  static final List<RefiningUnitRecipes> kShreddingUnitRecipes = ShreddingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kGearingUnitRecipes = GearingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kMouldingUnitRecipes = MouldingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kFittingUnitRecipes = FittingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kFillingUnitRecipes = FillingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kPackagingUnitRecipes = PackagingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kSeedPickingUnitRecipes = SeedPickingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kPlantingUnitRecipes = PlantingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kGrindingUnitRecipes = GrindingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kReactorCrucibleRecipes = ReactorCrucibleRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kSeparatingUnitRecipes = SeparatingUnitRecipesRegistryClass.data;
}
