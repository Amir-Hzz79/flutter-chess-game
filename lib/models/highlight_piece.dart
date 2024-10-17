import 'package:flutter_chess_game/enums/highlight_types.dart';

import 'pieces/piece.dart';

class HighlightPiece {
  final Piece piece;
  final HighlightTypes highlightType;

  bool get canMoveToIt =>
      highlightType == HighlightTypes.movable ||
      highlightType == HighlightTypes.attackable;

  const HighlightPiece({required this.piece, required this.highlightType});
}
