import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

class FacilitySelectionButtons extends StatefulWidget {
  const FacilitySelectionButtons({super.key});

  @override
  State<FacilitySelectionButtons> createState() =>
      _FacilitySelectionButtonsState();
}

class _FacilitySelectionButtonsState extends State<FacilitySelectionButtons> {
  FacilityType? selectedType;
  FacilityDefinition? selectedFacility;

  final List<FacilityType> facilityTypes = FacilityType.values;

  List<FacilityDefinition> get filteredFacilities {
    if (selectedType == null) return [];
    return AllFacilitiesList.allFacilities
        .where((f) => f.facilityType == selectedType)
        .toList();
  }

  void toggleType(FacilityType type) {
    setState(() {
      if (selectedType == type) {
        selectedType = null;
        selectedFacility = null;
      } else {
        selectedType = type;
        selectedFacility = null;
      }
    });
  }

  void toggleFacility(FacilityDefinition facility) {
    setState(() {
      if (selectedFacility == facility) {
        selectedFacility = null;
      } else {
        selectedFacility = facility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top info area (if facility selected)
        if (selectedFacility != null)
          Positioned(
            top: -50,
            right: 0,
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: AppCustomColors.secondaryUI.withValues(alpha: 0.7),
                border: Border.all(color: Colors.white54, width: 2),
              ),
              child: Row(
                children: [
                  selectedFacility!.baseImgPath != null
                      ? Image.asset(
                          selectedFacility!.baseImgPath!,
                          width: 40,
                          height: 40,
                        )
                      : const Center(
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      selectedFacility!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // your ? button callback
                    },
                    icon: const Icon(Icons.help_outline, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

        // Facility type buttons bottom-right
        Positioned(
          bottom: -2,
          right: -2,
          child: Container(
            height: 120,
            width: 140,
            decoration: BoxDecoration(
              color: AppCustomColors.secondaryUI.withValues(alpha: 0.8),
              border: Border.all(color: Colors.white54, width: 2),
            ),
            padding: const EdgeInsets.all(4),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, top: 4),
              child: Wrap(
                spacing: 7, // horizontal spacing between buttons
                runSpacing: 7, // vertical spacing between lines
                children: List.generate(facilityTypes.length, (index) {
                  final type = facilityTypes[index];
                  return GestureDetector(
                    onTap: () => toggleType(type),
                    child: Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                        color: selectedType == type
                            ? Colors.greenAccent.withOpacity(0.7) : null,
                        border: selectedType == type ? Border.all(color: Colors.white54, width: 2) : null,
                      ),
                      child: Center(
                        child: Icon(
                          _iconForFacilityType(type),
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        // Horizontal scrollable filtered facilities
        if (filteredFacilities.isNotEmpty)
          Positioned(
            bottom: -2,
            right: 136,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filteredFacilities.map((facility) {
                  final isSelected = selectedFacility == facility;
                  return GestureDetector(
                    onTap: () => toggleFacility(facility),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.greenAccent.withOpacity(0.7)
                            : AppCustomColors.secondaryUI.withValues(
                                alpha: 0.8,
                              ),
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                      child: Center(
                        child: facility.baseImgPath != null
                            ? Image.asset(facility.baseImgPath!)
                            : const Icon(
                                Icons.help_outline,
                                color: Colors.white,
                                size: 24,
                              ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
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
      default:
        return Icons.help_outline;
    }
  }
}
