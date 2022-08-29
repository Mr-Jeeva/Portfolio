import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/intro/introMobile.dart';
import 'package:portfolio/view/intro/introWeb.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'introTab.dart';

class IntroContent extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroContent(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: IntroTab(widget.aScrollController),
      mobileView: IntroMobile(widget.aScrollController),
      webView: IntroWeb(widget.aScrollController),
    );
  }
}
