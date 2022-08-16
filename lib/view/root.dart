import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/about/about.dart';
import 'package:portfolio/view/intro/intro.dart';
import 'package:portfolio/view/widget/appBar.dart';
import 'package:portfolio/view/experience.dart';
import 'package:portfolio/view/widget/leftPane.dart';
import 'package:portfolio/view/widget/rightPane.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Color(0xff112240),
                Color(0xff0a192f),
                Color(0xff020c1b)
              ])),
          height: AppClass().getMqHeight(context),
          child: Column(
            children: [
              ActionBar(),
              Expanded(
                child: Row(
                  children: [
                    LeftPane(),
                    Expanded(
                        flex: 8,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              IntroContent(),
                              About(),
                              Experience(),
                            ],
                          ),
                        )),
                    RightPane(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
