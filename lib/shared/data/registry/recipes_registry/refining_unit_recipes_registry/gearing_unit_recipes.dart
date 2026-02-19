import 'package:aic_planner/shared/data/registry/product_registry/product_registry.dart';
import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class GearingUnitRecipesRegistryClass {
  static const List<UnitRecipes> data = [
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kOrigocrust,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kAmethystFiber,
          inputAmount: 5,
          inputTime: 30,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kAmethystComponent,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kOrigocrust,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kFerrium,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kFerriumComponent,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
    UnitRecipes(
      input: [
        UnitRecipesInputModel(
          input: ProductRegistry.kPackedOrigocrust,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kCrystonFiber,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kCrystonComponent,
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
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
        UnitRecipesInputModel(
          input: ProductRegistry.kPackedOrigocrust,
          inputAmount: 10,
          inputTime: 60,
          inputTimeUnit: 'min',
        ),
      ],
      processingTime: 10,
      processingTimeUnit: 's',
      output: [
        UnitRecipesOutputModel(
          output: ProductRegistry.kXiraniteComponent,
          outputAmount: 1,
          outputTime: 6,
          outputTimeUnit: 'min',
        ),
      ],
    ),
  ];
}
