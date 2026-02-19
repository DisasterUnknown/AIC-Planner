import 'package:aic_planner/shared/data/registry/product_registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class MouldingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystFiber,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kAmethystBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kFerrium,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
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
          input: ProductRegistry.kCrystonFiber,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCrystonBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kSteel,
          inputAmount: 2,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 2,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kSteelBottle,
          outputAmount: 1,
          outputTime: 30,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
