import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'Interview.dart';
import 'constants.dart';
import  "loadingscreen.dart";

double screenWidth = 0;
int currentIndex = 0;
final List<String> question = [
  "tell me about yourself",
  "something",
  "something question"
];
final List<String> answer = [
  "I'm a recent graduate with a degree in computer science. During my studies, I focused on software development and completed a couple of internships. I enjoy coding and problem-solving. In my free time, I like to explore new technologies and work on small coding projects",
  "something answer",
  "something asnwer 2"
];
final List<String> feedback = [
  "The answer provides a concise overview of your educational background, interests, and experiences. To enhance it, consider incorporating specific achievements or projects from your internships to showcase practical skills. Additionally, mentioning how your skills align with the position you're applying for can make the response more tailored and impactful.",
  "feedback1",
  "feedback2"
];

class Report extends StatefulWidget {
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        title:Text("report",style:Ktitletextstyle),
        backgroundColor: Kmainboard,

      ),

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Kbackgroundcolor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(size: 22),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Interview()));
                } else if (currentIndex == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoadingPage()));
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
        ),



        backgroundColor: Kbackgroundcolor,
        body: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                decoration:
                    BoxDecoration(color: Kmainboard, borderRadius: KMyborder),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Kmainboard),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (screenWidth > 850)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 50),
                                      Expanded(
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/image_assets/reportpage_image.png"))),
                                      SizedBox(width: 50),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 500,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 40,
                                                left: 40,
                                                top: 10,
                                                bottom: 10),
                                            child: Text(
                                              "Thank you for your participation in the interview. It was a pleasure meeting with you and discussing your skills and experiences. Your insights and enthusiasm for the position were greatly appreciated",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                SizedBox(
                                  height: 30,
                                ),
                                if (screenWidth > 850)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, bottom: 30),
                                    child: Text(
                                      "Overall analysis",
                                      style: Ktitletextstyle,
                                    ),
                                  ),
                                if (screenWidth > 850)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            130, 10, 15, 10),
                                        child: percentage_indicator(
                                            percentage: 0.4,
                                            color: Colors.green,
                                            text: "4/10"),
                                      ),
                                      Expanded(
                                        child: Container(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 30,
                                              right: 30),
                                          child: Text(
                                            "Beginning with a score of 4 out of 10, there are clear areas for improvement. Reflect on the feedback and target specific aspects for enhanced future performance. Dedication and focused effort will lead to progress.",
                                            style: Kreporttextstyle,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                if (screenWidth > 850) SizedBox(height: 30),
                                if (screenWidth > 850)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, bottom: 30),
                                    child: Text(
                                      "Details",
                                      style: Ktitletextstyle,
                                    ),
                                  ),
                                if (screenWidth > 850)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                percentage_indicator(
                                                    percentage: 0.8,
                                                    color: Colors.orange,
                                                    text: "8/10"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                  child: Text("Confidence",
                                                      style:
                                                          Kcommontextstyle),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                percentage_indicator(
                                                    percentage: 0.4,
                                                    color:
                                                        const Color.fromARGB(
                                                            255,
                                                            218,
                                                            92,
                                                            241),
                                                    text: "4/10"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                  child: Text("TBD",
                                                      style:
                                                          Kcommontextstyle),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                percentage_indicator(
                                                    percentage: 0.6,
                                                    color:
                                                        const Color.fromARGB(
                                                            255,
                                                            255,
                                                            216,
                                                            59),
                                                    text: "6/10"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 5,
                                                          left: 5,
                                                          right: 5),
                                                  child: Text("Fluency",
                                                      style:
                                                          Kcommontextstyle),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                /*Expanded(
                                child: ListView.builder(
                                  itemCount: question.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(question[index], style: Kcommontextstyle),
                                          SizedBox(height: 5),
                                          Text(answer[index], style: Kcommontextstyle),
                                          SizedBox(height: 5),
                                          Text("FEEDBACK", style: Kcommontextstyle),
                                          SizedBox(height: 5),
                                          Text(feedback[index], style: Kcommontextstyle),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),*/
        
                                //IF THE SCREEN WIDTH IS LESSER THAN THE GIVEN VALUE THEN THIS WILL GET EXECUTED
                                if (screenWidth < 850)
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 30),
                                      Image(
                                          image: AssetImage(
                                              "assets/image_assets/reportpage_image.png")),
        
                                      Container(
                                        height: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 22,
                                              right: 22),
                                          child: Text(
                                            "Thank you for your participation in the interview. It was a pleasure meeting with you and discussing your skills and experiences. Your insights and enthusiasm for the position were greatly appreciated",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Overall analysis",
                                        style: Ktitletextstyle,
                                      ),
        
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30),
                                        child: percentage_indicator(
                                            percentage: 0.4,
                                            color: Colors.green,
                                            text: "4/10"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Beginning with a score of 4 out of 10, there are clear areas for improvement. Reflect on the feedback and target specific aspects for enhanced future performance. Dedication and focused effort will lead to progress.",
                                          style: Kreporttextstyle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      //CONFIDENCE
                                      SizedBox(height: 30),
                                      Center(
                                          child: Text(
                                        "Details",
                                        style: Ktitletextstyle,
                                      )),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 5, 10),
                                        child: percentage_indicator(
                                            percentage: 0.8,
                                            color: Colors.orange,
                                            text: "8/10"),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Confidence",
                                          style: Kcommontextstyle),
        
                                      //TBD
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 5, 10),
                                        child: percentage_indicator(
                                            percentage: 0.4,
                                            color: const Color.fromARGB(
                                                255, 218, 92, 241),
                                            text: "4/10"),
                                      ),
                                      SizedBox(height: 10),
                                      Text("TBD", style: Kcommontextstyle),
        
                                      //FLUENCY
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 5, 10),
                                        child: percentage_indicator(
                                            percentage: 0.6,
                                            color: const Color.fromARGB(
                                                255, 255, 216, 59),
                                            text: "6/10"),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Fluency",
                                          style: Kcommontextstyle),
                                    ],
                                  ),
        
                                /*Container(
                              width:double.infinity,
                              height:2000,
                              
                              child: ListView.builder(
                              itemCount: question.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom:15,top:15),
                                  child: Container(
                                    color: Kgreycolor_light,
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(question[index], style: TextStyle(fontFamily: "Inter", fontSize: 25, fontWeight: FontWeight.w600)),
                                        SizedBox(height: 10),
                                        Text(answer[index], style: Kcommontextstyle),
                                        SizedBox(height: 20),
                                        Text("FEEDBACK", style: TextStyle(fontFamily: "Inter", fontSize: 25, fontWeight: FontWeight.w600)),
                                        SizedBox(height: 10),
                                        Text(feedback[index], style: Kcommontextstyle),
                                      ],
                                    ),
                                  ),
                                );
                              },
                                                          ),
                            ),*/
                                for (int i = 0; i < question.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 15),
                                    child: Container(
                                      width: double.infinity,
                                      color: Kgreycolor_light,
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(question[i],
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.w600)),
                                          SizedBox(height: 10),
                                          Text(answer[i],
                                              style: Kcommontextstyle),
                                          SizedBox(height: 20),
                                          Text("FEEDBACK",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.w600)),
                                          SizedBox(height: 10),
                                          Text(feedback[i],
                                              style: Kcommontextstyle),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
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
      radius: 100.0,
      lineWidth: 25.0,
      percent: percentage, //parameter should be adde in the class call
      center: new Text(
        text,
        style: Kprogressbarnumber,
      ),
      progressColor: color,
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Kprogressbarbackgroundcolor,
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
  FeaturesButton({
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
              stops: [0.0, 1.0],
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
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Text(maintext,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 255, 255, 255))),
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
/*return Padding(
                                         padding: const EdgeInsets.only(bottom: 15, top: 15),
                                         child: Container(
                                           color: Kgreycolor_light,
                                           padding: const EdgeInsets.all(10.0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 question[index],
                                                 style: TextStyle(
                                                   fontFamily: "Inter",
                                                   fontSize: 25,
                                                   fontWeight: FontWeight.w600,
                                                 ),
                                               ),
                                               SizedBox(height: 10),
                                               Text(
                                                 answer[index],
                                                 style: Kcommontextstyle,
                                               ),
                                               SizedBox(height: 20),
                                               Text(
                                                 "FEEDBACK",
                                                 style: TextStyle(
                                                   fontFamily: "Inter",
                                                   fontSize: 25,
                                                   fontWeight: FontWeight.w600,
                                                 ),
                                               ),
                                               SizedBox(height: 10),
                                               Text(
                                                 feedback[index],
                                                 style: Kcommontextstyle,
                                               ),
                                             ],
                                           ),
                                         ),
                                       );*/

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
