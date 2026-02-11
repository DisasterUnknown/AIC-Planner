import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:flutter/material.dart';

class FacilityDetailView extends StatelessWidget {
  final FacilityDefinition? facility;

  const FacilityDetailView({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    if (facility == null) {
      return const SizedBox(); // Nothing selected
    }

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppCustomColors.secondaryUI.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white30, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Facility Name
              Text(
                facility!.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 12),

              // Top-down + regular images side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top-down view
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24, width: 2),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[900],
                    ),
                    child: facility!.topDownImgPath != null
                        ? Image.asset(facility!.topDownImgPath!, fit: BoxFit.contain)
                        : const Center(
                            child: Icon(Icons.image, color: Colors.white38, size: 32),
                          ),
                  ),
                  const SizedBox(width: 16),

                  // Regular view
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24, width: 2),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[900],
                    ),
                    child: facility!.baseImgPath != null
                        ? Image.asset(facility!.baseImgPath!, fit: BoxFit.contain)
                        : const Center(
                            child: Icon(Icons.image, color: Colors.white38, size: 32),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Facility details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _detailBlock("Power", facility!.power.toString()),
                  _detailBlock("Tier", facility!.tier),
                  if (facility!.atk != null) _detailBlock("ATK", facility!.atk.toString()),
                  if (facility!.atkInterval != null)
                    _detailBlock("Interval", facility!.atkInterval!),
                ],
              ),
              const SizedBox(height: 16),

              // Skill
              if (facility!.skill != null)
                Text(
                  "Skill: ${facility!.skill}",
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),

              const SizedBox(height: 12),

              // Description
              Text(
                facility!.description,
                style: const TextStyle(fontSize: 14, color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailBlock(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
