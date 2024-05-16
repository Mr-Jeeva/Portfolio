import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/resource/appClass.dart';

class GameAreaTab extends ConsumerStatefulWidget {
  const GameAreaTab({Key? key}) : super(key: key);

  @override
  ConsumerState<GameAreaTab> createState() => _GameAreaWebState();
}

class _GameAreaWebState extends ConsumerState<GameAreaTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context) - 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.image_rounded),
          ),
          Text("Sorry!, Currently this Section only available on web(Desktop)"),
        ],
      ),
    );
  }
}
