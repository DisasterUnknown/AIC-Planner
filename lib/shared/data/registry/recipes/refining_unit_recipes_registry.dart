import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/filling_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/fitting_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/gearing_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/moulding_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/packaging_unit_recipes.dart';
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
}
