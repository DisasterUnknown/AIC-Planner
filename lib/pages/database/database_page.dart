import 'package:aic_planner/pages/database/bloc/database_bloc.dart';
import 'package:aic_planner/pages/database/bloc/database_event.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/pages/database/widget/facility_detail_view.dart';
import 'package:aic_planner/pages/database/widget/side_pannel.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabasePage extends StatelessWidget {
  const DatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DatabaseBloc()..add(InitializeDatabase()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppCustomColors.background,
            body: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    'assets/aci_home_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // dark overlay
                Container(color: Colors.black.withValues(alpha: 0.55)),

                // corner back button
                cornerBackBtn(context),

                Center(
                  child: BlocConsumer<DatabaseBloc, DatabaseState>(
                    listener: (context, state) async {},
                    builder: (context, state) {
                      if (state is DatabaseLoading) {
                        return const CircularProgressIndicator();
                      }

                      return Stack(
                        children: [
                          SidePannel(),
                          FacilityDetailView(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
