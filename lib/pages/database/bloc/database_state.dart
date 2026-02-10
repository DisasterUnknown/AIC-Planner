import 'package:aic_planner/shared/model/save_slot.dart';

sealed class DatabaseState {
  final List<SaveSlot> records; // database records
  final int selectedIndex;

  const DatabaseState({required this.records, required this.selectedIndex});

  SaveSlot? get selectedRecord =>
      (records.isNotEmpty && selectedIndex >= 0 && selectedIndex < records.length)
          ? records[selectedIndex]
          : null;

  DatabaseInitial toInitial() =>
      DatabaseInitial(records: records, selectedIndex: selectedIndex);

  DatabaseLoading toLoading() =>
      DatabaseLoading(records: records, selectedIndex: selectedIndex);

  DatabaseReady toReady({List<SaveSlot>? records, int? selectedIndex}) =>
      DatabaseReady(
        records: records ?? this.records,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );

  DatabaseError toError(String errorMessage) => DatabaseError(
        errorMessage: errorMessage,
        records: records,
        selectedIndex: selectedIndex,
      );
}

class DatabaseInitial extends DatabaseState {
  const DatabaseInitial({required super.records, required super.selectedIndex});
}

class DatabaseLoading extends DatabaseState {
  const DatabaseLoading({required super.records, required super.selectedIndex});
}

class DatabaseReady extends DatabaseState {
  const DatabaseReady({required super.records, required super.selectedIndex});
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  const DatabaseError({
    required this.errorMessage,
    required super.records,
    required super.selectedIndex,
  });
}
