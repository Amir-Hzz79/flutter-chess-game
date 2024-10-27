import 'package:flutter_chess_game/enums/highlight_types.dart';
import 'package:flutter_chess_game/models/highlight_piece.dart';

import '../board.dart';
import 'piece.dart';

class King extends Piece {
  bool isFirstMove = true;

  King({
    required super.id,
    required super.isWhite,
    required super.position,
  }) : super(
          whiteIcon: 'assets/icons/black_king.png',
          blackIcon: 'assets/icons/white_king.png',
        );

  @override
  King copy() {
    return King(
      id: id,
      isWhite: isWhite,
      position: position.copy(),
    );
  }

  @override
  avaiablePieces(Board board) {
    List<HighlightPiece> avaiablePositions = [];

    Position? position1 = Position.fromOffset(position, 0, 1);
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

    Position? position2 = Position.fromOffset(position, 1, 1);
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

    Position? position3 = Position.fromOffset(position, 1, 0);
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

    Position? position4 = Position.fromOffset(position, 1, -1);
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

    Position? position5 = Position.fromOffset(position, 0, -1);
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

    Position? position6 = Position.fromOffset(position, -1, -1);
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

    Position? position7 = Position.fromOffset(position, -1, 0);
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

    Position? position8 = Position.fromOffset(position, -1, 1);
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

    if (isFirstMove) {
      Position? leftPosition1 = Position.fromOffset(position, -1, 0);
      Position? leftPosition2 = Position.fromOffset(position, -2, 0);
      bool leftEmptySpace = leftPosition1 != null &&
          leftPosition2 != null &&
          board.isEmptyPiece(leftPosition1) &&
          board.isEmptyPiece(leftPosition2);

      if (leftEmptySpace) {
        avaiablePositions.add(
          HighlightPiece(
            piece: board.at(leftPosition2),
            highlightType: HighlightTypes.castling,
          ),
        );
      }

      Position? rightPosition1 = Position.fromOffset(position, 1, 0);
      Position? rightPosition2 = Position.fromOffset(position, 2, 0);
      Position? rightPosition3 = Position.fromOffset(position, 3, 0);
      bool rightEmptySpace = rightPosition1 != null &&
          rightPosition2 != null &&
          rightPosition3 != null &&
          board.isEmptyPiece(rightPosition1) &&
          board.isEmptyPiece(rightPosition2) &&
          board.isEmptyPiece(rightPosition3);

      if (rightEmptySpace) {
        avaiablePositions.add(
          HighlightPiece(
            piece: board.at(rightPosition2),
            highlightType: HighlightTypes.castling,
          ),
        );
      }
    }

    return avaiablePositions + super.avaiablePieces(board);
  }

  @override
  onMove(Board board, HighlightPiece newPiece) {
    super.onMove(board, newPiece);

    if (newPiece.highlightType == HighlightTypes.castling) {
      board.move(
        board.at(
          Position(
            x: newPiece.piece.position.x == 1 ? 0 : 7,
            y: isWhite! ? 7 : 0,
          ),
        ),
        HighlightPiece(
          piece: board.at(
            Position(
              x: newPiece.piece.position.x == 1 ? 2 : 4,
              y: isWhite! ? 7 : 0,
            ),
          ),
          highlightType: HighlightTypes.movable,
        ),
      );
    }

    isFirstMove = false;
  }
}
