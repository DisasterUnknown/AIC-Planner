import 'package:aic_planner/pages/database/bloc/database_event.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/pages/database/service/image_picking_service.dart';
import 'package:aic_planner/shared/data/config/config.dart';
import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:aic_planner/shared/storage/hive_image_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(const DatabaseInitial()) {
    on<InitializeDatabase>(_onInitialize);
    on<LoadDatabaseRecord>(_onLoadRecord);
    on<SelectFacilityType>(_onSelectFacilityType);
    on<SelectFacility>(_onSelectFacility);
    on<ImportFacilityImage>(_onImportFacilityImage);
  }

  void _onInitialize(InitializeDatabase event, Emitter<DatabaseState> emit) {
    final filtered = AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == FacilityType.power)
        .toList();

    emit(
      state.toReady(
        selectedType: FacilityType.power,
        selectedFacility: filtered.first,
      ),
    );
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
      emit(
        state.toReady(
          selectedFacility: event.facility,
          selectedType: event.type,
        ),
      );
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

  void _onImportFacilityImage(
    ImportFacilityImage event,
    Emitter<DatabaseState> emit,
  ) async {
    // Decide aspect ratio based on slot
    final facilityDefinitionData = AllFacilitiesList.allFacilities.firstWhere(
      (f) => f.id == event.facilityId,
    );

    final bytes = await ImageService.pickAndCropImage(
      ratioX: facilityDefinitionData.row.toDouble(),
      ratioY: facilityDefinitionData.col.toDouble(),
    );

    if (bytes == null) return;

    if (event.slotKey == AppConfig.hiveTopImageSlotKey) {
      await ImageStorage.saveTopImage(event.facilityId, bytes);
    } else {
      await ImageStorage.saveSideImage(event.facilityId, bytes);
    }

    emit(
      state.toReady(selectedFacility: event.facility, selectedType: event.type),
    );
  }
}
