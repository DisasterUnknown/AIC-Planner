enum GridItemType { none, factory, belt, machine }

class GridItem {
  final GridItemType type;
  final int row;
  final int col;

  GridItem({required this.row, required this.col, this.type = GridItemType.none});
}
