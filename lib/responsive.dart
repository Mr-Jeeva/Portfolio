import 'package:flutter/cupertino.dart';
import 'package:portfolio/resource/appClass.dart';

class Resposive extends StatefulWidget {
  var mobileView, webView, tabView;
  Resposive({Key? key, this.mobileView, this.tabView, this.webView}) : super(key: key);

  @override
  State<Resposive> createState() => _ResposiveState();
}

class _ResposiveState extends State<Resposive> {
  @override
  Widget build(BuildContext context) {
    ScreenType scrType = AppClass().getScreenType(context);
    switch(scrType) {
      case ScreenType.mobile:
        return widget.mobileView;
      case ScreenType.tab:
        return widget.tabView;
      case ScreenType.web:
        return widget.webView;
    }
  }
}
