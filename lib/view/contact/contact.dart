import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/contact/contactMobile.dart';
import 'package:portfolio/view/contact/contactTab.dart';
import 'package:portfolio/view/contact/contactWeb.dart';

import '../../resource/colors.dart';

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

showMessageDialog(context) {
  showDialog(context: context, builder: (_) => AlertDialog(
    backgroundColor: AppColors().primaryColor,
    title: Text('Ping Me !'),
    content: Container(
      color: AppColors().primaryColor,
      width: AppClass().getMqWidth(context) * 0.5,
      height: AppClass().getMqHeight(context) * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
               hintText: 'Your Name*',
               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
               border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Your Contact Info',
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Your Message*',
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: AppClass().getMqHeight(context) * 0.06,
                      width: AppClass().getMqWidth(context) * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          border: Border.all(
                              color: AppColors().neonColor, width: 1.5)),
                      child: Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                color: AppColors().neonColor,
                                fontSize: 13,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sfmono')),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: AppClass().getMqHeight(context) * 0.06,
                      width: AppClass().getMqWidth(context) * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          border: Border.all(
                              color: AppColors().neonColor, width: 1.5)),
                      child: Center(
                        child: Text('Send',
                            style: TextStyle(
                                color: AppColors().neonColor,
                                fontSize: 13,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sfmono')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}
