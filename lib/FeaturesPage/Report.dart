
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';

import '../constants.dart';

double screenWidth = 0;
int currentIndex = 0;
var response;
//final List<String> question = [];
//final List<String> answer = [];
//create a map of string and string
//Map<dynamic, dynamic> dataMap = {};
/*final List<String> question = [
  "tell me about yourself",
  "something",
  "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "something question"
      "sog question"
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
];*/

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
    fetchData();
    print(ans);
    print(que);

  }
  Future<void> fetchData() async {
    print("hi");
  var url = 'https://modeldeploy-prgrybkmta-el.a.run.app/submit';
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {
    'Question1': 'What is Object-Oriented Programming (OOP)?',
    'Answer1':
        'Object-Oriented Programming (OOP) is a programming paradigm based on the concept of objects, which can contain data in the form of fields and code in the form of procedures. It allows for the organization of code into reusable components and promotes concepts such as encapsulation, inheritance, and polymorphism.',
    'Question2':
        'Explain the difference between abstract class and interface in Java.',
    'Answer2':
        'An abstract class in Java is a class that cannot be instantiated and may contain abstract methods, concrete methods, or both. It can also have instance variables. An interface, on the other hand, is a reference type similar to a class but can only contain abstract methods, constants, and default methods. Classes can implement multiple interfaces but can only inherit from one abstract class.',
    'Question3': 'What is the significance of the keyword "static" in Java?',
    'Answer3':
        'In Java, the "static" keyword is used to create variables and methods that belong to the class rather than instances of the class. Static variables are shared among all instances of the class, while static methods can be called without creating an instance of the class. Static methods cannot access non-static variables or methods directly.',
    'Question4': 'How does exception handling work in Java?',
    'Answer4':
        'Exception handling in Java allows programmers to handle errors and unexpected situations gracefully. It involves using try, catch, and finally blocks to handle exceptions. When an exception occurs within the try block, it is caught by the corresponding catch block, where appropriate actions can be taken. The finally block is used to execute code that should always run, regardless of whether an exception occurred.',
    'Question5': 'What is the difference between process and thread?',
    'Answer5':
        'In Java, a process is an independent unit of execution that has its own memory space and resources. It is managed by the operating system. On the other hand, a thread is a lightweight unit of execution within a process. Threads share the same memory space and resources as the process and can communicate with each other more efficiently than processes. Threads are managed by the Java Virtual Machine (JVM).',
    'Question6': 'Explain the concept of a database transaction.',
    'Answer6':
        'A database transaction is a unit of work performed against a database management system (DBMS) that is treated as a single, indivisible operation. It consists of one or more SQL statements that are executed as a single unit. The transaction ensures the atomicity, consistency, isolation, and durability (ACID) properties of the database. Transactions are used to maintain data integrity and recoverability in databases.',
    'Question7': 'What is RESTful web services?',
    'Answer7':
        'RESTful web services are a type of web service that adhere to the principles of Representational State Transfer (REST). They use standard HTTP methods such as GET, POST, PUT, DELETE to perform CRUD (Create, Read, Update, Delete) operations on resources. RESTful APIs are stateless, scalable, and platform-independent, making them ideal for building distributed systems and web applications.'
  };

  var response = await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Request successful, do something with the response.
    print('Response: ${response.body}');
  } else {
    // Request failed, handle error.
    print('Request failed with status: ${response.statusCode}');
  }
}


 /* Future<void> fetchData() async {
    try {
      print("getting in tot the function");
      // Make POST request
      final Uri uri = Uri.parse('https://modeldeploy-prgrybkmta-el.a.run.app');
      print("uri converted");
      final http.Response httpResponse = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: {
          "Question1": "How does the Observer pattern work?",
          "Answer1": "The Observer pattern defines a one-to-many dependency between objects, so that when one object changes state, all its dependents are notified and updated automatically. It is commonly used in event handling systems.",
          "Question2": "Explain the concept of Continuous Integration (CI) and Continuous Deployment (CD).",
          "Answer2": "CI is the practice of regularly integrating code changes into a shared repository, followed by automated tests to detect integration issues. CD extends CI by automatically deploying the code to production if all tests pass.",
          "Question3": "What is Object-Oriented Programming (OOP)?",
          "Answer3": "OOP is a programming paradigm that structures code into objects, enhancing modularity and reusability.",
          "Question4": "Explain the difference between abstract class and interface in Java.",
          "Answer4": "Abstract classes can have both abstract and concrete methods, while interfaces only have abstract methods. A class can implement multiple interfaces, but it can inherit from only one abstract class.",
          "Question5": "Explain the concept of polymorphism.",
          "Answer5": "Polymorphism in object-oriented programming allows objects of different types to be treated as objects of a common type. It encompasses method overloading and method overriding. Method overloading involves defining multiple methods with the same name but different parameters in a class, while method overriding occurs when a subclass provides a specific implementation for a method defined in its superclass.",
          "Question6":"Explain the difference between GET and POST HTTP methods.",
          "Answer6":"GET is used to request data from a specified resource, while POST is used to submit data to be processed to a specified resource. POST is more secure and suitable for sensitive data.",
          "Question7":"Explain the concept of Big O notation.",
          "Answer7":"Big O notation describes the upper bound on the time or space complexity of an algorithm in the worst-case scenario. It provides a way to analyze the efficiency of algorithms.",
        },
      );
      print("hi");
      // Check if request was successful
      print(httpResponse.statusCode);
      if (httpResponse.statusCode == 200) {
        setState(() {
          response = httpResponse.body;
          print("===============================================================");
          print("===============================================================");
          print("===============================================================");
          print("===============================================================");
          print(response);
          print("===============================================================");
          print("===============================================================");
          print("===============================================================");
          print("===============================================================");
        });
      } else {
        setState(() {
          response = 'Failed to fetch data';
        });
      }
    } catch (error) {
      setState(() {
        response = 'Error: $error';
      });
    }
  }*/

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


      backgroundColor: Kdestinxwhite,
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
                         
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 255, 97, 24),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Overall analysis", style: Ktitletextstyle),//changeable
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: percentage_indicator(
                                  percentage: 0.4,
                                  color: Colors.green,
                                  text: "4/10"),//changeable
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

                GestureDetector(
                  onTap: (){
                    fetchData();

                  },
                  child:Container(
                    decoration: BoxDecoration(color:Colors.orange),
                    child:Text("fetch the data"),
                  ),
                ),
                for (int i = 0; i < 3; i++)
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
                                "question",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Answer",
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
                                "feedback",
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