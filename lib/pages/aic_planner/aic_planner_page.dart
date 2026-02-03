import 'package:aic_planner/pages/aic_planner/controller/aci_planner_controller.dart';
import 'package:aic_planner/pages/aic_planner/layers/background_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/editing_factory_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/grid_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/placed_facilities_layer.dart';
import 'package:aic_planner/pages/aic_planner/layers/ui_buttons_layer.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class AciPlannerPage extends StatefulWidget {
  const AciPlannerPage({super.key});

  @override
  State<AciPlannerPage> createState() => _AciPlannerPageState();
}

class _AciPlannerPageState extends State<AciPlannerPage> {
  late final AciPlannerController controller;
  final TransformationController viewController = TransformationController();

  @override
  void initState() {
    super.initState();
    controller = AciPlannerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      viewController.value = Matrix4.identity()
        ..translateByVector3(
          Vector3((size.width - 2000) / 2, (size.height - 1000) / 2, 0),
        );
    });
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Stack(
            children: [
              GestureDetector(
                onTapDown: (details) {
                  controller.placeFactoryAt(
                    viewController.toScene(details.localPosition),
                  );
                },
                child: InteractiveViewer(
                  transformationController: viewController,
                  constrained: false,
                  minScale: 0.5,
                  maxScale: 2.5,
                  child: SizedBox(
                    width: 3000,
                    height: 3000,
                    child: GestureDetector(
                      child: Stack(
                        children: [
                          const BackgroundLayer(),
                          const GridLayer(),
                          PlacedFacilitiesLayer(facilities: controller.facilities),
                          EditingFactoryLayer(
                            editingFactories: controller.editingFactories,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              UIButtonsLayer(
                onAddFactory: controller.startPlacing,
                onCancelShow: controller.showCancelBtn,
                onCancel: controller.cancelEditing,
                onConfirm: controller.confirmEditing,
              ),
            ],
          );
        },
      ),
    );
  }
}
