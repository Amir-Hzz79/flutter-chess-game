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
      _board.addHighlightPiece(
        HighlightPiece(
            piece: selectedPiece, highlightType: HighlightTypes.self),
      );

      _board.move(_selectedPiece!, selectedPiece);

      _currentGameStatus = _board.gameStatus(
        whiteMovesLast: _selectedPiece!.isWhite!,
        scanCheckMates: true,
      );

      _board.clearBoard();
      _clearSelectedPiece();

      /* if (_currentGameStatus == GameStatus.whiteChecked) {
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
      } */
    } else if (!isSelectedPiece(selectedPiece) &&
        selectedPiece.isNotEmptyPiece &&
        isWhiteTurn == selectedPiece.isWhite) {
      _board.clearBoard();
      _clearSelectedPiece();

      List<Position> movablePositions = _filterMovesCauseCheck(selectedPiece);

      _selectedPiece = selectedPiece;

      _board.addHighlightPiece(
        HighlightPiece(
            piece: selectedPiece, highlightType: HighlightTypes.self),
      );

      for (Position position in movablePositions) {
        Piece pieceToHighlight = _board.at(position);
        _board.addHighlightPiece(
          HighlightPiece(
            piece: pieceToHighlight,
            highlightType: pieceToHighlight.isEmptyPiece
                ? HighlightTypes.movable
                : HighlightTypes.attackable,
          ),
        );
      }
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
  List<Position> _filterMovesCauseCheck(Piece piece) {
    List<Position> avaiablePositions = piece.avaiablePositions(_board);
    List<Position> movablePositions = [];
    for (var position in avaiablePositions) {
      GameStatus gameStatusAfterMove =
          _simulationMove(piece.position.copy(), position.copy());
      bool stillChecked =
          gameStatusAfterMove == GameStatus.blackChecked && !isWhiteTurn ||
              gameStatusAfterMove == GameStatus.whiteChecked && isWhiteTurn;

      if (!stillChecked) {
        movablePositions.add(position);
      }
    }

    return movablePositions;
  }

  ///Simulate moving and return the game status after this move
  GameStatus _simulationMove(Position origin, Position destination) {
    Board simulationBoard = _board.copy();

    Piece originPiece = simulationBoard.at(origin);
    simulationBoard.move(originPiece, simulationBoard.at(destination));

    return simulationBoard.gameStatus(
      whiteMovesLast: originPiece.isWhite!,
      scanCheckMates: false,
    );
  }

  bool isSelectedPiece(Piece piece) => piece == _selectedPiece;

  void _clearSelectedPiece() => _selectedPiece = null;
}
