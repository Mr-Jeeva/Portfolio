import 'package:flutter/foundation.dart';
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
  final nameController = TextEditingController();
  final contactInfoController = TextEditingController();
  final msgController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  showDialog(context: context, builder: (_) => AlertDialog(
    backgroundColor: AppColors().primaryColor,
    titleTextStyle: TextStyle(
        color: AppColors().neonColor,
        fontSize: 18,
        fontFamily: 'sfmono'),
    title: Text('Contact Me!'),
    content: Container(
      color: AppColors().primaryColor,
      width: AppClass().getMqWidth(context) * 0.5,
      height: AppClass().getMqHeight(context) * 0.7,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Let me know your name (or just enter anonymous)';
                }
                return null;
              },
              decoration: InputDecoration(
                 hintText: 'Name*',
                 errorStyle: TextStyle(color: AppColors().neonColor),
                 errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors().neonColor)),
                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                 border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: contactInfoController,
                decoration: InputDecoration(
                  hintText: 'Contact Info (Optional)',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: msgController,
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Seriously? you want to send a blank message to me :(';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Message*',
                  errorStyle: TextStyle(color: AppColors().neonColor),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors().neonColor)),
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
                    padding: EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          AppClass().sendEmail(nameController.text, contactInfoController.text, msgController.text).then((value) {
                            if(value) {
                              Navigator.pop(context);
                              AppClass().showSnackBar('Message sent successfully', context: context);
                            } else {
                              Navigator.pop(context);
                              AppClass().showSnackBar('Failed to send message, please try again later.', context: context);
                            }
                          }).onError((error, stackTrace) {
                            Navigator.pop(context);
                            AppClass().showSnackBar('Error Occurred', context: context);
                          });
                        }
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
    ),
  ));
}
