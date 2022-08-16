import 'package:flutter/material.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';

class ActionBar extends StatefulWidget with PreferredSizeWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  State<ActionBar> createState() => _ActionBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.only(right: 55.0, top: 33.0),
        child: () {
          ScreenType scrType = AppClass().getScreenType(context);
          if (scrType == ScreenType.mobile || scrType == ScreenType.tab) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded, size: 25))
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(scrType.name),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Text("01. ",
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                      Text("About",
                          style: TextStyle(
                              color: AppColors().textColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Text("02. ",
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                      Text("Experience",
                          style: TextStyle(
                              color: AppColors().textColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Text("03. ",
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                      Text("Work",
                          style: TextStyle(
                              color: AppColors().textColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Text("04.",
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 13,
                              fontFamily: 'sfmono')),
                      Text("Contact",
                          style: TextStyle(
                              color: AppColors().textColor, fontSize: 13)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      border:
                          Border.all(color: AppColors().neonColor, width: 1.5)),
                  child: Center(
                    child: Text('Resume',
                        style: TextStyle(
                            color: AppColors().neonColor,
                            fontSize: 13,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sfmono')),
                  ),
                ),
              )
            ],
          );
        }());
  }
}
