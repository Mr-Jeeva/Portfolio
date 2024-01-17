import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../resource/colors.dart';
import '../../resource/strings.dart';
import 'contact.dart';

class ContactMobile extends ConsumerStatefulWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends ConsumerState<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context) - 70,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '''04.''',
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 12,
                              fontFamily: 'sfmono'),
                        ),
                        Text(
                          ''' What's next?''',
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 14,
                              fontFamily: 'sfmono'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Get In Touch',
                        style: GoogleFonts.robotoSlab(
                          color: AppColors().textColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: AppClass().getMqWidth(context) * 0.8,
                        child: Text(
                          Strings.endTxt,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 70),
                      child: InkWell(
                        onTap: () {
                          showMessageDialog(context);
                        },
                        child: Container(
                          height: AppClass().getMqHeight(context) * 0.07,
                          width: AppClass().getMqWidth(context) * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(3.0)),
                              border: Border.all(
                                  color: AppColors().neonColor, width: 1.5)),
                          child: Center(
                            child: Text('Say Hello!',
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 10,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sfmono')),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '''Built & Developed by Jeevanandham''',
                style: TextStyle(
                    color: AppColors().textColor,
                    fontSize: 12,
                    fontFamily: 'sfmono'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''ref - Britney C''',
                  style: TextStyle(
                      color: AppColors().neonColor,
                      fontSize: 12,
                      fontFamily: 'sfmono'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  showMessageDialog(context) {
    final nameController = TextEditingController();
    final contactInfoController = TextEditingController();
    final msgController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors().primaryColor,
          insetPadding: EdgeInsets.only(left: 15.0, right: 15.0),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          title: Row(
            children: [
              Expanded(flex: 9, child: Text('Contact Me!')),
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: AppColors().textColor))
            ],
          ),
          content: Consumer(
              builder: (context, ref, child) {
                bool isLoading = ref.watch(progressProvider);
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      color: AppColors().primaryColor,
                      width: AppClass().getMqWidth(context),
                      height: AppClass().getMqHeight(context) * 0.6,
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
                                          ref.read(progressProvider.notifier).state = true;
                                          AppClass().sendEmail(nameController.text, contactInfoController.text, msgController.text).then((value) {
                                            if(value) {
                                              Navigator.pop(context);
                                              AppClass().showSnackBar('Message sent successfully', context: context);
                                            } else {
                                              Navigator.pop(context);
                                              AppClass().showSnackBar('Failed to send message, please try again later.', context: context);
                                            }
                                            ref.read(progressProvider.notifier).state = false;
                                          }).onError((error, stackTrace) {
                                            Navigator.pop(context);
                                            AppClass().showSnackBar('Error Occurred', context: context);
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppClass().getMqHeight(context) * 0.06,
                                        width: AppClass().getMqWidth(context) * 0.35,
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
                    Visibility(
                      visible: isLoading,
                      child: Container(
                          width: AppClass().getMqWidth(context) * 0.5,
                          height: AppClass().getMqHeight(context) * 0.7,
                          color: Colors.transparent,
                          child: Center(child: CircularProgressIndicator(color: AppColors().neonColor))),
                    ),
                  ],
                );
              }
          ),
        )
    );
  }
}
