import 'package:flutter/material.dart';
import 'package:portfolio/resource/responsive.dart';
import 'package:portfolio/view/game/gameAreaWeb.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'gameAreaMob.dart';
import 'gameAreaTab.dart';

class GameArea extends StatefulWidget {
  var mScrollController;

  GameArea(this.mScrollController, {Key? key}) : super(key: key);

  @override
  State<GameArea> createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: GameAreaWeb(widget.mScrollController),
      tabView: GameAreaTab(),
      mobileView: GameAreaMob(),
    );
  }
}
