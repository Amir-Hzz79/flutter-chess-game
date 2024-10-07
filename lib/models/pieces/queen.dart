import '../board.dart';
import 'piece.dart';

class Queen extends Piece {
  Queen({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_queen.png',
          blackIcon: 'assets/icons/white_queen.png',
        );

  @override
  avaiablePositions(Board board) {
    List<Position> avaiablePositions = [];

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, i, i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, -i, -i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, i, -i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, -i, i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, 0, i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, 0, -i);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, i, 0);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, -i, 0);

      if (newPosition == null) {
        break;
      }

      avaiablePositions.add(newPosition);

      if (board.at(newPosition).isNotEmptyPiece) {
        break;
      }
    }

    return avaiablePositions;
  }
}
