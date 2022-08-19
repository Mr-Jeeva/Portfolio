import 'package:flutter/material.dart';
import 'package:portfolio/resource/colors.dart';

import '../model/experienceModel.dart';
import '../model/workModel.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();
  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "SafeC19",
        projectContent:
            "It’s an Automatic Contactless Face Mask detection/Temperature detection/Hand Sanitizer app",
        tech1: "Android",
        tech2: "Google ML",
        tech3: "Java"),
    WorkModel(
        projectTitle: "Hermarts",
        projectContent: "E-Commerce Application for homemade Indian products",
        tech1: "Android",
        tech2: "RazorPay"),
    WorkModel(
        projectTitle: "WT-IoT",
        projectContent:
            '''It’s a water treatment process controller which can control all the sensors, calibration process, and staff management.''',
        tech1: "Android",
        tech2: "TCP",
        tech3: "API"),
    WorkModel(
        projectTitle: "AutoStabilizer",
        projectContent:
            '''Client - SenseElec Remote controller mobile app for stabilizers and can be accessed locally(WiFi) and globally(MQTT).''',
        tech1: "Android",
        tech2: "MQTT"),
    WorkModel(
        projectTitle: "PAT",
        projectContent:
            '''PCB testing tool that helps QC/QA employees of rax-tech international, records the production flow and work strategy of every employee and automatically generates and stores some of the records as reports in the cloud.''',
        tech1: "Flutter",
        tech2: "NodeJs"),
    WorkModel(
        projectTitle: "AVM",
        projectContent:
            '''It Acts as a display of a beverage vending machine that can perform several operations like Brewing, Dispensing, Cleaning drums, and several other operations.''',
        tech1: "Android",
        tech2: "Tablet"),
  ];

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
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }
}
