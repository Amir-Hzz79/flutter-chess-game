import '../board.dart';
import 'piece.dart';

export 'bishop.dart';
export 'pawn.dart';
export 'rook.dart';
export 'knight.dart';
export 'king.dart';
export 'queen.dart';
export '../position.dart';
export 'empty_piece.dart';

abstract class Piece {
  final String id;
  final String? title;
  final bool? isWhite;
  final Position position;
  final String? whiteIcon;
  final String? blackIcon;

  String? get icon => isWhite == null
      ? null
      : isWhite!
          ? blackIcon
          : whiteIcon;

  const Piece({
    this.id = '',
    this.title,
    this.isWhite,
    this.whiteIcon,
    this.blackIcon,
    required this.position,
  });

  bool get isNotEmptyPiece =>
      this is Rook ||
      this is Knight ||
      this is Bishop ||
      this is King ||
      this is Queen ||
      this is Pawn;

  bool get isEmptyPiece => !(this is Rook ||
      this is Knight ||
      this is Bishop ||
      this is King ||
      this is Queen ||
      this is Pawn);

  List<Position> avaiablePositions(Board board) {
    return [];
  }

  Piece? copy() {
    return null;
  }

  bool isEqual(Piece anotherPiece) =>
      position.isEqualPosition(anotherPiece.position);

  bool isInSameSide(Piece anotherPiece) => isWhite == anotherPiece.isWhite;

  bool isNotInSameSide(Piece anotherPiece) => isWhite != anotherPiece.isWhite;

  bool canAttackBy(Piece anotherPiece) =>
      isNotEmptyPiece && isNotInSameSide(anotherPiece);

  bool canNotAttackBy(Piece anotherPiece) =>
      !isNotEmptyPiece || !isNotInSameSide(anotherPiece);

  void onMove(Position newPosition) =>
      position.update(newPosition.x, newPosition.y);
}
