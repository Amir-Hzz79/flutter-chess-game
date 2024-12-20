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

  bool isEmptyPiece(Position position) => at(position).isEmptyPiece;
  bool isNotEmptyPiece(Position position) => at(position).isNotEmptyPiece;

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

  //TODO: clear base on game status
  void clearBoard(GameStatus gameStatus) {
    if (gameStatus == GameStatus.whiteChecked ||
        gameStatus == GameStatus.blackChecked ||
        gameStatus == GameStatus.whiteWins ||
        gameStatus == GameStatus.blackWins) {
      _highLightPieces.removeWhere(
        (element) =>
            element.highlightType != HighlightTypes.checked &&
            element.highlightType !=
                HighlightTypes
                    .checkMate /* &&
            element.highlightType != HighlightTypes.self */
        ,
      );
    } else if (gameStatus == GameStatus.pawnNeedConvert) {
      _highLightPieces.removeWhere(
        (element) => element.highlightType != HighlightTypes.pawnToConvert,
      );
    } else {
      _highLightPieces.clear();
    }
  }

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

  List<HighlightPiece> get allWhiteSideAvaiablePositions {
    List<HighlightPiece> avaiablePositions = [];

    for (var piece in whitePieces) {
      avaiablePositions.addAll(piece.avaiablePieces(this));
    }

    return avaiablePositions;
  }

  List<HighlightPiece> get allBlackSideAvaiablePositions {
    List<HighlightPiece> avaiablePositions = [];

    for (var piece in blackPieces) {
      avaiablePositions.addAll(piece.avaiablePieces(this));
    }

    return avaiablePositions;
  }

  bool get isPawnReachedEnd =>
      _pieces[0].findPiece<Pawn>().isNotEmpty ||
      _pieces[7].findPiece<Pawn>().isNotEmpty;

  bool get isWhiteChecked {
    Position whiteKingPosition = findPiece<King>(isWhite: true).first.position;

    return allBlackSideAvaiablePositions
        .where(
          (element) =>
              element.piece.position.isEqualPosition(whiteKingPosition),
        )
        .isNotEmpty;
  }

  bool get isBlackChecked {
    Position blackKingPosition = findPiece<King>(isWhite: false).first.position;

    return allWhiteSideAvaiablePositions
        .where(
          (element) =>
              element.piece.position.isEqualPosition(blackKingPosition),
        )
        .isNotEmpty;
  }

  bool get isWhiteMated {
    List<HighlightPiece> avaiablePositions = [];

    for (var piece in whitePieces) {
      avaiablePositions.addAll(_filterMovesCauseCheck(piece));
    }

    return avaiablePositions.isEmpty;
  }

  bool get isBlackMated {
    List<HighlightPiece> avaiablePositions = [];

    for (var piece in blackPieces) {
      avaiablePositions.addAll(_filterMovesCauseCheck(piece));
    }

    return avaiablePositions.isEmpty;
  }

  GameStatus move({
    required movingPiece,
    required HighlightPiece destinationPiece,
    bool scanCheckMate = true,
  }) {
    placePiece(
      movingPiece.position,
      EmptyPiece(
        position: movingPiece.position.copy(),
      ),
    );

    movingPiece.onMove(
      this,
      destinationPiece,
    );

    placePiece(
      destinationPiece.piece.position,
      movingPiece,
    );

    GameStatus gameStatus = this.gameStatus(
      whiteMovesLast: movingPiece.isWhite!,
      scanCheckMates: scanCheckMate,
    );

    clearBoard(gameStatus);

    return gameStatus;
  }

  ///return positions that this piece can uncheck
  List<HighlightPiece> _filterMovesCauseCheck(Piece piece) {
    List<HighlightPiece> avaiablePieces = piece.avaiablePieces(this);
    List<HighlightPiece> movablepieces = [];

    for (var highlightPiece in avaiablePieces) {
      GameStatus gameStatusAfterMove = _simulationMove(
        piece.copy()!,
        highlightPiece,
      );

      bool stillChecked = gameStatusAfterMove ==
              GameStatus.blackChecked /* && !piece.isWhite! */ ||
          gameStatusAfterMove ==
              GameStatus.whiteChecked /* && piece.isWhite! */;

      if (!stillChecked) {
        movablepieces.add(highlightPiece);
      }
    }

    return movablepieces;
  }

  ///Simulate moving and return the game status after this move
  GameStatus _simulationMove(Piece origin, HighlightPiece destination) {
    Board simulationBoard = copy();
    Piece originPiece = origin.copy()!;
    HighlightPiece destinationPiece = destination.copy();

    return simulationBoard.move(
      movingPiece: originPiece,
      destinationPiece: destinationPiece,
      scanCheckMate: false,
    );
  }

  void placePiece(Position postionToChange, Piece pieceToReplace) =>
      _pieces[postionToChange.y][postionToChange.x] = pieceToReplace;

  /// return positions of the matches piece type in the board
  List<T> findPiece<T>({bool? isWhite, int? y}) {
    if (T is EmptyPiece) {
      throw ArgumentError('Cant pass an empty piece');
    }

    List<T> foundPiecesPosition = [];
    for (int i = 0; i < 8; i++) {
      if (y == null || i == y) {
        for (Piece piece in _pieces[i]) {
          if (piece is T && (isWhite == null || piece.isWhite! == isWhite)) {
            foundPiecesPosition.add(piece as T);
          }
        }
      }
    }

    return foundPiecesPosition;
  }

  Pawn? pawnReachEnd() {
    return _pieces[0].findPiece<Pawn>().isNotEmpty
        ? _pieces[0].findPiece<Pawn>().first
        : _pieces[7].findPiece<Pawn>().isNotEmpty
            ? _pieces[7].findPiece<Pawn>().first
            : null;
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
    } else if (isPawnReachedEnd) {
      return GameStatus.pawnNeedConvert;
    }

    return whiteMovesLast ? GameStatus.blackTurn : GameStatus.whiteTurn;
  }
}
