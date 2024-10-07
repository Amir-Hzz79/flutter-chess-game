import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/pieces/piece.dart';
import 'piece_button.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  final Game game = Game();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(game.currentGameStatus.name),
        SizedBox(
          /* width: screenSize.width, */
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
                      Piece piece = game.pieceAt(y: index1, x: index2);
                      return Expanded(
                        child: PieceButton(
                          piece: piece,
                          isSelected: game.isSelectedPiece(
                            piece,
                          ),
                          isHighLighted: game.isHighlighted(
                            piece,
                          ),
                          onPress: () {
                            setState(
                              () {
                                game.selectPiece(piece);
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
