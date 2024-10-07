import 'pieces/piece.dart';

class PieceRow extends Iterable {
  PieceRow({
    required this.pieces,
  });

  List<Piece> pieces;

  @override
  Iterator get iterator => pieces as Iterator;

  Piece operator [](int i) => pieces[i];

  operator []=(int i, Piece piece) => pieces[i] = piece;
}
