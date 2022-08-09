import 'package:flutter/material.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/resource/styles.dart';

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
    return AppBar(
      backgroundColor: AppColors().primaryColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("About", style: TxtStyle().appBarText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("Experience", style: TxtStyle().appBarText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("Work", style: TxtStyle().appBarText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("Contact", style: TxtStyle().appBarText),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  side: BorderSide(color: AppColors().neonColor, width: 25))),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text('Resume', style: TxtStyle().neonText),
            ),
          )
        ],
      ),
    );
  }
}
