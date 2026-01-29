import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/gearing_unit_recipes.dart';
import 'package:aic_planner/shared/data/registry/recipes/refining_unit_recipes_registry/shredding_unit_recipes.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';

class RefiningUnitRecipesRegistry {
  static final List<RefiningUnitRecipes> kRefiningUnitRecipes = GearingUnitRecipesRegistryClass.data;
  
  static final List<RefiningUnitRecipes> kShreddingUnitRecipes = ShreddingUnitRecipesRegistryClass.data;

  static final List<RefiningUnitRecipes> kGearingUnitRecipes = GearingUnitRecipesRegistryClass.data;
}
