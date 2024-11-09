import 'package:flutter_chess_game/enums/game_status.dart';
import 'package:flutter_chess_game/models/highlight_piece.dart';

import '../enums/highlight_types.dart';
import 'board.dart';
import 'pieces/piece.dart';

class Game {
  Game({
    required this.onPawnReachEnd,
  });

  final Future<Piece?> Function(Piece piece) onPawnReachEnd;

  final Board _board = Board();

  Piece? _selectedPiece;

  bool get isWhiteTurn =>
      _currentGameStatus == GameStatus.whiteTurn ||
      _currentGameStatus == GameStatus.whiteChecked;

  GameStatus _currentGameStatus = GameStatus.whiteTurn;

  GameStatus get currentGameStatus => _currentGameStatus;

  set currentGameStatus(GameStatus newValue) {
    _currentGameStatus = newValue;
    _highlightGameStatusPieces();
  }

  Piece pieceAt({required int x, required int y}) => _board[y][x];

  HighlightPiece getHighlightType(Piece piece) =>
      _board.getHighlightType(piece);

  void selectPiece(Piece selectedPiece) async {
    bool shouldMove = _selectedPiece != null &&
        !_selectedPiece!.isEqual(selectedPiece) &&
        _board.getHighlightType(selectedPiece).canMoveToIt;

    if (currentGameStatus == GameStatus.pawnNeedConvert) {
      _convertPawn();
      /* _highlightGameStatusPieces(); */

      return;
    }

    if (shouldMove) {
      currentGameStatus = _board.move(
        movingPiece: _selectedPiece!,
        destinationPiece: _board.getHighlightType(selectedPiece),
      );

      /*  currentGameStatus = _board.gameStatus(
        whiteMovesLast: _selectedPiece!.isWhite!,
        scanCheckMates: true,
      ); */

      if (currentGameStatus == GameStatus.pawnNeedConvert) {
        _convertPawn();

        /* _highlightGameStatusPieces(); */
      }

      _board.clearBoard(currentGameStatus);
      _clearSelectedPiece();
    } else if (!isSelectedPiece(selectedPiece) &&
        selectedPiece.isNotEmptyPiece &&
        isWhiteTurn == selectedPiece.isWhite) {
      _board.clearBoard(currentGameStatus);
      _clearSelectedPiece();

      _board.addHighlightPieces(_filterMovesCauseCheck(selectedPiece));

      _selectedPiece = selectedPiece;
    } else {
      _board.clearBoard(currentGameStatus);
      _clearSelectedPiece();
    }

    /* _highlightGameStatusPieces(); */
  }

  void _convertPawn() async {
    Pawn pawnToConvert = _board.pawnReachEnd()!;

    Piece? selectedPieceToConvert = await onPawnReachEnd.call(pawnToConvert);

    if (selectedPieceToConvert != null) {
      _board.placePiece(pawnToConvert.position, selectedPieceToConvert);

      currentGameStatus = _board.gameStatus(
        whiteMovesLast: pawnToConvert.isWhite!,
        scanCheckMates: true,
      );
    }
  }

  ///Highlight some some pieces base on game status
  void _highlightGameStatusPieces() {
    if (currentGameStatus == GameStatus.whiteChecked) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(isWhite: true).first,
          highlightType: HighlightTypes.checked,
        ),
      );
    } else if (currentGameStatus == GameStatus.blackChecked) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(isWhite: false).first,
          highlightType: HighlightTypes.checked,
        ),
      );
    } else if (currentGameStatus == GameStatus.whiteWins) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(isWhite: false).first,
          highlightType: HighlightTypes.checkMate,
        ),
      );
    } else if (currentGameStatus == GameStatus.blackWins) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(isWhite: true).first,
          highlightType: HighlightTypes.checkMate,
        ),
      );
    }
  }

  ///return positions that this piece can uncheck
  List<HighlightPiece> _filterMovesCauseCheck(Piece piece) {
    List<HighlightPiece> avaiablePieces = piece.avaiablePieces(_board);
    List<HighlightPiece> movablePieces = [...avaiablePieces];

    for (var highlightPieces in avaiablePieces) {
      GameStatus gameStatusAfterMove = _simulationMove(
        piece,
        highlightPieces,
      );

      bool stillChecked =
          gameStatusAfterMove == GameStatus.blackChecked && !isWhiteTurn ||
              gameStatusAfterMove == GameStatus.whiteChecked && isWhiteTurn ||
              gameStatusAfterMove == GameStatus.whiteWins ||
              gameStatusAfterMove == GameStatus.blackWins;

      if (stillChecked &&
          highlightPieces.highlightType != HighlightTypes.self) {
        movablePieces.remove(highlightPieces);
      }
    }

    return movablePieces;
  }

  ///Simulate moving and return the game status after this move
  GameStatus _simulationMove(Piece origin, HighlightPiece destination) {
    Board simulationBoard = _board.copy();
    Piece originPiece = origin.copy()!;
    HighlightPiece destinationPiece = destination.copy();

    return simulationBoard.move(
      movingPiece: originPiece,
      destinationPiece: destinationPiece,
    );
  }

  bool isSelectedPiece(Piece piece) => piece == _selectedPiece;

  void _clearSelectedPiece() => _selectedPiece = null;
}
