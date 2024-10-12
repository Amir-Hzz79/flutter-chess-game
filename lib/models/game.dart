import 'package:flutter_chess_game/enums/game_status.dart';

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

  bool get _isSomeoneChecked =>
      _currentGameStatus == GameStatus.whiteChecked ||
      _currentGameStatus == GameStatus.blackChecked;

  Piece pieceAt({required int x, required int y}) => _board[y][x];

  bool isHighlighted(Piece piece) => _board.isHighlighted(piece);

  void selectPiece(Piece selectedPiece) {
    bool shouldMove =
        _selectedPiece != null && _board.isHighlighted(selectedPiece);

    if (shouldMove) {
      _board.move(_selectedPiece!, selectedPiece);
      _currentGameStatus = _board.gameStatus(_selectedPiece!.isWhite!);
    } else {
      if (isSelectedPiece(selectedPiece) ||
          selectedPiece.isEmptyPiece ||
          isWhiteTurn != selectedPiece.isWhite) {
        _board.clearBoard();
        _clearSelectedPiece();
        return;
      }

      List<Position> movablePositions = _filterMovesCauseCheck(selectedPiece);

      _selectedPiece = selectedPiece;

      _board.addHighlightPieces(
        selectedPiece: selectedPiece,
        positions: movablePositions,
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
      originPiece.isWhite!,
    );
  }

  bool isSelectedPiece(Piece piece) => piece == _selectedPiece;

  void _clearSelectedPiece() => _selectedPiece = null;
}
