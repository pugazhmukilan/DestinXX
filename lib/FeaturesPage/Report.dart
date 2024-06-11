
import 'dart:ui';

import 'package:destin/FeaturesPage/Feedback_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constants.dart';

double screenWidth = 0;
int currentIndex = 0;
late Map<String, dynamic> result;
late double overallscore = 0.0;

class Report extends StatefulWidget {
  Map<String, dynamic> result;
  double overallscore;
  Report({super.key, required this.result, required this.overallscore});

  @override
  State<Report> createState() => _ReportState(result: result, overallscore: overallscore);
}

class _ReportState extends State<Report> {
  Map<String, dynamic> result;
  double overallscore;

  _ReportState({required this.result, required this.overallscore});

  @override
  void initState() {
    super.initState();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: PRINT FUNCTIONALITY
          //  _createPDF();
        },
        backgroundColor: Colors.black,
        splashColor: const Color.fromARGB(255, 91, 30, 1),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.download_outlined,
          color: Color.fromARGB(255, 255, 97, 24),
          size: 25,
        ),
      ),
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
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 255, 97, 24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Overall analysis", style: Kreporttitletext), //changeable
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: percentage_indicator(
                              percentage: overallscore,
                              color: Colors.green,
                              text: "${overallscore * 10}/10",
                            ), //changeable
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              generateFeedback(overallscore),
                              style: Kreporttextstyle,
                              textAlign: TextAlign.justify,
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
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 255, 97, 24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Details",
                              style: Kreporttitletext,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: percentage_indicator(
                              percentage: 0.8,
                              color: Colors.orange,
                              text: "8/10",
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Confidence", style: Kcommontextstyle),

                          //TBD
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: percentage_indicator(
                              percentage: 0.4,
                              color: Color.fromARGB(255, 218, 92, 241),
                              text: "4/10",
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("TBD", style: Kcommontextstyle),

                          //FLUENCY
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: percentage_indicator(
                              percentage: 0.6,
                              color: Color.fromARGB(255, 255, 216, 59),
                              text: "6/10",
                            ),
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
                          image: AssetImage("assets/Page_assets/Question_analysis_bg.png"),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(0, 0, 0, 0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        child: Center(
                          child: Text(
                            "Question analysis",
                            style: Kreporttitletext,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              for (int i = 0; i < result['data'].length; i++)
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
                              "question ${i + 1}",
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: Color.fromARGB(255, 255, 189, 159),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              result['data'][i] ?? 'Depth not available',
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
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
      percent: percentage,
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

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: AlertDialog(
          elevation: 40,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          buttonPadding: const EdgeInsets.all(5),
          backgroundColor: Colors.black.withOpacity(0.6),
          alignment: Alignment.bottomCenter,
          title: const Text(
            'This page is under construction',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 255, 205, 23),
            ),
          ),
        ),
      );
    },
  );
}



// Future<void> _createPDF() async{
//     PdfDocument document = PdfDocument();
//     final page = document.pages.add(
      
//     );
//     final page2 = document.pages.add();


//   //  page.graphics.drawString("Welcome to PDF converter",PdfStandardFont(PdfFontFamily.helvetica,40));
//   //  page.graphics.drawString(
    
//   //   "hello to PDF converter",PdfStandardFont(PdfFontFamily.helvetica,40),bounds: Rect.fromLTRB(200, 200, 10, 10));
    

//     List<int> bytes  =await document.save();
//     document.dispose();

//     saveAndLaunch(bytes , 'Output.pdf');
//   }
  
// Future<void> saveAndLaunch(List<int> bytes,String fileName)async{
  

//   final path = (await getExternalStorageDirectory())?.path;
//   final file = File('$path/$fileName');
//   await file.writeAsBytes(bytes,flush :true);
//   OpenFile.open ('$path/$fileName');

// }
