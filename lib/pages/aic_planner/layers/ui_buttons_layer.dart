import 'package:aic_planner/pages/aic_planner/model/facility_instance.dart';
import 'package:aic_planner/shared/data/constants.dart';
import 'package:aic_planner/shared/data/registry/facility_registry/facility_registry.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';

class UIButtonsLayer extends StatelessWidget {
  final void Function(FacilityInstance) onAddFactory;

  const UIButtonsLayer({super.key, required this.onAddFactory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cornerBackBtn(context),

        // Top save and infor btn area
        Positioned(
          top: -1,
          right: -1,
          child: Column(
            children: [
              Container(
                height: 40,
                width: 165,
                decoration: BoxDecoration(
                  color: AppCustomColors.secondaryUI.withValues(alpha: 0.7),
                  border: Border.all(color: Colors.white54, width: 2),
                ),
                child: Center(child: Text('v1.0.0')),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: AppCustomColors.secondaryUI.withValues(
                          alpha: 0.7,
                        ),
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                      child: Center(
                        child: Icon(Icons.save, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: AppCustomColors.secondaryUI.withValues(
                          alpha: 0.7,
                        ),
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                      child: Center(
                        child: Icon(Icons.account_tree, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: AppCustomColors.secondaryUI.withValues(
                          alpha: 0.7,
                        ),
                        border: Border.all(color: Colors.white54, width: 2),
                      ),
                      child: Center(
                        child: Icon(Icons.info, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              onAddFactory(
                FacilityInstance(
                  def: FacilityRegistry.kPackagingUnit,
                  position: const Offset(0, 0),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
