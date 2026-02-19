import 'package:aic_planner/pages/database/bloc/database_bloc.dart';
import 'package:aic_planner/pages/database/bloc/database_event.dart';
import 'package:aic_planner/pages/database/bloc/database_state.dart';
import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidePannel extends StatelessWidget {
  const SidePannel({super.key});

  IconData _iconForFacilityType(FacilityType type) {
    switch (type) {
      case FacilityType.combat:
        return Icons.shield; 
      case FacilityType.exploration:
        return Icons.travel_explore;
      case FacilityType.logistics:
        return Icons.inventory_2;
      case FacilityType.power:
        return Icons.electric_bolt;
      case FacilityType.productionI:
        return Icons.factory;
      case FacilityType.productionII:
        return Icons.precision_manufacturing;
      case FacilityType.resourcing:
        return Icons.engineering;
      case FacilityType.deportAccess:
        return Icons.door_front_door;
      case FacilityType.transport:
        return Icons.alt_route;
      case FacilityType.miscellaneous:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final facilityTypes = FacilityType.values;

    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final selectedType = state.selectedType;
        final selectedFacility = state.selectedFacility;

        final filteredFacilities = AllFacilitiesList.allFacilities
            .where((f) => f.facilityType == selectedType)
            .toList();

        return Stack(
          children: [
            // Facility types column
            Positioned(
              top: 50,
              left: -2,
              bottom: -2,
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  color: AppCustomColors.secondaryUI.withValues(alpha: 0.92),
                  border: Border.all(color: Colors.white38, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 8,
                      offset: const Offset(2, 0),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: facilityTypes.map((type) {
                      final isSelected = selectedType == type;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: GestureDetector(
                          onTap: () => context.read<DatabaseBloc>().add(
                            SelectFacilityType(selectedFacility!, type),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange.withValues(alpha: 0.15)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.orange
                                    : Colors.white24,
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              _iconForFacilityType(type),
                              size: 20,
                              color: isSelected ? Colors.orange : Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Filtered facilities
            if (filteredFacilities.isNotEmpty)
              Positioned(
                top: -2,
                right: -2,
                bottom: -2,
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: AppCustomColors.secondaryUI.withValues(alpha: 0.92),
                    border: Border.all(color: Colors.white38, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: filteredFacilities.map((facility) {
                            final isSelected = selectedFacility == facility;
                            return GestureDetector(
                              onTap: () => context.read<DatabaseBloc>().add(
                                SelectFacility(facility, facility.facilityType),
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: AppCustomColors.secondaryUI.withValues(
                                    alpha: 0.9,
                                  ),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.orange
                                        : Colors.white54,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: facility.baseImgPath != null
                                      ? Image.asset(
                                          facility.baseImgPath!,
                                          fit: BoxFit.contain,
                                        )
                                      : Icon(
                                          Icons.help_outline,
                                          color: isSelected
                                              ? Colors.orange
                                              : Colors.white,
                                          size: 24,
                                        ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
