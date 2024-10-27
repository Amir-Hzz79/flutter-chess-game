import 'package:flutter_chess_game/enums/highlight_types.dart';

import 'pieces/piece.dart';

class HighlightPiece {
  final Piece piece;
  final HighlightTypes highlightType;

  bool get canMoveToIt =>
      highlightType != HighlightTypes.none &&
          highlightType == HighlightTypes.movable ||
      highlightType == HighlightTypes.attackable ||
      highlightType == HighlightTypes.castling;

  HighlightPiece copy() =>
      HighlightPiece(piece: piece.copy()!, highlightType: highlightType);

  const HighlightPiece({required this.piece, required this.highlightType});
}
