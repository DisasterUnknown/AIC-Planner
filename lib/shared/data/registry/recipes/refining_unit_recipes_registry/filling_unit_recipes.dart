import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class FillingUnitRecipesRegistryClass {
  static final List<RefiningUnitRecipes> data = [
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystBottle,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystBottle,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleB,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeB,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSteelBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kGroundBuckflowerPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleA,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSteelBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kGroundCitromePowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeA,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    // Special single-input solutions
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kCleanWater,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleCleanWater,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kJincaoSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleJincaoSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kYazhenSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleYazhenSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kLiquidXiranite,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleLiquidXiranite,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
