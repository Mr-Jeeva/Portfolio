import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/appClass.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (c, i) => getWorkItem(),
        itemCount: 6,
        shrinkWrap: true,
      ),
    );
  }

  getWorkItem() {
    return Container(
      color: Colors.yellow,
      width: AppClass().getMqWidth(context) * 0.05,
      height: AppClass().getMqHeight(context) * 0.05,
    );
  }
}
