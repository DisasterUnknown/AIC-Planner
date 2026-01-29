import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class PackagingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystPart,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kLCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystPart,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kAketinePowder,
          inputAmount: 1,
          inputTime: 6,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kIndustrialExplosive,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kSCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kSteelPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kDenseOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kHCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kXiranite,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kDenseOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kLCWulingBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleJincaoSolution,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kJincaoDrink,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleYazhenSolution,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kYazhenSyringeC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
