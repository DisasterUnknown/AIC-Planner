import 'package:aic_planner/pages/database/bloc/database_bloc.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/pages/database/widget/facility_detail_view_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacilityDetailView extends StatelessWidget {
  const FacilityDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final facility = state.selectedFacility;

        if (facility == null) {
          return const SizedBox(); // Nothing selected
        }

        return Positioned(
          top: -2,
          left: 57,
          right: 137,
          bottom: -2,
          child: CustomPaint(
            painter: FacilityDetailPainter(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
