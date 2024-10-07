import 'package:flutter/material.dart';

import 'widgets/chess.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Chess(),
    );
  }
}
