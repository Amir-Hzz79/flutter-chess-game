import 'package:flutter_chess_game/enums/highlight_types.dart';
import 'package:flutter_chess_game/models/highlight_piece.dart';

import '../enums/game_status.dart';
import 'piece_row.dart';
import 'pieces/piece.dart';

class Board extends Iterable {
  Board({List<PieceRow>? pieces}) {
    _pieces = pieces ??
        [
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
  }

  Board copy() {
    List<PieceRow> pieces = [];

    for (PieceRow pieceRow in _pieces) {
      pieces.add(pieceRow.copy());
    }

    return Board(pieces: pieces);
  }

  List<PieceRow> _pieces = [];

  final List<HighlightPiece> _highLightPieces = [];

  @override
  Iterator<PieceRow> get iterator => _pieces.iterator;

  PieceRow operator [](int i) => _pieces[i];

  Piece at(Position position) => this[position.y][position.x];

  HighlightPiece getHighlightType(Piece piece) => _highLightPieces
          .where(
            (element) => element.piece.isEqual(piece),
          )
          .isEmpty
      ? HighlightPiece(piece: piece, highlightType: HighlightTypes.none)
      : _highLightPieces
          .where(
            (element) => element.piece.isEqual(piece),
          )
          .first;

  void clearBoard() => _highLightPieces.clear();

  void addHighlightPiece(HighlightPiece highlightPiece) =>
      _highLightPieces.add(highlightPiece);

  void addHighlightPieces(
    List<HighlightPiece> highlightPieces,
  ) =>
      _highLightPieces.addAll(highlightPieces);

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
    List<Position> avaiablePositions = [];

    for (var piece in whitePieces) {
      avaiablePositions.addAll(piece.avaiablePositions(this));
    }

    return avaiablePositions;
  }

  List<Position> get allBlackSideAvaiablePositions {
    List<Position> avaiablePositions = [];

    for (var piece in blackPieces) {
      avaiablePositions.addAll(piece.avaiablePositions(this));
    }

    return avaiablePositions;
  }

  bool get isWhiteChecked {
    Position whiteKingPosition = findPiece<King>(true).first.position;

    return allBlackSideAvaiablePositions
        .where(
          (element) => element.isEqualPosition(whiteKingPosition),
        )
        .isNotEmpty;
  }

  bool get isBlackChecked {
    Position blackKingPosition = findPiece<King>(false).first.position;

    return allWhiteSideAvaiablePositions
        .where(
          (element) => element.isEqualPosition(blackKingPosition),
        )
        .isNotEmpty;
  }

  bool get isWhiteMated {
    List<Position> avaiablePositions = [];

    for (var piece in whitePieces) {
      avaiablePositions.addAll(_filterMovesCauseCheck(piece));
    }

    return avaiablePositions.isEmpty;
  }

  bool get isBlackMated {
    List<Position> avaiablePositions = [];

    for (var piece in blackPieces) {
      avaiablePositions.addAll(_filterMovesCauseCheck(piece));
    }

    return avaiablePositions.isEmpty;
  }

  void move(Piece movingPiece, Piece destinationPiece) {
    _placePiece(
      movingPiece.position,
      EmptyPiece(
        position: movingPiece.position.copy(),
      ),
    );

    movingPiece.onMove(destinationPiece.position);

    _placePiece(
      destinationPiece.position,
      movingPiece,
    );

    clearBoard();
  }

  ///return positions that this piece can uncheck
  List<Position> _filterMovesCauseCheck(Piece piece) {
    List<Position> avaiablePositions = piece.avaiablePositions(this);
    List<Position> movablePositions = [];

    for (var position in avaiablePositions) {
      GameStatus gameStatusAfterMove =
          _simulationMove(piece.position.copy(), position.copy());

      bool stillChecked =
          gameStatusAfterMove == GameStatus.blackChecked && !piece.isWhite! ||
              gameStatusAfterMove == GameStatus.whiteChecked && piece.isWhite!;

      if (!stillChecked) {
        movablePositions.add(position);
      }
    }

    return movablePositions;
  }

  ///Simulate moving and return the game status after this move
  GameStatus _simulationMove(Position origin, Position destination) {
    Board simulationBoard = copy();

    Piece originPiece = simulationBoard.at(origin);
    simulationBoard.move(originPiece, simulationBoard.at(destination));

    return simulationBoard.gameStatus(
      whiteMovesLast: originPiece.isWhite!,
      scanCheckMates: false,
    );
  }

  void _placePiece(Position postionToChange, Piece pieceToReplace) {
    _pieces[postionToChange.y][postionToChange.x] = pieceToReplace;
  }

  /// return positions of the matches piece type in the board
  List<Piece> findPiece<T>(bool isWhite) {
    if (T is EmptyPiece) {
      throw ArgumentError('Cant pass an empty piece');
    }

    List<Piece> foundPiecesPosition = [];
    for (PieceRow pieceRow in _pieces) {
      for (Piece piece in pieceRow) {
        if (piece is T && piece.isWhite! == isWhite) {
          foundPiecesPosition.add(piece);
        }
      }
    }

    return foundPiecesPosition;
  }

  GameStatus gameStatus({
    required bool whiteMovesLast,
    bool scanCheckMates = true,
  }) {
    if (isWhiteChecked) {
      return scanCheckMates
          ? isWhiteMated
              ? GameStatus.blackWins
              : GameStatus.whiteChecked
          : GameStatus.whiteChecked;
    } else if (isBlackChecked) {
      return scanCheckMates
          ? isBlackMated
              ? GameStatus.whiteWins
              : GameStatus.blackChecked
          : GameStatus.blackChecked;
    }

    return whiteMovesLast ? GameStatus.blackTurn : GameStatus.whiteTurn;
  }
}
