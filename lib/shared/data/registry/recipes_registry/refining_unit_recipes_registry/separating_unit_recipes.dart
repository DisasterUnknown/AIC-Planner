import 'package:aic_planner/shared/data/registry/product_registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class SeparatingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleJincaoSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kJincaoSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleYazhenSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kYazhenSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleLiquidXiranite,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kLiquidXiranite,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
