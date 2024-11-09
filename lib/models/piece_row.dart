import 'pieces/piece.dart';

class PieceRow extends Iterable {
  const PieceRow({
    required this.pieces,
  });

  final List<Piece> pieces;

  @override
  Iterator<Piece> get iterator => pieces.iterator;

  Piece operator [](int i) => pieces[i];

  operator []=(int i, Piece piece) => pieces[i] = piece;

  PieceRow copy() {
    List<Piece> newPieces = [];

    for (Piece piece in pieces) {
      newPieces.add(piece.copy()!);
    }

    return PieceRow(pieces: newPieces);
  }

  /// return positions of the matches piece type in the board
  List<T> findPiece<T>({bool? isWhite}) {
    if (T is EmptyPiece) {
      throw ArgumentError('Cant pass an empty piece');
    }

    List<T> foundPiecesPosition = [];

    for (Piece piece in pieces) {
      if (piece is T && (isWhite == null || piece.isWhite! == isWhite)) {
        foundPiecesPosition.add(piece as T);
      }
    }

    return foundPiecesPosition;
  }
}
