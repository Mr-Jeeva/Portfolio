import 'package:flutter/cupertino.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/contact/contactMobile.dart';
import 'package:portfolio/view/contact/contactTab.dart';
import 'package:portfolio/view/contact/contactWeb.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ContactWeb(),
      tabView: ContactTab(),
      mobileView: ContactMobile(),
    );
  }
}
