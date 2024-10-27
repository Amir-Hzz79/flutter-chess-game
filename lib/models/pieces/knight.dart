import 'package:flutter_chess_game/models/highlight_piece.dart';

import '../../enums/highlight_types.dart';
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
  Knight copy() {
    return Knight(
      id: id,
      isWhite: isWhite,
      position: position.copy(),
    );
  }

  @override
  avaiablePieces(Board board) {
    List<HighlightPiece> avaiablePositions = [];

    Position? position1 = Position.fromOffset(position, 1, 2);
    if (position1 != null &&
        (board.at(position1).isEmptyPiece ||
            board.at(position1).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position1),
          highlightType: board.at(position1).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position2 = Position.fromOffset(position, 1, -2);
    if (position2 != null &&
        (board.at(position2).isEmptyPiece ||
            board.at(position2).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position2),
          highlightType: board.at(position2).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position3 = Position.fromOffset(position, 2, 1);
    if (position3 != null &&
        (board.at(position3).isEmptyPiece ||
            board.at(position3).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position3),
          highlightType: board.at(position3).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position4 = Position.fromOffset(position, 2, -1);
    if (position4 != null &&
        (board.at(position4).isEmptyPiece ||
            board.at(position4).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position4),
          highlightType: board.at(position4).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position5 = Position.fromOffset(position, -1, 2);
    if (position5 != null &&
        (board.at(position5).isEmptyPiece ||
            board.at(position5).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position5),
          highlightType: board.at(position5).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position6 = Position.fromOffset(position, -1, -2);
    if (position6 != null &&
        (board.at(position6).isEmptyPiece ||
            board.at(position6).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position6),
          highlightType: board.at(position6).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position7 = Position.fromOffset(position, -2, 1);
    if (position7 != null &&
        (board.at(position7).isEmptyPiece ||
            board.at(position7).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position7),
          highlightType: board.at(position7).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    Position? position8 = Position.fromOffset(position, -2, -1);
    if (position8 != null &&
        (board.at(position8).isEmptyPiece ||
            board.at(position8).canAttackBy(this))) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position8),
          highlightType: board.at(position8).isEmptyPiece
              ? HighlightTypes.movable
              : HighlightTypes.attackable,
        ),
      );
    }

    return avaiablePositions + super.avaiablePieces(board);
  }
}
