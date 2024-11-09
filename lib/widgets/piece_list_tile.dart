import 'package:flutter/material.dart';

import '../models/pieces/piece.dart';

class PieceListTile extends StatelessWidget {
  const PieceListTile({
    super.key,
    required this.piece,
    required this.onTap,
  });

  final void Function(Piece piece) onTap;
  final Piece piece;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(piece),
      child: ListTile(
        leading: piece.icon == null ? null : Image.asset(piece.icon!),
        title: Text(piece.runtimeType.toString()),
        trailing: const Icon(Icons.arrow_left_rounded),
      ),
    );
  }
}
