import 'package:flutter_chess_game/enums/game_state.dart';

import 'board.dart';
import 'pieces/piece.dart';

class Game {
  bool get isWhiteTurn =>
      _currentGameStatus == GameStatus.whiteTurn ||
      _currentGameStatus == GameStatus.whiteChecked;

  GameStatus _currentGameStatus = GameStatus.whiteTurn;

  GameStatus get currentGameStatus => _currentGameStatus;

  Piece? _selectedPiece;

  final Board _board = Board();

  final List<Piece> _highLightPieces = [];

  Piece pieceAt({required int x, required int y}) => _board[y][x];

  Piece pieceAtPosition(Position position) => _board[position.y][position.x];

  void addHighlightPieces({
    required Piece selectedPiece,
    required List<Position> positions,
  }) {
    _highLightPieces.clear();

    if (isWhiteTurn != selectedPiece.isWhite) {
      return;
    }

    List<Piece> highlightPieces = [];

    for (Position position in positions) {
      Piece pieceToHighlight = pieceAtPosition(position);
      if (pieceToHighlight.isNotInSameSide(selectedPiece)) {
        highlightPieces.add(pieceToHighlight);
      }
    }

    _highLightPieces.addAll(highlightPieces);
  }

  bool isHighlighted(Piece piece) => _highLightPieces.any(
        (element) => element.isEqual(piece),
      );

  void selectPiece(Piece selectedPiece) {
    bool shouldMove = _selectedPiece != null &&
        _highLightPieces.isNotEmpty &&
        _highLightPieces.any(
          (element) => element.isEqual(selectedPiece),
        );

    if (shouldMove) {
      move(_selectedPiece!, selectedPiece);
    } else {
      if (isSelectedPiece(selectedPiece) || selectedPiece.isEmptyPiece) {
        clearBoard();
        return;
      }

      _selectedPiece = selectedPiece;

      addHighlightPieces(
        selectedPiece: selectedPiece,
        positions: selectedPiece.avaiablePositions(_board),
      );
    }
  }

  bool isSelectedPiece(Piece piece) => piece == _selectedPiece;

  void clearSelectedPiece() => _selectedPiece = null;

  void clearBoard() {
    _highLightPieces.clear();
    clearSelectedPiece();
  }

  void move(Piece movingPiece, Piece destinationPiece) {
    _board[movingPiece.position.y][movingPiece.position.x] = EmptyPiece(
      position: Position.copy(movingPiece.position),
    );

    movingPiece.onMove(destinationPiece.position);

    _board[destinationPiece.position.y][destinationPiece.position.x] =
        movingPiece;

    clearBoard();

    _currentGameStatus = _scanGameStatus(movingPiece.isWhite!);
  }

  GameStatus _scanGameStatus(bool whiteMovesLast) {
    if (_isWhiteChecked()) {
      return _isWhiteMated() ? GameStatus.blackWins : GameStatus.whiteChecked;
    } else if (_isBlackChecked()) {
      return _isBlackMated() ? GameStatus.whiteWins : GameStatus.blackChecked;
    }
    return whiteMovesLast ? GameStatus.blackTurn : GameStatus.whiteTurn;
  }

  bool _isWhiteChecked() {
    Position whiteKingPosition = _board.findPiece<King>(true).first;

    return _board.allBlackSideAvaiablePositions
        .where(
          (element) => element.isEqualPosition(whiteKingPosition),
        )
        .isNotEmpty;
  }

  bool _isWhiteMated() => _board.allWhiteSideAvaiablePositions.isEmpty;
  bool _isBlackMated() => _board.allBlackSideAvaiablePositions.isEmpty;

  bool _isBlackChecked() {
    Position blackKingPosition = _board.findPiece<King>(false).first;

    return _board.allWhiteSideAvaiablePositions
        .where(
          (element) => element.isEqualPosition(blackKingPosition),
        )
        .isNotEmpty;
  }
}
