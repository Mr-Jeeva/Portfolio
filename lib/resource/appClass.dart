import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/models.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';


enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "SafeC19",
        projectContent:
            "A fully automatic temperature and face mask detection solution for a completely contactless hand sanitizer. A solution so unique that it has integrated door access control if monitoring parameters are normal. An image is still captured and uploaded in cloud server on its own, as reference for auditing.",
        tech1: "Android",
        tech2: "Google-ML",
        tech3: "Java"),
    WorkModel(
        projectTitle: "Hermarts",
        projectContent:
            "Hermarts is an Ecommerce website/mobile application specially designed to encourage and takeout the hidden talent of women candidates, who never gets opportunities to explore their talents. It is developed with user-centric features to help the users with integrated InApp payment mode with high level security.",
        tech1: "Android",
        tech2: "RazorPay"),
    WorkModel(
        projectTitle: "WT-IoT",
        projectContent:
            '''It’s a water treatment process controller which can control all the sensors, calibration process, and staff management.''',
        tech1: "Android",
        tech2: "TCP",
        tech3: "API"),
    WorkModel(
        projectTitle: "AutoStabilizer",
        projectContent:
            '''It is used to connect to a stabilizer and read the inlet and outlet voltage and several other parameters of the Stabilizer. This application will also set up the stabilizer hardware to connect the stabilizer to the Wi-Fi network. And with some features like PIR Sensor, Control Stabilizer with schedule, Standby Mode, Control Stabilizer with MobileData via AWS, and With WiFi via TCP Connection.''',
        tech1: "Android",
        tech2: "MQTT"),
    WorkModel(
        projectTitle: "PAT",
        projectContent:
            '''This application is to store and record the data of tested production product information for future reference. This application can reduce the time and ensure the performance and quality of the QA/QC people. This application let the super admin to track the workers and their performance. Through this application, we can calculate the time spent on every test that was taken to complete by the worker.''',
        tech1: "Flutter",
        tech2: "NodeJs",
        tech3: "Flutter-Windows"),
    WorkModel(
        projectTitle: "AVM",
        projectContent:
            '''AVM - Automatic Vending Machine is one of Pradeep's stainless steel product. The project is aimed at automating the beverage vending process. It can be done through hardware that controls the main engines and a mobile app (which acts like a PCB display for the unit) that is used to personalize and make beverage. It can also perform several process like Brewing, Boiling,cleansing drum etc . The Engines (hardware) and Mobiel Application communicate using Bluetooth.''',
        tech1: "Android",
        tech2: "Tablet"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url, body: {
      "name": name,
      "contactInfo": contact,
      "message": msg
    }).timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
