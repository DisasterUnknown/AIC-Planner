import 'package:aic_planner/shared/model/product_model.dart';

class RefiningUnitRecipesOutputModel {
  final ProductModel output;
  final int outputAmount;
  final int outputTime;
  final String outputTimeUnit;

  RefiningUnitRecipesOutputModel({
    required this.output,
    required this.outputAmount,
    required this.outputTime,
    required this.outputTimeUnit,
  });
}
