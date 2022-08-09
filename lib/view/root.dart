import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/applicationClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/widget/appBar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ActionBar(),
        body: Container(
          color: AppColors().primaryColor,
          height: AppClass().getMqHeight(context),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.access_alarm_outlined,
                                        size: 22,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.access_alarm_outlined,
                                        size: 22,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.accessibility_sharp,
                                          size: 22)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.accessibility_sharp,
                                          size: 22)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.account_circle, size: 22)),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                        width: 2,
                        color: Colors.green,
                      ))
                    ],
                  )),
              Expanded(flex: 8, child: Container(color: Colors.white70)),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Text(
                                        'jeevanandham707@gmail.com',
                                        style: GoogleFonts.abel(
                                            fontSize: 15,
                                            color: AppColors().textColor),
                                      )),
                                )
                              ],
                            )),
                        Expanded(
                            child: Container(
                          width: 2,
                          color: Colors.green,
                        ))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
