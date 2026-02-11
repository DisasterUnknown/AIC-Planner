import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

sealed class DatabaseEvent {}

class InitializeDatabase extends DatabaseEvent {}

class LoadDatabaseRecord extends DatabaseEvent {}

class SelectDatabaseRecord extends DatabaseEvent {
  final int index;

  SelectDatabaseRecord(this.index);
}

class SelectFacilityType extends DatabaseEvent {
  final FacilityDefinition facility;
  final FacilityType type;
  SelectFacilityType(this.facility, this.type);
}

class SelectFacility extends DatabaseEvent {
  final FacilityDefinition facility;
  final FacilityType type;
  SelectFacility(this.facility, this.type);
}
