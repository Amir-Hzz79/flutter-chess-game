import '../board.dart';
import 'piece.dart';

class Knight extends Piece {
  Knight({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_knight.png',
          blackIcon: 'assets/icons/white_knight.png',
        );

  @override
  avaiablePositions(Board board) {
    List<Position> avaiablePositions = [];

    Position? position1 = Position.fromOffset(position, 1, 2);
    if (position1 != null &&
        (board.at(position1).isEmptyPiece ||
            board.at(position1).canAttackBy(this))) {
      avaiablePositions.add(position1);
    }

    Position? position2 = Position.fromOffset(position, 1, -2);
    if (position2 != null &&
        (board.at(position2).isEmptyPiece ||
            board.at(position2).canAttackBy(this))) {
      avaiablePositions.add(position2);
    }

    Position? position3 = Position.fromOffset(position, 2, 1);
    if (position3 != null &&
        (board.at(position3).isEmptyPiece ||
            board.at(position3).canAttackBy(this))) {
      avaiablePositions.add(position3);
    }

    Position? position4 = Position.fromOffset(position, 2, -1);
    if (position4 != null &&
        (board.at(position4).isEmptyPiece ||
            board.at(position4).canAttackBy(this))) {
      avaiablePositions.add(position4);
    }

    Position? position5 = Position.fromOffset(position, -1, 2);
    if (position5 != null &&
        (board.at(position5).isEmptyPiece ||
            board.at(position5).canAttackBy(this))) {
      avaiablePositions.add(position5);
    }

    Position? position6 = Position.fromOffset(position, -1, -2);
    if (position6 != null &&
        (board.at(position6).isEmptyPiece ||
            board.at(position6).canAttackBy(this))) {
      avaiablePositions.add(position6);
    }

    Position? position7 = Position.fromOffset(position, -2, 1);
    if (position7 != null &&
        (board.at(position7).isEmptyPiece ||
            board.at(position7).canAttackBy(this))) {
      avaiablePositions.add(position7);
    }

    Position? position8 = Position.fromOffset(position, -2, -1);
    if (position8 != null &&
        (board.at(position8).isEmptyPiece ||
            board.at(position8).canAttackBy(this))) {
      avaiablePositions.add(position8);
    }

    return avaiablePositions;
  }
}
