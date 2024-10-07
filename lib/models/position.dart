class Position {
  int x;
  int y;

  int get xPlusy => x + y;

  bool isEqualPosition(Position anotherPosition) =>
      anotherPosition.x == x && anotherPosition.y == y;

  bool isEqual(int x, int y) => x == this.x && y == this.y;

  bool get isOutsideTheBoard => x < 0 || x > 7 || y < 0 || y > 7;

  static Position? fromOffset(Position position, int xOffset, int yOffset) {
    Position newPosition =
        Position(x: position.x + xOffset, y: position.y + yOffset);

    if (newPosition.isOutsideTheBoard) {
      return null;
    }

    return newPosition;
  }

  factory Position.copy(Position anotherPosition) =>
      Position(x: anotherPosition.x, y: anotherPosition.y);

  Position({
    required this.x,
    required this.y,
  });
}