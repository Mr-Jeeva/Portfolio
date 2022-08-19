import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/experience/experienceMobile.dart';
import 'package:portfolio/view/experience/experienceTab.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/colors.dart';
import 'experienceWeb.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ExperienceWeb(),
      mobileView: ExperienceMobile(),
      tabView: ExperienceTab(),
    );
  }
}
