import 'package:aic_planner/pages/database/bloc/database_event.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/shared/data/config/config.dart';
import 'package:aic_planner/shared/service/shared_pref_service.dart';
import 'package:aic_planner/shared/storage/hive_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(const DatabaseInitial(records: [], selectedIndex: -1)) {
    on<InitializeDatabase>(_onInitialize);
    on<SelectDatabaseRecord>(_onSelectRecord);
    on<LoadDatabaseRecord>(_onLoadRecord);
  }

  void _onInitialize(InitializeDatabase event, Emitter<DatabaseState> emit) {
    final records = PlannerSaveStorage.getAllBlueprints();
    emit(DatabaseReady(records: records, selectedIndex: -1));
  }

  void _onSelectRecord(SelectDatabaseRecord event, Emitter<DatabaseState> emit) {
    emit(state.toReady(selectedIndex: event.index));
  }

  Future<void> _onLoadRecord(LoadDatabaseRecord event, Emitter<DatabaseState> emit) async {
    final selected = state.selectedRecord;
    if (selected == null) {
      emit(state.toError('No database record selected'));
      return;
    }

    await LocalSharedPreferences.setString(
      AppConfig.sharedPrefSaveSlotKey,
      selected.id,
    );

    emit(state.toLoading());
  }
}
