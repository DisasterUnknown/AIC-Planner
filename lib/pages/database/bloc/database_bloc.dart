import 'dart:typed_data';

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

  void _onInitialize(
    InitializeDatabase event,
    Emitter<DatabaseState> emit,
  ) async {
    final filtered = AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == FacilityType.productionI)
        .toList();

    final sideImages = await _loadSideImagesFromFacilityType(
      FacilityType.productionI,
    );

    final topImages = await ImageStorage.getByKey(
      filtered.first.id,
      AppConfig.hiveTopImageSlotKey,
    );

    emit(
      state.toReady(
        selectedType: FacilityType.productionI,
        selectedFacility: filtered.first,
        sideImages: sideImages,
        topImages: topImages,
      ),
    );
  }

  Future<Map<String, Uint8List?>> _loadSideImagesFromFacilityType(
    FacilityType facilityType,
  ) async {
    final facilityList = AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == facilityType)
        .toList();

    final Map<String, Uint8List?> imageMap = {};
    final allowedIds = facilityList.map((f) => f.id.toString()).toList();

    for (final facilityId in allowedIds) {
      final bytes = await ImageStorage.getByKey(
        facilityId,
        AppConfig.hiveSideImageSlotKey,
      );

      if (bytes != null) {
        imageMap[facilityId] = bytes;
      }
    }

    return imageMap;
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
  ) async {
    if (state is DatabaseReady) {
      final sideImages = await _loadSideImagesFromFacilityType(event.type);

      emit(
        state.toReady(
          selectedFacility: event.facility,
          selectedType: event.type,
          topImages: state.topImages,
          sideImages: sideImages,
        ),
      );
    }
  }

  void _onSelectFacility(
    SelectFacility event,
    Emitter<DatabaseState> emit,
  ) async {
    if (state is DatabaseReady) {
      final topImages = await ImageStorage.getByKey(
        event.facility.id,
        AppConfig.hiveTopImageSlotKey,
      );

      emit(
        state.toReady(
          selectedFacility: event.facility,
          selectedType: event.type,
          topImages: topImages,
          sideImages: state.sideImages,
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

    var currentTopImages = state.topImages;
    final currentSideImages = state.sideImages ?? {};

    if (event.slotKey == AppConfig.hiveTopImageSlotKey) {
      currentTopImages = bytes;
    } else {
      currentSideImages[event.facilityId] = bytes;
    }

    emit(
      state.toReady(
        selectedFacility: event.facility,
        selectedType: event.type,
        topImages: currentTopImages,
        sideImages: currentSideImages,
      ),
    );
  }
}
