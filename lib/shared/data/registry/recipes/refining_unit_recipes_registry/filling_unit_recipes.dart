import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class FillingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystBottle,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystBottle,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kBuckFlowerPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleB,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kCitromePowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeB,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kSteelBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kGroundBuckflowerPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kBuckCapsuleA,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kSteelBottle,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kGroundCitromePowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCannedCitromeA,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    // Special single-input solutions
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kCleanWater,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleCleanWater,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kJincaoSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleJincaoSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kYazhenSolution,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleYazhenSolution,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottle,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kLiquidXiranite,
          inputAmount: 1,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumBottleLiquidXiranite,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
