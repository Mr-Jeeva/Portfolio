import 'package:flutter/cupertino.dart';
import 'package:portfolio/resource/appClass.dart';

class Responsive extends StatefulWidget {
  var mobileView, webView, tabView;

  Responsive({Key? key, this.mobileView, this.tabView, this.webView})
      : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    ScreenType scrType = AppClass().getScreenType(context);
    switch (scrType) {
      case ScreenType.mobile:
        return widget.mobileView;
      case ScreenType.tab:
        return widget.tabView;
      case ScreenType.web:
        return widget.webView;
    }
  }
}
