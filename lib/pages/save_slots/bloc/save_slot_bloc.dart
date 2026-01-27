import 'package:flutter_bloc/flutter_bloc.dart';
import 'save_slot_event.dart';
import 'save_slot_state.dart';
import '../model/save_slot.dart';

class SaveSlotBloc extends Bloc<SaveSlotEvent, SaveSlotState> {
  SaveSlotBloc() : super(const SaveSlotState(slots: [])) {
    on<LoadSaveSlots>(_onLoad);
    on<SelectSaveSlot>(_onSelect);
  }

  void _onLoad(LoadSaveSlots event, Emitter<SaveSlotState> emit) {
    final slots = List.generate(
      5,
      (i) => SaveSlot(index: i),
    );

    emit(SaveSlotState(slots: slots));
  }

  void _onSelect(SelectSaveSlot event, Emitter<SaveSlotState> emit) {
    // later → navigate, load data, etc
  }
}
