import 'package:flutter/material.dart';
import 'package:flutter_chess_game/widgets/piece_list_tile.dart';
import '../models/game.dart';
import '../models/pieces/piece.dart';
import 'piece_button.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  late Game game;

  @override
  void initState() {
    game = Game(
      onPawnReachEnd: showPieceList,
    );

    super.initState();
  }

  Future<Piece?> showPieceList(Piece piece) async {
    return await Navigator.push(
      context,
      ModalBottomSheetRoute(
          enableDrag: false,
          isDismissible: false,
          useSafeArea: true,
          builder: (context) {
            return IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  PieceListTile(
                    onTap: (piece) => setState(() {
                      Navigator.pop(context, piece);
                    }),
                    piece: Queen(
                      id: piece.id,
                      isWhite: piece.isWhite,
                      position: piece.position.copy(),
                    ),
                  ),
                  PieceListTile(
                    onTap: (piece) => setState(() {
                      Navigator.pop(context, piece);
                    }),
                    piece: Rook(
                      id: piece.id,
                      isWhite: piece.isWhite,
                      position: piece.position.copy(),
                    ),
                  ),
                  PieceListTile(
                    onTap: (piece) => setState(() {
                      Navigator.pop(context, piece);
                    }),
                    piece: Knight(
                      id: piece.id,
                      isWhite: piece.isWhite,
                      position: piece.position.copy(),
                    ),
                  ),
                  PieceListTile(
                    onTap: (piece) => setState(() {
                      Navigator.pop(context, piece);
                    }),
                    piece: Bishop(
                      id: piece.id,
                      isWhite: piece.isWhite,
                      position: piece.position.copy(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
          isScrollControlled: true),
    );

    /* await showBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            PieceListTile(
              onTap: (piece) => setState(() {
                selectedPiece = piece;
              }),
              piece: Queen(
                id: piece.id,
                isWhite: piece.isWhite,
                position: piece.position.copy(),
              ),
            ),
            PieceListTile(
              onTap: (piece) => setState(() {
                selectedPiece = piece;
              }),
              piece: Rook(
                id: piece.id,
                isWhite: piece.isWhite,
                position: piece.position.copy(),
              ),
            ),
            PieceListTile(
              onTap: (piece) => setState(() {
                selectedPiece = piece;
              }),
              piece: Knight(
                id: piece.id,
                isWhite: piece.isWhite,
                position: piece.position.copy(),
              ),
            ),
            PieceListTile(
              onTap: (piece) => setState(() {
                selectedPiece = piece;
              }),
              piece: Bishop(
                id: piece.id,
                isWhite: piece.isWhite,
                position: piece.position.copy(),
              ),
            ),
          ],
        );
      },
    ); */
  }

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
                          highlightPiece: game.getHighlightType(piece),
                          /* isSelected: game.isSelectedPiece(
                            piece,
                          ),
                          isHighLighted: game.highlightPiece(
                            piece,
                          ), */
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
