import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';

class FactoryItem {
  final int id;
  final int row;
  final int col;
  final String name;
  final int power;
  final String tier;
  final String description;
  final FacilityType facilityType;

  String? carrier;
  Enum? products;
  String? imagePath = 'assets/images/factory_item.png';

  FactoryItem({
    required this.id,
    required this.row,
    required this.col,
    required this.name,
    required this.power,
    required this.tier,
    required this.description,
    required this.facilityType,

    this.carrier,
    this.imagePath,
  });
}
