import 'package:aic_planner/shared/model/unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/unit_recipes_output_model.dart';

class UnitRecipes {
  final List<UnitRecipesInputModel> input;
  final List<UnitRecipesOutputModel> output;

  final int processingTime;
  final String processingTimeUnit;

  const UnitRecipes({
    required this.input,
    required this.output,
    required this.processingTime,
    required this.processingTimeUnit,
  });
}