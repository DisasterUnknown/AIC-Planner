import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class SeparatingUnitRecipesRegistryClass {
  static final List<RefiningUnitRecipes> data = [
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleJincaoSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kJincaoSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleYazhenSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kYazhenSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleLiquidXiranite,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kLiquidXiranite,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
