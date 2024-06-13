import 'dart:math';

import 'package:destin/Constants/firebasefunctions.dart';
import 'package:destin/Widgets/Stack_widgets.dart';
import 'package:destin/main.dart';
import 'package:flutter/material.dart';

import "InterviewPages/Interview.dart";
import "InterviewPages/Interview_details_Page.dart";
import "InterviewPages/Start_interview.dart";
bool fetched_details = false;
String UserName = '';
String Dob = '';
String Intro = '';
String Skills = '';
String Language = '';
String Experience = '';
String Education = '';
String Phone = '';
String Email = '';

String pic = '';
String UserID = '';

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
    fontFamily: "Poppins", fontSize: 30, fontWeight: FontWeight.w700);
TextStyle Kinterviewtypetextstyle = const TextStyle(
    fontFamily: "poppins", fontSize: 23, fontWeight: FontWeight.w500);
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
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 15);
TextStyle Kquizcattext = const TextStyle(
    fontFamily: "Inter",
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 92, 92, 92));

TextStyle Kreporttitletext = const TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins');
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
    // [

    //   ImageFeaturesButton(
    //       imagepath: "assets/Page_assets/Start_Interview_Technology.png",
    //       operation: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (BuildContext context) => const Interview_details_Page(
    //                     type: "Technology",
    //                     catid: 1,
    //                     maintext: "TechInterview",
    //                     imagepath:
    //                         "assets/Page_assets/technology_page_main.png",
    //                     appbarimage: "assets/Page_assets/appbar_tech.png",
    //                     context_text:
    //                         'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.')));
    //       }),
    //   'technology'
    // ],
    // [
    //   ImageFeaturesButton(
    //       imagepath: "assets/Page_assets/Start_Interview_Management.png",
    //       operation: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (BuildContext context) => const Interview_details_Page(
    //                     type: "Management",
    //                     catid: 1,
    //                     maintext: "Management",
    //                     imagepath:
    //                         "assets/Page_assets/management_page_main.png",
    //                     appbarimage: "assets/Page_assets/appbar_management.png",
    //                     context_text:
    //                         'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow')));
    //       }),
    //   'management'
    // ],
    // [
    //   ImageFeaturesButton(
    //       imagepath: "assets/Page_assets/Start_Interview_Design.png",
    //       operation: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (BuildContext context) => const Interview_details_Page(
    //                     type: "Design",
    //                     catid: 1,
    //                     maintext: "Design",
    //                     imagepath: "assets/Page_assets/design_page_main.png",
    //                     appbarimage: "assets/Page_assets/appbar_design.png",
    //                     context_text:
    //                         "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
    //       }),
    //   'design'
    // ],
    // [
    //   ImageFeaturesButton(
    //       imagepath: "assets/Page_assets/Start_Interview_HR.png",
    //       operation: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (BuildContext context) => const Interview_details_Page(
    //                     type: "HR",
    //                     catid: 1,
    //                     maintext: "HR Interview",
    //                     imagepath: "assets/Page_assets/hr_page_main.png",
    //                     appbarimage: "assets/Page_assets/appbar_hr.png",
    //                     context_text:
    //                         "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
    //       }),
    //   'hrinterview'
    // ],
    [
      StackWidgets(
          containerHeight: 100,
          containerWidth: double.infinity,
          stackImage: "assets/InterviewPage_stack_image/tech_robo.png",
          waterMarkImage:
              "assets/InterviewPage_stack_image/tech_robo_watermark.png",
          stackImageSize: 3.8,
          stackImageTop: 0,
          stackImageLeft: 190,
          watermarkTop: 0,
          watermarkLeft: 20,
          text1: "Start your Interview",
          text2: "Technology",
          text1Style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Inter"),
          text2Style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          containerColor: const Color.fromARGB(255, 236, 255, 241),
          borderRadius: 20,
          ontapp: () {
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
          },
          text_left: 30),
      'technology'
    ],
    [
      StackWidgets(
          containerHeight: 100,
          containerWidth: double.infinity,
          stackImage: "assets/InterviewPage_stack_image/management.png",
          waterMarkImage:
              "assets/InterviewPage_stack_image/management_watermark.png",
          stackImageSize: 3.8,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "Management",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 240 ,208 ,255),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Management",
                                catid: 1,
                                maintext: "ManagementInterview",
                                imagepath:
                                "assets/Page_assets/management_page_main.png",
                                appbarimage: "assets/Page_assets/appbar_management.png",
                                context_text:
                                    'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow')));
                     },
                     
                      text_left: 30),'management'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/designer.png",
         waterMarkImage: "assets/InterviewPage_stack_image/designer_watermark.png",
          stackImageSize: 3.8,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "Design",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 255 ,209 ,209),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Design",
                                catid: 1,
                                maintext: "DesignInterview",
                                imagepath:
                                "assets/Page_assets/design_page_main.png",
                                appbarimage: "assets/Page_assets/appbar_design.png",
                                context_text:
                                    "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
                     },
                     
                      text_left: 30),'design'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/hr.png",
         waterMarkImage: "assets/InterviewPage_stack_image/hr_watermark.png",
          stackImageSize: 3.8,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "HR Interview",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 253 ,240 ,205),
                    borderRadius: 20,
                     ontapp: (){
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
                            },
                     
                      text_left: 30),'hr interview'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/python.png",
         waterMarkImage: "assets/InterviewPage_stack_image/python_watermark.png",
          stackImageSize: 4,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "Python",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 233 ,245 ,255),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Python",
                                catid: 1,
                                maintext: "Python Interview",
                                
                                imagepath: "assets/Page_assets/python_main_page.png",
                                appbarimage: "assets/Page_assets/appbar_python.png",
                                context_text:
                                    "Elevate your Python interviews with our state-of-the-art AI interview application! Integrate a diverse range of Python inquiries, hands-on coding exercises, and deep dives into Pythonic principles to holistically evaluate candidates' Python expertise. Redefine your recruitment strategy to align with the dynamic landscape of Python development.")));
                            },
                     
                      text_left: 30),'python'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/java.png",
         waterMarkImage: "assets/InterviewPage_stack_image/java_watermark.png",
          stackImageSize: 4,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "Java",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 196 ,195 ,254),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Java",
                                catid: 1,
                                maintext: "Java Interview",
                                
                                imagepath: "assets/Page_assets/java_page_main.png",
                                appbarimage: "assets/Page_assets/appbar_java.png",
                                context_text:
                                    "Transform your Java interviews with our cutting-edge AI interview platform! Seamlessly blend fundamental Java questions, advanced coding challenges, and in-depth discussions on Java concepts to comprehensively evaluate candidates' proficiency. Elevate your hiring process to embrace a future driven by robust Java solutions.")));
                            },
                     
                      text_left: 30),'java'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/web.png",
         waterMarkImage: "assets/InterviewPage_stack_image/web_watermark.png",
          stackImageSize: 4,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "Web Dev",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 252 ,217 ,223),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Web",
                                catid: 1,
                                maintext: "Web Interview",
                                
                                imagepath: "assets/Page_assets/web_page_main.png",
                                appbarimage: "assets/Page_assets/appbar_web.png",
                                context_text:
                                    "Modernize your web dev interviews with our AI tool! Merge tech questions, coding projects, and trend discussions to assess capabilities. Shape hiring to reflect web dev's evolution.")));
                            },
                     
                      text_left: 30),'web'
    ],
    [
      StackWidgets(containerHeight: 100,
       containerWidth: double.infinity,
        stackImage: "assets/InterviewPage_stack_image/oops.png",
         waterMarkImage: "assets/InterviewPage_stack_image/oops_watermark.png",
          stackImageSize: 4,
           stackImageTop: 0,
            stackImageLeft: 190,
             watermarkTop: 0,
              watermarkLeft: 20,
               text1: "Start your Interview",
                text2: "OOPS",
                 text1Style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   containerColor: Color.fromARGB(255, 255 ,252 ,252),
                    borderRadius: 20,
                     ontapp: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Interview_details_Page(
                                type: "Oops",
                                catid: 1,
                                maintext: "Oops Interview",
                                
                                imagepath: "assets/Page_assets/oops_page_main.png",
                                appbarimage: "assets/Page_assets/appbar_oops.png",
                                context_text:
                                    "Transform OOP interviews with our AI platform! Use varied questions, coding tasks, and architecture discussions to assess. Redefine hiring for stronger OOP solutions.")));
                            },
                     
                      text_left: 30),'oops'
    ],
    [
      const SizedBox(
        width: double.infinity,
        height: 0,
      ),
      'dummy'
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

Future<String> setdetails() async {
  UserID = prefs!.getString("email").toString();
  //getthe username
  UserName = await getUserName(UserID);
  pic = await getUrlFromUserDocument("ProfilePic");
  print("=========================");
  print("=========================");
  print("=========================");
  print("=========================");
  print("=========================");
  print("=========================");
  print("=========================");
  print(pic);
  Future.delayed(const Duration(seconds: 2));
  return pic;
}
