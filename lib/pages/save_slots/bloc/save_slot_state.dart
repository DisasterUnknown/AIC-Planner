import 'package:equatable/equatable.dart';
import '../model/save_slot.dart';

class SaveSlotState extends Equatable {
  final List<SaveSlot> slots;

  const SaveSlotState({required this.slots});

  @override
  List<Object?> get props => [slots];
}
