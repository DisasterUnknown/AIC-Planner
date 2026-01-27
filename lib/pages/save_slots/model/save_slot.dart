class SaveSlot {
  final int index;
  final bool isUsed;
  final String? title;
  final String? description;
  final DateTime? lastUpdated;

  const SaveSlot({
    required this.index,
    this.isUsed = false,
    this.title,
    this.description,
    this.lastUpdated,
  });
}
