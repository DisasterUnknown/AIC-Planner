import 'package:aci_planner/pages/aci_planner/model/grid_item.dart';
import 'package:flutter/material.dart';

class AciPlannerPage extends StatefulWidget {
  const AciPlannerPage({super.key});

  @override
  State<AciPlannerPage> createState() => _AciPlannerPageState();
}

class _AciPlannerPageState extends State<AciPlannerPage> {
  static const int rows = 10;
  static const int cols = 12;

  // Initialize empty grid
  List<List<GridItemType>> grid = List.generate(
      rows, (_) => List.generate(cols, (_) => GridItemType.none));

  GridItemType selectedItem = GridItemType.factory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          SizedBox.expand(
            child: Image.asset(
              'assets/aci_home_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.55)),

          // Grid
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(rows, (r) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(cols, (c) {
                    final item = grid[r][c];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          grid[r][c] = selectedItem;
                        });
                      },
                      onPanUpdate: (details) {
                        // Calculate grid coordinates from touch position
                        RenderBox box = context.findRenderObject() as RenderBox;
                        final localPos = box.globalToLocal(details.globalPosition);

                        final cellWidth = box.size.width / cols;
                        final cellHeight = box.size.height / rows;

                        final newCol = (localPos.dx / cellWidth).floor().clamp(0, cols - 1);
                        final newRow = (localPos.dy / cellHeight).floor().clamp(0, rows - 1);

                        setState(() {
                          grid[newRow][newCol] = selectedItem;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: getItemColor(item),
                          border: Border.all(color: Colors.white24),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Color getItemColor(GridItemType type) {
    switch (type) {
      case GridItemType.factory:
        return Colors.tealAccent.shade700;
      case GridItemType.belt:
        return Colors.orangeAccent.shade700;
      case GridItemType.machine:
        return Colors.purpleAccent.shade700;
      case GridItemType.none:
      default:
        return Colors.transparent;
    }
  }
}
