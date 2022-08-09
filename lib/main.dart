import 'package:flutter/material.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/root.dart';

void main() {
  runApp(const AppTheme());
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PORTFOLIO',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors().primaryColor,
      ),
      home: const RootScreen(),
    );
  }
}
