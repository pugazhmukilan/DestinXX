import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'constants.dart';

double screenWidth = 0;
int currentIndex = 0;
//final List<String> question = [];
//final List<String> answer = [];
//create a map of string and string
//Map<dynamic, dynamic> dataMap = {};
final List<String> question = [
  "tell me about yourself",
  "something",
  "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
];
final List<String> answer = [
  "I'm a recent graduate with a degree in computer science. During my studies, I focused on software development and completed a couple of internships. I enjoy coding and problem-solving. In my free time, I like to explore new technologies and work on small coding projects",
  "something answer",
  "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
      "something asnwer 2"
];
final List<String> feedback = [
  "The answer provides a concise overview of your educational background, interests, and experiences. To enhance it, consider incorporating specific achievements or projects from your internships to showcase practical skills. Additionally, mentioning how your skills align with the position you're applying for can make the response more tailored and impactful.",
  "feedback1",
  "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
      "feedback2"
];

class Report extends StatefulWidget {
  //late  Map<dynamic, dynamic> dataMap;
  List<String> que;
  List<String> ans;
  Report({super.key, required this.que, required this.ans});
  @override
  State<Report> createState() => _ReportState(que: que, ans: ans);
}

class _ReportState extends State<Report> {
  @override
  void initState() {
    super.initState();
    print(ans);
    print(que);
  }

  //late  Map<dynamic, dynamic> dataMap;
  List<String> ans;
  List<String> que;
  _ReportState({required this.ans, required this.que});
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed logic here
          },
          backgroundColor: Colors.black,
          splashColor: const Color.fromARGB(255, 91, 30, 1),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.download_outlined,
            color: Color.fromARGB(255, 255, 97, 24),
            size: 25,
          )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset("assets/logos/Mobile_LoginPageLogo.png", height: 43),
            Text("Report", style: Ktitletextstyle),
          ],
        ),
        backgroundColor: Colors.white,
      ),

      /*bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Kbackgroundcolor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(size: 22),
          items: const [
           
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Download Report"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined), label: "Resume"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Accounts"),
          ],
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(
              () {
                currentIndex = newIndex;
                print("index is equal to+++++++ $currentIndex");
                if (currentIndex == 0) {
                } else if (currentIndex == 1) {
                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Interview()));*/
                } else if (currentIndex == 2) {
                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoadingPage()));*/
                } else if (currentIndex == 3) {
                  //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                  _showBottomAlertDialog(context);
                }
              },
            );

            shape:
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            );
          },
        ),*/

      backgroundColor: Kmainboard,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/Page_assets/report_bg.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage(
                          "assets/image_assets/reportpage_image.png"),
                      height: 150,
                    ),
                    Expanded(
                      child: Container(
                        child: const Text(
                          "Thank you for your participation in the interview.Your insights and enthusiasm for the position were greatly appreciated",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          //color:const Color.fromARGB(7, 0, 0, 0),
                          //color: Color.fromARGB(255, 239, 254, 239),
                          //boxShadow: List.filled(3,BoxShadow(color: Color.fromARGB(60, 244, 67, 54),spreadRadius: 0.0,blurRadius: 10)),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 255, 97, 24),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Overall analysis", style: Ktitletextstyle),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: percentage_indicator(
                                  percentage: 0.4,
                                  color: Colors.green,
                                  text: "4/10"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Expanded(
                                child: Text(
                                  "Beginning with a score of 4 out of 10, there are clear areas for improvement. Reflect on the feedback and target specific aspects for enhanced future performance. Dedication and focused effort will lead to progress.",
                                  style: Kreporttextstyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 255, 240, 225),
                          //boxShadow: List.filled(3,BoxShadow(color: Color.fromARGB(60, 244, 67, 54),spreadRadius: 0.0,blurRadius: 10)),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 255, 97, 24),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              "Details",
                              style: Ktitletextstyle,
                            )),
                            const SizedBox(height: 15),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: percentage_indicator(
                                  percentage: 0.8,
                                  color: Colors.orange,
                                  text: "8/10"),
                            ),
                            const SizedBox(height: 10),
                            Text("Confidence", style: Kcommontextstyle),

                            //TBD
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: percentage_indicator(
                                  percentage: 0.4,
                                  color:
                                      Color.fromARGB(255, 218, 92, 241),
                                  text: "4/10"),
                            ),
                            const SizedBox(height: 10),
                            Text("TBD", style: Kcommontextstyle),

                            //FLUENCY
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: percentage_indicator(
                                  percentage: 0.6,
                                  color:
                                      Color.fromARGB(255, 255, 216, 59),
                                  text: "6/10"),
                            ),
                            const SizedBox(height: 10),
                            Text("Fluency", style: Kcommontextstyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/Page_assets/Question_analysis_bg.png")),
                            //color: Color.fromARGB(255, 255, 240, 225),
                            //boxShadow: List.filled(3,BoxShadow(color: Color.fromARGB(60, 244, 67, 54),spreadRadius: 0.0,blurRadius: 10)),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(0, 0, 0, 0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: Center(
                              child: Text(
                            "Question analysis",
                            style: Ktitletextstyle,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < 9; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 238, 227, 0.24),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 255, 97, 24),
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question[1],
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                answer[1],
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 255, 189, 159),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "FEEDBACK",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                feedback[1],
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class percentage_indicator extends StatelessWidget {
  final double percentage;
  final Color color;
  final String text;

  const percentage_indicator({
    super.key,
    required this.percentage,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 15.0,
      percent: percentage, //parameter should be adde in the class call
      center: Text(
        text,
        style: Kprogressbarnumber,
      ),
      progressColor: color,
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
    );
  }
}

// ignore: must_be_immutable

class FeaturesButton extends StatelessWidget {
  late Color startcolor;
  late Color endcolor;
  late String subtext;
  late String maintext;
  late String imagepath;
  late Function() operation;
  FeaturesButton({super.key, 
    required this.startcolor,
    required this.endcolor,
    required this.subtext,
    required this.maintext,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: operation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startcolor, endcolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          //content inside the container
          child: Padding(
            //giving padding to the whole row to maintain the text properly
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtext,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Text(maintext,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                //container image
                Image.asset(imagepath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.6),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'This page is under construction',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 205, 23)),
            ),
          ),
        ),
      );
    },
  );
}
