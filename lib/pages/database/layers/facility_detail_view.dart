import 'package:aic_planner/pages/database/bloc/database_bloc.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/pages/database/widget/facility_detail_view_painter.dart';
import 'package:aic_planner/pages/database/widget/import_img_box.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacilityDetailView extends StatelessWidget {
  const FacilityDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final facility = state.selectedFacility;

        if (facility == null) return const SizedBox();

        return Positioned(
          top: -2,
          left: 57,
          right: 137,
          bottom: -2,
          child: CustomPaint(
            painter: FacilityDetailPainter(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Fixed top header =====
                Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 60),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 14,
                            left: 8,
                            right: 8,
                            bottom: 0,
                          ),
                          child: Text(
                            facility.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        ImportImgBox(
                          lable: 'Top View',
                          facility: facility,
                          onTapCallback: () {},
                        ),
                        const SizedBox(width: 10),
                        ImportImgBox(
                          lable: 'Side View',
                          facility: facility,
                          onTapCallback: () {},
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),

                // ===== Scrollable content with fade =====
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(30, 0, 20, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            // ===== Image + Basic Info row =====
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image box (always present)
                                Container(
                                  width: (180 / facility.col) * facility.row,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white24,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[900],
                                  ),
                                  child: facility.topDownImgPath != null
                                      ? Image.asset(
                                          facility.topDownImgPath!,
                                          fit: BoxFit.contain,
                                        )
                                      : const Center(
                                          child: Text(
                                            '?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 16),

                                // Basic Info column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (facility.tier != null)
                                        Text(
                                          "Tier: ${facility.tier}",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      if (facility.power != null)
                                        Text(
                                          "Power: ${facility.power}",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      if (facility.atk != null)
                                        Text(
                                          "ATK: ${facility.atk}",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      if (facility.atkInterval != null)
                                        Text(
                                          "Interval: ${facility.atkInterval}",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      if (facility.skill != null)
                                        Text(
                                          "Skill: ${facility.skill}",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      const SizedBox(height: 12),
                                      Text(
                                        facility.description,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // ===== Recipes table =====
                            if (facility.recipes != null &&
                                facility.recipes!.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Recipes:",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...facility.recipes!.map(
                                    (recipe) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: Table(
                                        border: TableBorder.all(
                                          color: Colors.white24,
                                          width: 1,
                                        ),
                                        columnWidths: const {
                                          0: FlexColumnWidth(3), // Inputs
                                          1: FlexColumnWidth(1), // Time
                                          2: FlexColumnWidth(3), // Outputs
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              // Inputs column
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  4.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: recipe.input
                                                      .map(
                                                        (i) => Text(
                                                          "${i.inputAmount}x ${i.input.name}",
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ),

                                              // Processing time cell — vertically & horizontally centered
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    4.0,
                                                  ),
                                                  child: Text(
                                                    "${recipe.processingTime} ${recipe.processingTimeUnit}",
                                                    style: const TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 12,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),

                                              // Outputs column
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  4.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: recipe.output
                                                      .map(
                                                        (o) => Text(
                                                          "${o.outputAmount}x ${o.output.name}",
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),

                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // ===== Top fade =====
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppCustomColors.secondaryUI.withValues(
                                  alpha: 0.85,
                                ),
                                AppCustomColors.secondaryUI.withValues(
                                  alpha: 0.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
