import 'package:aic_planner/shared/model/product_model.dart';

class UnitRecipesInputModel {
  final ProductModel input;
  final int inputAmount;
  final int inputTime;
  final String inputTimeUnit;

  const UnitRecipesInputModel({
    required this.input,
    required this.inputAmount,
    required this.inputTime,
    required this.inputTimeUnit,
  });
}
