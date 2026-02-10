sealed class DatabaseEvent {}

class InitializeDatabase extends DatabaseEvent {}

class LoadDatabaseRecord extends DatabaseEvent {}

class SelectDatabaseRecord extends DatabaseEvent {
  final int index;

  SelectDatabaseRecord(this.index);
}
