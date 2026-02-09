import 'package:aic_planner/pages/save_slots/util/save_slot_share_compressor.dart';
import 'package:aic_planner/shared/data/config/config.dart';
import 'package:aic_planner/shared/service/shared_pref_service.dart';
import 'package:aic_planner/shared/storage/hive_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'save_slot_event.dart';
import 'save_slot_state.dart';

class SaveSlotBloc extends Bloc<SaveSlotEvent, SaveSlotState> {
  SaveSlotBloc()
    : super(const SaveSlotInitialState(slots: [], selectedIndex: -1)) {
    on<InitSaveSlots>(_onInit);
    on<SelectSaveSlot>(_onSelect);
    on<LoadSaveSlot>(_onLoad);
    on<ShareSaveSlot>(_onShare);
    on<DeleteSaveSlot>(_onDelete);
  }

  void _onInit(InitSaveSlots event, Emitter<SaveSlotState> emit) {
    final slots = PlannerSaveStorage.getAllSaveSlotsTyped();
    emit(SaveSlotReadyState(slots: slots, selectedIndex: -1));
  }

  void _onSelect(SelectSaveSlot event, Emitter<SaveSlotState> emit) {
    final currentState = state;

    if (currentState.slots.isEmpty) return;

    final index = event.index;

    if (index < 0 || index >= currentState.slots.length) return;

    emit(currentState.toSelected(index));
  }

  void _onLoad(LoadSaveSlot event, Emitter<SaveSlotState> emit) async {
    final loadSaveSlotId = state.selectedSlot!.id;
    await LocalSharedPreferences.setString(
      AppConfig.sharedPrefSaveSlotKey,
      loadSaveSlotId,
    );
    emit(state.toLoad(state.selectedIndex));
  }

  void _onShare(ShareSaveSlot event, Emitter<SaveSlotState> emit) async {
    final id = state.selectedSlot!.id;
    final rawData = await PlannerSaveStorage.getById(id);

    String tinyString = '';
    if (rawData.isNotEmpty) {
      tinyString = SaveSlotCompressor.compress(rawData);
    }

    emit(state.toShare(tinyString));
  }

  void _onDelete(DeleteSaveSlot event, Emitter<SaveSlotState> emit) async {
    final id = state.selectedSlot!.id;
    await PlannerSaveStorage.deleteSlot(id);
    emit(state.toDelete());
  }
}
