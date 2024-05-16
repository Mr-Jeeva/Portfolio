import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/resource/appClass.dart';

class GameAreaMob extends ConsumerStatefulWidget {
  const GameAreaMob({Key? key}) : super(key: key);

  @override
  ConsumerState<GameAreaMob> createState() => _GameAreaWebState();
}

class _GameAreaWebState extends ConsumerState<GameAreaMob> {
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
