import 'package:aic_planner/shared/model/product_model.dart';

class RefiningUnitRecipes {
  final ProductModel input;
  final ProductModel output;

  final int processingTime;
  final String processingTimeUnit;

  final int inputTime;
  final String inputTimeUnit;

  final int outputTime;
  final String outputTimeUnit;

  RefiningUnitRecipes({
    required this.input,
    required this.output,
    required this.processingTime,
    required this.processingTimeUnit,
    required this.inputTime,
    required this.outputTimeUnit,
    required this.outputTime,
    required this.inputTimeUnit,
  });
}