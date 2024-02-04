import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/strings.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../resource/appClass.dart';
import '../../resource/colors.dart';

class IntroTab extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroTab(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroTab> createState() => _IntroTabState();
}

class _IntroTabState extends State<IntroTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: AppClass().getMqHeight(context) - 70,
      margin: EdgeInsets.only(
          left: AppClass().getMqWidth(context) * 0.01,
          top: AppClass().getMqHeight(context) * 0.07),
      padding: EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    Strings.welcomeTxt,
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: AppClass().getMqWidth(context) * 0.025,
                        fontFamily: 'sfmono'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    Strings.name,
                    style: GoogleFonts.robotoSlab(
                      color: AppColors().textColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: AppClass().getMqWidth(context) * 0.06,
                    ),
                  ),
                ),
                Container(
                  width: AppClass().getMqWidth(context) -
                      (AppClass().getMqWidth(context) * 0.23),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      Strings.whatIdo,
                      style: GoogleFonts.robotoSlab(
                        color: AppColors().textLight,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        fontSize: AppClass().getMqWidth(context) * 0.035,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: Strings.introAbout,
                                style: GoogleFonts.roboto(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: AppClass().getMqWidth(context) * 0.025,
                                ),
                                children: <TextSpan>[
                              TextSpan(
                                text: Strings.currentOrgName,
                                style: GoogleFonts.roboto(
                                  color: AppColors().neonColor,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: AppClass().getMqWidth(context) * 0.025,                                ),
                              )
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 50),
                  child: InkWell(
                    onTap: () {
                      widget.aScrollController.scrollToIndex(1,
                          preferPosition: AutoScrollPosition.begin);
                    },
                    child: Container(
                      height: AppClass().getMqHeight(context) * 0.09,
                      width: AppClass().getMqWidth(context) * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          border: Border.all(
                              color: AppColors().neonColor, width: 1.5)),
                      child: Center(
                        child: Text('Check Out My Work!',
                            style: TextStyle(
                                color: AppColors().neonColor,
                                fontSize: 13,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sfmono')),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
