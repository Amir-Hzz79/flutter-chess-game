import '../board.dart';
import 'piece.dart';

class Pawn extends Piece {
  bool isFirstMove = true;

  Pawn({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_pawn.png',
          blackIcon: 'assets/icons/white_pawn.png',
        );

  @override
  Pawn copy() {
    return Pawn(
      id: id,
      isWhite: isWhite,
      position: position.copy(),
    );
  }

  @override
  avaiablePositions(Board board) {
    List<Position> avaiablePositions = [];

    Position? position1 = Position.fromOffset(position, 0, isWhite! ? -1 : 1);
    if (position1 != null && board.at(position1).isEmptyPiece) {
      avaiablePositions.add(position1);

      Position? position2 = Position.fromOffset(position, 0, isWhite! ? -2 : 2);
      if (isFirstMove &&
          position2 != null &&
          board.at(position2).isEmptyPiece) {
        avaiablePositions.add(position2);
      }
    }

    Position? attackPosition1 =
        Position.fromOffset(position, 1, isWhite! ? -1 : 1);
    if (attackPosition1 != null &&
        board.at(attackPosition1).canAttackBy(this)) {
      avaiablePositions.add(attackPosition1);
    }

    Position? attackPosition2 =
        Position.fromOffset(position, -1, isWhite! ? -1 : 1);
    if (attackPosition2 != null &&
        board.at(attackPosition2).canAttackBy(this)) {
      avaiablePositions.add(attackPosition2);
    }

    return avaiablePositions;
  }

  @override
  onMove(Position newPosition) {
    super.onMove(newPosition);

    isFirstMove = false;
  }
}
