import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/colors.dart';

class ExperienceMobile extends StatefulWidget {
  const ExperienceMobile({Key? key}) : super(key: key);

  @override
  State<ExperienceMobile> createState() => _ExperienceMobileState();
}

class _ExperienceMobileState extends State<ExperienceMobile> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceList = [
      ExperienceModel(
          desig: "Software Engineer",
          compName: "Netaccess",
          duration: "Jun 2022 - Present",
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, qerjqwjqwiojeqwjeq ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere. asdhasjdhajhdajasbdjbasjkdasjkbldjkabsdjkablsdasdas',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: "Mobile App Developer",
          compName: "Rax-Tech",
          duration: "Aug 2020 - Jun 2022",
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, qerjqwjqwiojeqwjeq ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere. asdhasjdhajhdajasbdjbasjkdasjkbldjkabsdjkablsdasdas',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: "Android Developer",
          compName: "Techno Kryon",
          duration: "Nov 2019 - Mar 2020",
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, qerjqwjqwiojeqwjeq ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere. asdhasjdhajhdajasbdjbasjkdasjkbldjkabsdjkablsdasdas',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.5,
                      child: Text(
                        'sample test about the work statuary and atmosphere, ',
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ];

    return Container(
      height: AppClass().getMqHeight(context) - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ''' Where I've Worked''',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Consumer(builder: (context, ref, child) {
            var data = ref.watch(selectedExpProvider);
            return Container(
              width: AppClass().getMqWidth(context),
              margin: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 0
                                    ? AppColors().cardColor
                                    : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 0
                                            ? AppColors().neonColor
                                            : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Netaccess',
                              style: TextStyle(
                                  color: data == 0
                                      ? AppColors().neonColor
                                      : AppColors().textLight,
                                  height: 1.5,
                                  fontSize: 11,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 1;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 1
                                    ? AppColors().cardColor
                                    : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 1
                                            ? AppColors().neonColor
                                            : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Rax-Tech',
                              style: TextStyle(
                                  color: data == 1
                                      ? AppColors().neonColor
                                      : AppColors().textLight,
                                  height: 1.5,
                                  fontSize: 11,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 2;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 2
                                    ? AppColors().cardColor
                                    : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 2
                                            ? AppColors().neonColor
                                            : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Techno Kryon',
                              style: TextStyle(
                                  color: data == 2
                                      ? AppColors().neonColor
                                      : AppColors().textLight,
                                  height: 1.5,
                                  fontSize: 11,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: experienceList[data].desig,
                              style: GoogleFonts.roboto(
                                  color: AppColors().textColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' @${experienceList[data].compName}',
                                  style: GoogleFonts.roboto(
                                      color: AppColors().neonColor,
                                      fontSize: 18),
                                )
                              ]),
                        ),
                        Text(
                          experienceList[data].duration.toString(),
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'sfmono'),
                        ),
                        experienceList[data].points!
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
