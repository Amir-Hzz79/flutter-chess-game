import 'package:flutter/material.dart';

import '../models/pieces/piece.dart';

class PieceButton extends StatelessWidget {
  const PieceButton({
    super.key,
    required this.piece,
    required this.onPress,
    required this.isSelected,
    required this.isHighLighted,
  });

  final Piece piece;
  final void Function() onPress;
  final bool isSelected;
  final bool isHighLighted;

  Color get generateBackgroundColor {
    bool odd = piece.position.xPlusy % 2 == 0;
    Color buttonColor = odd ? Colors.black12 : Colors.white10;

    if (isHighLighted) {
      if (odd) {
        buttonColor = piece.isNotEmptyPiece ? Colors.green : Colors.amber;
      } else {
        buttonColor = piece.isNotEmptyPiece ? Colors.green : Colors.amberAccent;
      }
    }

    if (isSelected) {
      buttonColor = Colors.blue;
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
          image: piece.icon != null
              ? DecorationImage(
                  image: AssetImage(piece.icon!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: piece.title != null
            ? Center(
                child: Text(
                  piece.title!,
                ),
              )
            : null,
      ),
    );
  }
}
