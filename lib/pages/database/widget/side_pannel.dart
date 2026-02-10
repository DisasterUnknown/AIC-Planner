import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';

class SidePannel extends StatefulWidget {
  final String version;

  const SidePannel({super.key, this.version = 'v1.0.0'});

  @override
  State<SidePannel> createState() => _SidePannelState();
}

class _SidePannelState extends State<SidePannel> {
  FacilityType? selectedType = FacilityType.processing;
  FacilityDefinition? selectedFacility;
  final List<FacilityType> facilityTypes = FacilityType.values;

  List<FacilityDefinition> get filteredFacilities {
    if (selectedType == null) return [];
    return AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == selectedType)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (filteredFacilities.isNotEmpty) {
      selectedFacility = filteredFacilities.first;
    }
  }

  void toggleType(FacilityType type) {
    setState(() {
      selectedType = type;
    });
  }

  void toggleFacility(FacilityDefinition facility) {
    setState(() {
      if (selectedFacility != facility) {
        selectedFacility = facility;
      }
    });
  }

  IconData _iconForFacilityType(FacilityType type) {
    switch (type) {
      case FacilityType.combat:
        return Icons.sports_mma;
      case FacilityType.exploration:
        return Icons.explore;
      case FacilityType.logistics:
        return Icons.local_shipping;
      case FacilityType.power:
        return Icons.bolt;
      case FacilityType.processing:
        return Icons.precision_manufacturing;
      case FacilityType.resourcing:
        return Icons.handyman;
      case FacilityType.xiranite:
        return Icons.circle;
      case FacilityType.hero:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ─────────── Facility type side panel ───────────
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
                children: [
                  ...facilityTypes.map((type) {
                    final isSelected = selectedType == type;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: GestureDetector(
                        onTap: () => toggleType(type),
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
                  }),

                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),

        // ─────────── Filtered facilities (RTL scroll, max 10 visible) ───────────
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
                          onTap: () => toggleFacility(facility),
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
  }
}
