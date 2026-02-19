import 'package:aic_planner/shared/data/registry/product_registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class GrindingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kGroundBuckflowerPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kGroundCitromePowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kCarbonPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kDenseCarbonPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kDenseOriginiumPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kOrigocrustPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kDenseOrigocrustPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCrystonPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumPowder,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kSandLeafPowder,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kDenseFerriumPowder,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
