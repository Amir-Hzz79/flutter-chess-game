import 'piece_row.dart';
import 'pieces/piece.dart';

class Board extends Iterable {
  Board();

  final List<PieceRow> _pieces = [
    PieceRow(
      pieces: [
        Rook(
          id: 'BR1',
          isWhite: false,
          position: Position(x: 0, y: 0),
        ),
        Knight(
          id: 'BN1',
          isWhite: false,
          position: Position(x: 1, y: 0),
        ),
        Bishop(
          id: 'BB1',
          isWhite: false,
          position: Position(x: 2, y: 0),
        ),
        King(
          id: 'BK',
          isWhite: false,
          position: Position(x: 3, y: 0),
        ),
        Queen(
          id: 'BQ',
          isWhite: false,
          position: Position(x: 4, y: 0),
        ),
        Bishop(
          id: 'BB2',
          isWhite: false,
          position: Position(x: 5, y: 0),
        ),
        Knight(
          id: 'BN2',
          isWhite: false,
          position: Position(x: 6, y: 0),
        ),
        Rook(
          id: 'BR2',
          isWhite: false,
          position: Position(x: 7, y: 0),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        Pawn(
          id: 'BP0',
          isWhite: false,
          position: Position(x: 0, y: 1),
        ),
        Pawn(
          id: 'BP1',
          isWhite: false,
          position: Position(x: 1, y: 1),
        ),
        Pawn(
          id: 'BP2',
          isWhite: false,
          position: Position(x: 2, y: 1),
        ),
        Pawn(
          id: 'BP3',
          isWhite: false,
          position: Position(x: 3, y: 1),
        ),
        Pawn(
          id: 'BP4',
          isWhite: false,
          position: Position(x: 4, y: 1),
        ),
        Pawn(
          id: 'BP5',
          isWhite: false,
          position: Position(x: 5, y: 1),
        ),
        Pawn(
          id: 'BP6',
          isWhite: false,
          position: Position(x: 6, y: 1),
        ),
        Pawn(
          id: 'BP7',
          isWhite: false,
          position: Position(x: 7, y: 1),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        EmptyPiece(
          position: Position(x: 0, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 1, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 2, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 3, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 4, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 5, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 6, y: 2),
        ),
        EmptyPiece(
          position: Position(x: 7, y: 2),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        EmptyPiece(
          position: Position(x: 0, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 1, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 2, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 3, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 4, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 5, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 6, y: 3),
        ),
        EmptyPiece(
          position: Position(x: 7, y: 3),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        EmptyPiece(
          position: Position(x: 0, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 1, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 2, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 3, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 4, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 5, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 6, y: 4),
        ),
        EmptyPiece(
          position: Position(x: 7, y: 4),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        EmptyPiece(
          position: Position(x: 0, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 1, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 2, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 3, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 4, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 5, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 6, y: 5),
        ),
        EmptyPiece(
          position: Position(x: 7, y: 5),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        Pawn(
          id: 'WP0',
          isWhite: true,
          position: Position(x: 0, y: 6),
        ),
        Pawn(
          id: 'WP1',
          isWhite: true,
          position: Position(x: 1, y: 6),
        ),
        Pawn(
          id: 'WP2',
          isWhite: true,
          position: Position(x: 2, y: 6),
        ),
        Pawn(
          id: 'WP3',
          isWhite: true,
          position: Position(x: 3, y: 6),
        ),
        Pawn(
          id: 'WP4',
          isWhite: true,
          position: Position(x: 4, y: 6),
        ),
        Pawn(
          id: 'WP5',
          isWhite: true,
          position: Position(x: 5, y: 6),
        ),
        Pawn(
          id: 'WP6',
          isWhite: true,
          position: Position(x: 6, y: 6),
        ),
        Pawn(
          id: 'WP7',
          isWhite: true,
          position: Position(x: 7, y: 6),
        ),
      ],
    ),
    PieceRow(
      pieces: [
        Rook(
          id: 'WR1',
          isWhite: true,
          position: Position(x: 0, y: 7),
        ),
        Knight(
          id: 'WN1',
          isWhite: true,
          position: Position(x: 1, y: 7),
        ),
        Bishop(
          id: 'WB1',
          isWhite: true,
          position: Position(x: 2, y: 7),
        ),
        King(
          id: 'WK',
          isWhite: true,
          position: Position(x: 3, y: 7),
        ),
        Queen(
          id: 'WQ',
          isWhite: true,
          position: Position(x: 4, y: 7),
        ),
        Bishop(
          id: 'WB2',
          isWhite: true,
          position: Position(x: 5, y: 7),
        ),
        Knight(
          id: 'WN2',
          isWhite: true,
          position: Position(x: 6, y: 7),
        ),
        Rook(
          id: 'WR2',
          isWhite: true,
          position: Position(x: 7, y: 7),
        ),
      ],
    ),
  ];

  @override
  Iterator get iterator => _pieces as Iterator;

  PieceRow operator [](int i) => _pieces[i];

  Piece at(Position position) => this[position.y][position.x];

  List<Piece> get whitePieces {
    List<Piece> whitePieces = [];

    for (var row in _pieces) {
      for (var piece in row) {
        if ((piece as Piece).isNotEmptyPiece && piece.isWhite!) {
          whitePieces.add(piece);
        }
      }
    }

    return whitePieces;
  }

  List<Piece> get blackPieces {
    List<Piece> whitePieces = [];

    for (var row in _pieces) {
      for (var piece in row) {
        if ((piece as Piece).isNotEmptyPiece && !piece.isWhite!) {
          whitePieces.add(piece);
        }
      }
    }

    return whitePieces;
  }

  List<Position> get allWhiteSideAvaiablePositions {
    List<Piece> whitePieces = this.whitePieces;

    List<Position> avaiablePositions = [];

    for (var piece in whitePieces) {
      avaiablePositions.addAll(piece.avaiablePositions(this));
    }

    return avaiablePositions;
  }

  List<Position> get allBlackSideAvaiablePositions {
    List<Piece> blackPieces = this.blackPieces;

    List<Position> avaiablePositions = [];

    for (var piece in blackPieces) {
      avaiablePositions.addAll(piece.avaiablePositions(this));
    }

    return avaiablePositions;
  }

  /// return positions of the matches piece in the board
  List<Position> findPiece<T>(bool isWhite) {
    if (T is EmptyPiece) {
      throw ArgumentError('Cant pass an empty piece');
    }

    List<Position> foundPiecesPosition = [];
    for (PieceRow pieceRow in _pieces) {
      for (Piece piece in pieceRow) {
        if (piece is T && piece.isWhite! == isWhite) {
          foundPiecesPosition.add(piece.position);
        }
      }
    }

    return foundPiecesPosition;
  }
}
