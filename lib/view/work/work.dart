import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/work/workMobile.dart';
import 'package:portfolio/view/work/workTab.dart';
import 'package:portfolio/view/work/workWeb.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: WorkTab(),
      webView: WorkWeb(),
      mobileView: WorkMobile(),
    );
  }
}
