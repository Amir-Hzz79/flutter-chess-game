import '../board.dart';
import 'piece.dart';

class Rook extends Piece {
  Rook({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_rook.png',
          blackIcon: 'assets/icons/white_rook.png',
        );

  @override
  avaiablePositions(Board board) {
    List<Position> avaiablePositions = [];

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

  /* @override
  onMove(Position newPosition) {
    super.onMove(newPosition);

    isFirstMove = false;
  } */
}
