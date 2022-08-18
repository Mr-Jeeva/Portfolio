import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/about/abourWeb.dart';
import 'package:portfolio/view/about/aboutMobile.dart';
import 'package:portfolio/view/about/aboutTab.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: AboutWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}
