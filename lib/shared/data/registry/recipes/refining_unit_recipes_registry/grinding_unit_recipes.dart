import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class GrindingUnitRecipesRegistryClass {
  static final List<RefiningUnitRecipes> data = [
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kGroundBuckflowerPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kGroundCitromePowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCarbonPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kDenseCarbonPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kDenseOriginiumPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kOrigocrustPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kDenseOrigocrustPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kCrystonPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kDenseFerriumPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
