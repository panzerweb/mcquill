// These are the icons associated for every type of world
enum WorldIconEnums {
  pickaxe, // Survival Category
  skull, // Hardcode Category
  castle, // Creative Category
  bolt, // Redstone Category
}

enum TaskPriority {
  low,
  medium,
  high;

  @override
  String toString() => name.toUpperCase();
}

enum TaskStatus {
  todo,
  inProgress,
  completed,
  cancelled;

  @override
  String toString() => name.toUpperCase();
}
