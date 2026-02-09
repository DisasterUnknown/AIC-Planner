import 'package:aic_planner/shared/storage/hive_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'save_slot_event.dart';
import 'save_slot_state.dart';

class SaveSlotBloc extends Bloc<SaveSlotEvent, SaveSlotState> {
  SaveSlotBloc()
    : super(const SaveSlotInitialState(slots: [], selectedIndex: -1)) {
    on<LoadSaveSlots>(_onLoad);
    on<SelectSaveSlot>(_onSelect);
  }

  void _onLoad(LoadSaveSlots event, Emitter<SaveSlotState> emit) {
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
}
