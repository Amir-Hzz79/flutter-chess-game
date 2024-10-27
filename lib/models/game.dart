import 'package:flutter_chess_game/enums/game_status.dart';
import 'package:flutter_chess_game/enums/highlight_types.dart';
import 'package:flutter_chess_game/models/highlight_piece.dart';

import 'board.dart';
import 'pieces/piece.dart';

class Game {
  final Board _board = Board();

  Piece? _selectedPiece;

  bool get isWhiteTurn =>
      _currentGameStatus == GameStatus.whiteTurn ||
      _currentGameStatus == GameStatus.whiteChecked;

  GameStatus _currentGameStatus = GameStatus.whiteTurn;

  GameStatus get currentGameStatus => _currentGameStatus;

  Piece pieceAt({required int x, required int y}) => _board[y][x];

  HighlightPiece getHighlightType(Piece piece) =>
      _board.getHighlightType(piece);

  void selectPiece(Piece selectedPiece) {
    bool shouldMove = _selectedPiece != null &&
        !_selectedPiece!.isEqual(selectedPiece) &&
        _board.getHighlightType(selectedPiece).canMoveToIt;

    if (shouldMove) {
      _board.move(_selectedPiece!, _board.getHighlightType(selectedPiece));

      _currentGameStatus = _board.gameStatus(
        whiteMovesLast: _selectedPiece!.isWhite!,
        scanCheckMates: true,
      );

      _board.clearBoard();
      _clearSelectedPiece();
    } else if (!isSelectedPiece(selectedPiece) &&
        selectedPiece.isNotEmptyPiece &&
        isWhiteTurn == selectedPiece.isWhite) {
      _board.clearBoard();
      _clearSelectedPiece();

      _board.addHighlightPieces(_filterMovesCauseCheck(selectedPiece));

      _selectedPiece = selectedPiece;
    } else {
      _board.clearBoard();
      _clearSelectedPiece();
    }

    _highlightGameStatusPieces();
  }

  ///Highlight some some pieces base on game status
  void _highlightGameStatusPieces() {
    if (_currentGameStatus == GameStatus.whiteChecked) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(true).first,
          highlightType: HighlightTypes.checked,
        ),
      );
    } else if (_currentGameStatus == GameStatus.blackChecked) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(false).first,
          highlightType: HighlightTypes.checked,
        ),
      );
    } else if (_currentGameStatus == GameStatus.whiteWins) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(false).first,
          highlightType: HighlightTypes.checkMate,
        ),
      );
    } else if (_currentGameStatus == GameStatus.blackWins) {
      _board.addHighlightPiece(
        HighlightPiece(
          piece: _board.findPiece<King>(true).first,
          highlightType: HighlightTypes.checkMate,
        ),
      );
    }
  }

  ///return positions that this piece can uncheck
  List<HighlightPiece> _filterMovesCauseCheck(Piece piece) {
    List<HighlightPiece> avaiablePieces = piece.avaiablePieces(_board);
    List<HighlightPiece> movablePieces = [];
    for (var highlightPieces in avaiablePieces) {
      GameStatus gameStatusAfterMove = _simulationMove(
        piece,
        highlightPieces,
      );
      bool stillChecked =
          gameStatusAfterMove == GameStatus.blackChecked && !isWhiteTurn ||
              gameStatusAfterMove == GameStatus.whiteChecked && isWhiteTurn;

      if (!stillChecked) {
        movablePieces.add(highlightPieces);
      }
    }

    return movablePieces;
  }

  ///Simulate moving and return the game status after this move
  GameStatus _simulationMove(Piece origin, HighlightPiece destination) {
    Board simulationBoard = _board.copy();
    Piece originPiece = origin.copy()!;
    HighlightPiece destinationPiece = destination.copy();

    simulationBoard.move(originPiece, destinationPiece);

    return simulationBoard.gameStatus(
      whiteMovesLast: originPiece.isWhite!,
      scanCheckMates: false,
    );
  }

  bool isSelectedPiece(Piece piece) => piece == _selectedPiece;

  void _clearSelectedPiece() => _selectedPiece = null;
}
