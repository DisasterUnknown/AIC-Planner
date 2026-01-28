import 'package:aic_planner/pages/aic_planner/model/grid_item.dart';

abstract class GridEvent {}
class AddItem extends GridEvent {
  final int row;
  final int col;
  final GridItemType type;

  AddItem({required this.row, required this.col, required this.type});
}
class MoveItem extends GridEvent {
  final int fromRow;
  final int fromCol;
  final int toRow;
  final int toCol;

  MoveItem({required this.fromRow, required this.fromCol, required this.toRow, required this.toCol});
}

class GridState {
  final List<GridItem> items;
  final int rows;
  final int cols;

  GridState({required this.items, this.rows = 10, this.cols = 10});
}
