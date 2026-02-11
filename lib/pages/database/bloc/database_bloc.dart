import 'package:aic_planner/pages/database/bloc/database_event.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(const DatabaseInitial(selectedIndex: -1)) {
    on<InitializeDatabase>(_onInitialize);
    on<SelectDatabaseRecord>(_onSelectRecord);
    on<LoadDatabaseRecord>(_onLoadRecord);
    on<SelectFacilityType>(_onSelectFacilityType);
    on<SelectFacility>(_onSelectFacility);
  }

  void _onInitialize(InitializeDatabase event, Emitter<DatabaseState> emit) {
    final filtered = AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == FacilityType.processing)
        .toList();

    emit(
      state.toReady(
        selectedIndex: -1,
        selectedType: FacilityType.processing,
        selectedFacility: filtered.first,
      ),
    );
  }

  void _onSelectRecord(
    SelectDatabaseRecord event,
    Emitter<DatabaseState> emit,
  ) {
    emit(state.toReady(selectedIndex: event.index));
  }

  Future<void> _onLoadRecord(
    LoadDatabaseRecord event,
    Emitter<DatabaseState> emit,
  ) async {
    emit(state.toLoading());
  }

  void _onSelectFacilityType(
    SelectFacilityType event,
    Emitter<DatabaseState> emit,
  ) {
    if (state is DatabaseReady) {
      emit(state.toReady(selectedType: event.type));
    }
  }

  void _onSelectFacility(SelectFacility event, Emitter<DatabaseState> emit) {
    if (state is DatabaseReady) {
      emit(
        state.toReady(
          selectedFacility: event.facility,
          selectedType: event.type,
        ),
      );
    }
  }
}
