import 'package:flutter_chess_game/models/highlight_piece.dart';

import '../../enums/highlight_types.dart';
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
  avaiablePieces(Board board) {
    List<HighlightPiece> avaiablePositions = [];

    Position? position1 = Position.fromOffset(position, 0, isWhite! ? -1 : 1);
    if (position1 != null && board.at(position1).isEmptyPiece) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(position1),
          highlightType: HighlightTypes.movable,
        ),
      );

      Position? position2 = Position.fromOffset(position, 0, isWhite! ? -2 : 2);
      if (isFirstMove &&
          position2 != null &&
          board.at(position2).isEmptyPiece) {
        avaiablePositions.add(
          HighlightPiece(
            piece: board.at(position2),
            highlightType: HighlightTypes.movable,
          ),
        );
      }
    }

    Position? attackPosition1 =
        Position.fromOffset(position, 1, isWhite! ? -1 : 1);
    if (attackPosition1 != null &&
        board.at(attackPosition1).canAttackBy(this)) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(attackPosition1),
          highlightType: HighlightTypes.attackable,
        ),
      );
    }

    Position? attackPosition2 =
        Position.fromOffset(position, -1, isWhite! ? -1 : 1);
    if (attackPosition2 != null &&
        board.at(attackPosition2).canAttackBy(this)) {
      avaiablePositions.add(
        HighlightPiece(
          piece: board.at(attackPosition2),
          highlightType: HighlightTypes.attackable,
        ),
      );
    }

    return avaiablePositions + super.avaiablePieces(board);
  }

  @override
  onMove(Board board, HighlightPiece newPiece) {
    super.onMove(board, newPiece);

    isFirstMove = false;
  }
}
