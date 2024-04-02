import 'dart:math';

import 'package:destin/InterviewPages/Interview.dart';
import 'package:destin/InterviewPages/Interview_details_Page.dart';
import 'package:destin/InterviewPages/Start_interview.dart';
import 'package:flutter/material.dart';

String UserName = "";
String pic = '';
late String UserID;

Color Kquizlinecolor = const Color.fromARGB(255, 219, 219, 219);
Color Kdestinxblack = const Color.fromARGB(255, 29, 29, 29);
Color Kdestinxorange = const Color.fromARGB(255, 255, 97, 24);
Color Kbackgroundcolor = const Color.fromARGB(255, 29, 29, 29);
Color Ksidebarcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kdestinxwhite = const Color.fromARGB(255, 255, 255, 255);
Color Kblacktextcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kgreycolor_dark = const Color.fromARGB(255, 161, 161, 161);
Color Kgreycolor_light = const Color.fromARGB(255, 242, 246, 249);
Color Kgreylinecolor = const Color.fromARGB(255, 194, 194, 194);
Color Kgreytextcolor = const Color.fromARGB(255, 186, 171, 171);
Color Kprogressbarbackgroundcolor = const Color.fromARGB(255, 230, 230, 230);
TextStyle Ktitletextstyle = const TextStyle(
    fontFamily: "Inter", fontSize: 30, fontWeight: FontWeight.bold);
TextStyle Kcommontextstyle = const TextStyle(
    fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w500);
TextStyle Kresumetextstyle = const TextStyle(
    fontFamily: "Inter",
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(255, 68, 68, 68));
TextStyle Kprogressbarnumber = const TextStyle(
    fontFamily: "Inter",
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
TextStyle Kreporttextstyle = const TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 15);
TextStyle Kquizcattext = const TextStyle(
    fontFamily: "Inter",
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 92, 92, 92));
//profile image for the user
//picking the image from the file using the some modules

BorderRadius KMyborder = BorderRadius.circular(10);

//GENERATING REANDOWM ELEMEWNT FROM THE ORIGINAL LIST TO NEW LIST
List<String> randomElementsList(List<String> inputList) {
  final random = Random();
  final shuffledList = inputList.toList()..shuffle(random); // Shuffle the list
  final uniqueElements = <String>{}; // Set to store unique elements

  // Add elements to the set until it has 10 unique elements or the list is exhausted
  for (var element in shuffledList) {
    if (uniqueElements.length < 8) {
      uniqueElements.add(element);
    } else {
      break; // No need to continue if we already have 10 unique elements
    }
  }
  print(uniqueElements.toList());
  return uniqueElements.toList(); // Convert the set back to a list
}

class ErrorDialog extends StatelessWidget {
  final String title;
  final String content;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Kdestinxwhite,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('OK'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'This page is under construction',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      );
    },
  );
}

//this dialogue box is shown when the ppl exit the interview in the middle of the interview
void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "On going interview",
          style: TextStyle(color: Colors.red),
        ),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to leave this interview in the middle?",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              next_button_live = true;
              question_increment = 0;

              Navigator.of(context).pop();
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Interview())); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Text('Yes'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}

List<List<dynamic>> nestedList(BuildContext context) {
  return [
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Technology.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Technology",
                        catid: 1,
                        maintext: "TechInterview",
                        imagepath:
                            "assets/Page_assets/technology_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_tech.png",
                        context_text:
                            'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.')));
          }),
      'technology'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Management.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Management",
                        catid: 1,
                        maintext: "Management",
                        imagepath:
                            "assets/Page_assets/management_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_management.png",
                        context_text:
                            'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow')));
          }),
      'management'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Design.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Design",
                        catid: 1,
                        maintext: "Design",
                        imagepath: "assets/Page_assets/design_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_design.png",
                        context_text:
                            "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
          }),
      'design'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_HR.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "HR",
                        catid: 1,
                        maintext: "HR Interview",
                        imagepath: "assets/Page_assets/hr_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_hr.png",
                        context_text:
                            "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
          }),
      'hrinterview'
    ],
  ];
}

class ImageFeaturesButton extends StatelessWidget {
  late String imagepath;
  late Function() operation;
  ImageFeaturesButton({
    super.key,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: operation, child: Image.asset(imagepath, height: 145));
  }
}
