import 'package:flutter/material.dart';

enum ScreenType {mobile, tab, web}

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  setLastContext(BuildContext context) {
    lastContext = context;
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if(scrWidth > 915) {
      return ScreenType.web;
    } else if(scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;

  }

}
