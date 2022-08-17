import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/appClass.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context),
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "08/17/2022",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
