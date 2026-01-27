abstract class SaveSlotEvent {}

class LoadSaveSlots extends SaveSlotEvent {}

class SelectSaveSlot extends SaveSlotEvent {
  final int index;
  SelectSaveSlot(this.index);
}
