import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class FittingUnitRecipesRegistryClass {
  static final List<RefiningUnitRecipes> data = [
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystFiber,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kAmethystPart,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerrium,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumPart,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCrystonFiber,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kCrystonPart,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSteel,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kSteelPart,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
