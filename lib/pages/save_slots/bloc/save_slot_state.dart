import 'package:aic_planner/shared/model/save_slot.dart';

sealed class SaveSlotState {
  final List<SaveSlot> slots;
  final int selectedIndex;

  const SaveSlotState({required this.slots, required this.selectedIndex});

  SaveSlot? get selectedSlot =>
      (slots.isNotEmpty && selectedIndex >= 0 && selectedIndex < slots.length)
      ? slots[selectedIndex]
      : null;

  SaveSlotInitialState toInitial() =>
      SaveSlotInitialState(slots: slots, selectedIndex: selectedIndex);

  SaveSlotLoadingState toLoading() =>
      SaveSlotLoadingState(slots: slots, selectedIndex: selectedIndex);

  SaveSlotReadyState toReady({List<SaveSlot>? slots, int? selectedIndex}) =>
      SaveSlotReadyState(
        slots: slots ?? this.slots,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );

  SaveSlotErrorState toError(String errorMessage) => SaveSlotErrorState(
    errorMessage: errorMessage,
    slots: slots,
    selectedIndex: selectedIndex,
  );
}

class SaveSlotInitialState extends SaveSlotState {
  const SaveSlotInitialState({
    required super.slots,
    required super.selectedIndex,
  });
}

class SaveSlotLoadingState extends SaveSlotState {
  const SaveSlotLoadingState({
    required super.slots,
    required super.selectedIndex,
  });
}

class SaveSlotReadyState extends SaveSlotState {
  const SaveSlotReadyState({
    required super.slots,
    required super.selectedIndex,
  });
}

class SaveSlotErrorState extends SaveSlotState {
  final String errorMessage;
  const SaveSlotErrorState({
    required this.errorMessage,
    required super.slots,
    required super.selectedIndex,
  });
}
