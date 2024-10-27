import 'package:flutter/material.dart';
import 'package:flutter_chess_game/enums/highlight_types.dart';
import 'package:flutter_chess_game/models/highlight_piece.dart';

class PieceButton extends StatelessWidget {
  const PieceButton({
    super.key,
    required this.highlightPiece,
    required this.onPress,
  });

  final HighlightPiece highlightPiece;
  final void Function() onPress;

  Color get generateBackgroundColor {
    bool odd = highlightPiece.piece.position.xPlusy % 2 == 0;
    Color buttonColor = odd ? Colors.black12 : Colors.white10;

    if (highlightPiece.highlightType != HighlightTypes.none) {
      if (highlightPiece.highlightType == HighlightTypes.self) {
        buttonColor = Colors.blue;
      } else if (highlightPiece.highlightType == HighlightTypes.movable) {
        buttonColor = odd ? Colors.amber : Colors.amberAccent;
      } else if (highlightPiece.highlightType == HighlightTypes.attackable) {
        buttonColor = Colors.green;
      } else if (highlightPiece.highlightType == HighlightTypes.checked) {
        buttonColor = Colors.purple;
      } else if (highlightPiece.highlightType == HighlightTypes.checkMate) {
        buttonColor = Colors.orange;
      } else if (highlightPiece.highlightType == HighlightTypes.castling) {
        buttonColor = Colors.pink;
      }
    }

    return buttonColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: generateBackgroundColor,
          image: highlightPiece.piece.icon != null
              ? DecorationImage(
                  image: AssetImage(highlightPiece.piece.icon!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: highlightPiece.piece.title != null
            ? Center(
                child: Text(
                  highlightPiece.piece.title!,
                ),
              )
            : null,
      ),
    );
  }
}
