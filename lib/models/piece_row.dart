import 'pieces/piece.dart';

class PieceRow extends Iterable {
  PieceRow({
    required this.pieces,
  });

  List<Piece> pieces;

  @override
  Iterator<Piece> get iterator => pieces.iterator;

  Piece operator [](int i) => pieces[i];

  operator []=(int i, Piece piece) => pieces[i] = piece;
}
