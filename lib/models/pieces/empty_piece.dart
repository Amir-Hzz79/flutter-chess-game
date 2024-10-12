import 'piece.dart';

class EmptyPiece extends Piece {
  EmptyPiece({
    required super.position,
  });

  @override
  EmptyPiece copy() {
    return EmptyPiece(
      position: position.copy(),
    );
  }
}
