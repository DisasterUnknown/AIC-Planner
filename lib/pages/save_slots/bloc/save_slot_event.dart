sealed class SaveSlotEvent {}

class InitSaveSlots extends SaveSlotEvent {}

class SelectSaveSlot extends SaveSlotEvent {
  final int index;
  SelectSaveSlot(this.index);
}

class LoadSaveSlot extends SaveSlotEvent {
  LoadSaveSlot();
}

class CreateSaveSlot extends SaveSlotEvent {
  final String title;
  CreateSaveSlot(this.title);
}

class ShareSaveSlot extends SaveSlotEvent {
  ShareSaveSlot();
}

class DeleteSaveSlot extends SaveSlotEvent {
  final int index;
  DeleteSaveSlot(this.index);
}

class ImportBlueprintSlots extends SaveSlotEvent {
  final String blueprint;
  ImportBlueprintSlots(this.blueprint);
}

class UpdateSaveSlot extends SaveSlotEvent {
  final int index;
  final String? title;
  final String? description;
  UpdateSaveSlot({required this.index, this.title, this.description});
}
