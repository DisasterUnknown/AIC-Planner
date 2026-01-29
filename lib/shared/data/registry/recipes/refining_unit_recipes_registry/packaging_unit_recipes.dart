import 'package:aic_planner/shared/data/registry/product_registry.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class PackagingUnitRecipesRegistryClass {
  static final List<RefiningUnitRecipes> data = [
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystPart,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kLCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAmethystPart,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kAketinePowder,
          inputAmount: 1,
          inputTime: 6,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kIndustrialExplosive,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kSCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kSteelPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kDenseOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kHCValleyBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kXiranite,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kDenseOriginiumPowder,
          inputAmount: 15,
          inputTime: 90,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kLCWulingBattery,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleJincaoSolution,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kJincaoDrink,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    RefiningUnitRecipes(
      input: [
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumBottleYazhenSolution,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        RefiningUnitRecipesInputModel(
          input: ProductRegistry.kFerriumPart,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        RefiningUnitRecipesOutputModel(
          output: ProductRegistry.kYazhenSyringeC,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
