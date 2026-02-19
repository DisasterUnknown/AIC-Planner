import 'package:aic_planner/pages/aic_planner/config/enums.dart';
import 'package:aic_planner/pages/aic_planner/controller/aic_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry_list.dart';
import 'package:flutter/material.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/data/enums/facility_type_enums.dart';
import 'package:aic_planner/shared/model/facility_model.dart';

class FacilitySelectionButtons extends StatefulWidget {
  final AciPlannerController controller;
  const FacilitySelectionButtons({super.key, required this.controller});

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
        widget.controller.startPlacing(null);
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

  void toggleDeleteMode() {
    widget.controller.isDeleteMode = !widget.controller.isDeleteMode;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ───────────────── Top info panel ─────────────────
        if (selectedFacility != null)
          Positioned(
            top: -2,
            right: MediaQuery.of(context).size.width / 2 - 150,
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: AppCustomColors.secondaryUI.withValues(alpha: 0.9),
                border: Border.all(color: Colors.white54, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    selectedFacility!.baseImgPath != null
                        ? Image.asset(
                            selectedFacility!.baseImgPath!,
                            width: 40,
                            height: 40,
                          )
                        : const Icon(
                            Icons.insert_drive_file_outlined,
                            color: Colors.white,
                            size: 24,
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
                      onPressed: () {},
                      icon: const Icon(Icons.help_outline, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // ─────────── Edit option buttons (DIAGONAL ONLY HERE) ───────────
        Positioned(
          bottom: 137,
          right: -2,
          child: CustomPaint(
            painter: _DiagonalLayeredBorderPainter(),
            child: ClipPath(
              clipper: _DiagonalTopLeftClipper(),
              child: Container(
                height: 50,
                width: 148,
                color: AppCustomColors.secondaryUI.withValues(alpha: 0.9),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        toggleDeleteMode();
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: widget.controller.isDeleteMode
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.controller.rotatePlacementDirection,
                      icon: Icon(
                        _iconForDirection(widget.controller.placementDirection),
                        size: 20,
                        color: Colors.white,
                      ),
                    ),

                    IconButton(
                      onPressed: widget.controller.confirmEditing,
                      icon: const Icon(
                        Icons.done,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ─────────── Facility type buttons ───────────
        Positioned(
          bottom: -2,
          right: -2,
          child: Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
              color: AppCustomColors.secondaryUI.withValues(alpha: 0.9),
              border: Border.all(color: Colors.white54, width: 2),
            ),
            padding: const EdgeInsets.all(4),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, top: 4, bottom: 30),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 7,
                  children: facilityTypes.map((type) {
                    final isSelected = selectedType == type;
                    return GestureDetector(
                      onTap: () => toggleType(type),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(color: Colors.orange, width: 2)
                              : null,
                        ),
                        child: Icon(
                          _iconForFacilityType(type),
                          size: 20,
                          color: isSelected ? Colors.orange : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),

        // ─────────── Filtered facilities (RTL scroll, max 10 visible) ───────────
        if (filteredFacilities.isNotEmpty)
          Positioned(
            bottom: -2,
            right: 147,
            child: SizedBox(
              height: 60,
              width: 60 * 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: filteredFacilities.map((facility) {
                    final isSelected = selectedFacility == facility;
                    return GestureDetector(
                      onTap: () {
                        toggleFacility(facility);

                        FacilityInstance? facInst;
                        if (selectedFacility != null && selectedType != null) {
                          facInst = FacilityInstance(
                            def: AllFacilitiesList.allFacilities.firstWhere(
                              (f) => f.id == selectedFacility!.id,
                            ),
                            position: const Offset(0, 0),
                          );
                        } else {
                          facInst = null;
                        }

                        widget.controller.startPlacing(facInst);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppCustomColors.secondaryUI.withValues(
                            alpha: 0.9,
                          ),
                          border: Border.all(
                            color: isSelected ? Colors.orange : Colors.white54,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: facility.baseImgPath != null
                              ? Image.asset(facility.baseImgPath!)
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
              ),
            ),
          ),
      ],
    );
  }

  IconData _iconForDirection(PlacementDirection dir) {
    switch (dir) {
      case PlacementDirection.up:
        return Icons.arrow_upward;
      case PlacementDirection.right:
        return Icons.arrow_forward;
      case PlacementDirection.down:
        return Icons.arrow_downward;
      case PlacementDirection.left:
        return Icons.arrow_back;
    }
  }

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
}

/// ─────────── Diagonal helpers (USED ONLY ON EDIT BAR) ───────────

class _DiagonalTopLeftClipper extends CustomClipper<Path> {
  static const double cut = 16;

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, cut)
      ..close();
  }

  @override
  bool shouldReclip(_) => false;
}

class _DiagonalLayeredBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = _DiagonalTopLeftClipper.cut;

    // Inner darker border
    final innerBorderPaint = Paint()
      ..color = const Color.fromARGB(255, 15, 15, 15)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Outer white border
    final outerBorderPaint = Paint()
      ..color = const Color.fromARGB(137, 216, 210, 210)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, cut)
      ..close();

    canvas.drawPath(path, innerBorderPaint);
    canvas.drawPath(path, outerBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
