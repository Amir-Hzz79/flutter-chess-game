import '../board.dart';
import 'piece.dart';

class Rook extends Piece {
  const Rook({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_rook.png',
          blackIcon: 'assets/icons/white_rook.png',
        );

  @override
  Rook copy() {
    return Rook(
      id: id,
      isWhite: isWhite,
      position: position.copy(),
    );
  }

  @override
  avaiablePositions(Board board) {
    List<Position> avaiablePositions = [];

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, 0, i);

      if (newPosition == null) {
        break;
      }

      if (board.at(newPosition).isNotEmptyPiece) {
        if (board.at(newPosition).isNotInSameSide(this)) {
          avaiablePositions.add(newPosition);
        }
        break;
      }

      avaiablePositions.add(newPosition);
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, 0, -i);

      if (newPosition == null) {
        break;
      }

      if (board.at(newPosition).isNotEmptyPiece) {
        if (board.at(newPosition).isNotInSameSide(this)) {
          avaiablePositions.add(newPosition);
        }
        break;
      }

      avaiablePositions.add(newPosition);
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, i, 0);

      if (newPosition == null) {
        break;
      }

      if (board.at(newPosition).isNotEmptyPiece) {
        if (board.at(newPosition).isNotInSameSide(this)) {
          avaiablePositions.add(newPosition);
        }
        break;
      }

      avaiablePositions.add(newPosition);
    }

    for (var i = 1; i < 8; i++) {
      Position? newPosition = Position.fromOffset(position, -i, 0);

      if (newPosition == null) {
        break;
      }

      if (board.at(newPosition).isNotEmptyPiece) {
        if (board.at(newPosition).isNotInSameSide(this)) {
          avaiablePositions.add(newPosition);
        }
        break;
      }

      avaiablePositions.add(newPosition);
    }

    return avaiablePositions;
  }
}
