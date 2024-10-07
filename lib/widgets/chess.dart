import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/pieces/piece.dart';
import 'piece_button.dart';

class Chess extends StatefulWidget {
  const Chess({super.key});

  @override
  State<Chess> createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  final Game board = Game();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenSize.width,
          height: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              8,
              (index1) => Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    8,
                    (index2) {
                      Piece piece = board.pieceAt(y: index1, x: index2);
                      return Expanded(
                        child: PieceButton(
                          piece: piece,
                          isSelected: board.isSelectedPiece(
                            piece,
                          ),
                          isHighLighted: board.isHighlighted(
                            piece,
                          ),
                          onPress: () {
                            setState(
                              () {
                                board.selectPiece(piece);
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
