import 'board.dart';
import 'pieces/piece.dart';

class Game {
  bool isWhiteTurn = true;
  Piece? selectedPiece;

  final Board _pieces = Board();

  final List<Piece> _highLightPieces = [];

  Piece pieceAt({required int x, required int y}) => _pieces[y][x];

  Piece pieceAtPosition(Position position) => _pieces[position.y][position.x];

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
    bool shouldMove = this.selectedPiece != null &&
        _highLightPieces.isNotEmpty &&
        _highLightPieces.any(
          (element) => element.isEqual(selectedPiece),
        );

    if (shouldMove) {
      move(this.selectedPiece!, selectedPiece);
    } else {
      if (isSelectedPiece(selectedPiece) || selectedPiece.isEmptyPiece) {
        clearBoard();
        return;
      }

      this.selectedPiece = selectedPiece;

      addHighlightPieces(
        selectedPiece: selectedPiece,
        positions: selectedPiece.avaiablePositions(_pieces),
      );
    }
  }

  bool isSelectedPiece(Piece piece) => piece == selectedPiece;

  void clearSelectedPiece() => selectedPiece = null;

  void clearBoard() {
    _highLightPieces.clear();
    clearSelectedPiece();
  }

  void move(Piece movingPiece, Piece destinationPiece) {
    _pieces[movingPiece.position.y][movingPiece.position.x] = EmptyPiece(
      position: Position.copy(movingPiece.position),
    );

    movingPiece.onMove(destinationPiece.position);

    _pieces[destinationPiece.position.y][destinationPiece.position.x] =
        movingPiece;

    clearBoard();

    isWhiteTurn = !isWhiteTurn;
  }
}
