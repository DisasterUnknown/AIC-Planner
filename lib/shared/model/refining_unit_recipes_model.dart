import 'package:aic_planner/shared/model/refining_unit_recipes_input_model.dart';
import 'package:aic_planner/shared/model/refining_unit_recipes_output_model.dart';

class RefiningUnitRecipes {
  final List<RefiningUnitRecipesInputModel> input;
  final List<RefiningUnitRecipesOutputModel> output;

  final int processingTime;
  final String processingTimeUnit;

  RefiningUnitRecipes({
    required this.input,
    required this.output,
    required this.processingTime,
    required this.processingTimeUnit,
  });
}