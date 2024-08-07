import 'package:destin/bloc/api_bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/Questions.dart';
import '../FeaturesPage/Report.dart';
import '../constants.dart';
import 'Interview.dart';

List<String> answers = [];
Map<dynamic, dynamic> dictionary = {};
late List<String> Interview_questions;
final List<TextEditingController> controllers = [];
bool is_retriving = false;
late Map<String, dynamic> result;

class Textinterview extends StatefulWidget {
  final String type; // Add this line

  const Textinterview({required this.type, Key? key}) : super(key: key);

  @override
  State<Textinterview> createState() => _TextinterviewState(type: type);
}

class _TextinterviewState extends State<Textinterview> {
  late String type;
  _TextinterviewState({required this.type});

  // List of controllers for each question

  @override
  void initState() {
    super.initState();
    //ADDING QUESTION TO THE LIST BASED ON THE CONDITIONS
    if (type == "HR") {
      Interview_questions = randomElementsList(HR_question);
      print(Interview_questions);
    } else if (type == "Management") {
      Interview_questions = randomElementsList(Management_questions);
      print(Interview_questions);
    } else if (type == "Technology") {
      Interview_questions = randomElementsList(Tech_questions);
      print(Interview_questions);
    } else if (type == "Design") {
      Interview_questions = randomElementsList(Design_questions);
      print(Interview_questions);
    } else if (type == "Java"){
      Interview_questions = randomElementsList(Java_questions);
      print(Interview_questions);
    }else if (type == "Python"){
      Interview_questions = randomElementsList(Python_questions);
      print(Interview_questions);
    } else if (type == "Web"){
      Interview_questions = randomElementsList(Webdevelopment_questions);
      print(Interview_questions);
    } else if (type == "Oops"){
      Interview_questions = randomElementsList(Oops_questions);
      print(Interview_questions);
    }

    //ADDING THE CONTROLLERS FOR EACH ASNWERS FOR THE QUESTION
    for (int i = 0; i < Interview_questions.length; i++) {
      controllers.add(
          TextEditingController()); // Initialize controllers for each question
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Interview_questions.isEmpty) {
      return Scaffold(
          body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/image_assets/Empty_noquestions.png",
                    height: 400, width: 400),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "No Question found!",
                  style: TextStyle(
                      fontFamily: "Inter1",
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "No questions have been created for this interview yet wait untill next update",
                  style: Kcommontextstyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Interview()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // rounded corners
                    ),
                  ),
                  child: const SizedBox(
                      height: 50,
                      width: 200,
                      child: Center(child: Text('Back'))),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return BlocListener<ApiBloc, ApiState>(
      listener: (context, state) {
        if (state is ApiFetchingReport) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialog(); // Custom dialog widget
            },
          );
        } else if (state is ApiFetchSuccessful) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      Report(result: state.report, overallscore: 0.8))));
        } else if (state is ApiFailed) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to fetch report. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Text Based Interview",
            style: Kinterviewtypetextstyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Kbackgroundcolor,
        body: Container(
          decoration: BoxDecoration(color: Kdestinxwhite),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/image_assets/instruction.png",
                              height: 200,
                              width: 200,
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Instructions",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                              Text(
                                "Welcome to the text-based interview! You'll find 10 thoughtfully crafted questions below. Please take your time to read each question carefully and provide your response in the designated box. Ensure you adhere to the specified word limit for each question. Once you've answered a question, simply click the submit button before moving on to the next one. Good luck!",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          for (int i = 0;
                              i < Interview_questions.length - 1;
                              i++)
                            QuestionWidget(
                              index: i,
                              question: Interview_questions[i],
                              controller: controllers[i],
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: const Size(120, 60),
                              ),
                              onPressed: () async {
                                for (int i = 0;
                                    i < controllers.length - 1;
                                    i++) {
                                  answers.add(controllers[i]
                                      .text); // Add user input to answers list
                                }
                                context.read<ApiBloc>().add(ApiCall(
                                    interviewAnswer: answers,
                                    interviewQuestions: Interview_questions));
                              },
                              child: is_retriving
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Submit answers",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                            ),
                          ),
                        ],
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
    // return Scaffold(

    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title:Text("Text Based Interview",style: Ktitletextstyle,

    //     ),
    //     leading: IconButton(
    //       onPressed: (){

    //         Navigator.pop(context);
    //       },
    //       icon:Icon(Icons.arrow_back_ios)),),
    //   backgroundColor: Kbackgroundcolor,

    //   body: Container(
    //     decoration: BoxDecoration( color: Kdestinxwhite),
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [

    //             Expanded(
    //               child: Container(
    //                 child: SingleChildScrollView(
    //                   scrollDirection: Axis.vertical,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Center(
    //                         child: Image.asset(
    //                           "assets/image_assets/instruction.png",
    //                           height: 200,
    //                           width: 200,
    //                         ),
    //                       ),
    //                       const Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Text("Instructions",
    //                               style: TextStyle(
    //                                   fontFamily: "Poppins",
    //                                   fontSize: 25,
    //                                   fontWeight: FontWeight.w600,
    //                                   color: Colors.black)),
    //                           SizedBox(height: 10),
    //                           Text(
    //                             "Welcome to the text-based interview! You'll find 10 thoughtfully crafted questions below. Please take your time to read each question carefully and provide your response in the designated box. Ensure you adhere to the specified word limit for each question. Once you've answered a question, simply click the submit button before moving on to the next one. Good luck!",
    //                             style: TextStyle(fontSize: 15),
    //                             textAlign: TextAlign.justify,
    //                           )
    //                         ],
    //                       ),

    //                       const SizedBox(
    //                         height: 80,
    //                       ),
    //                       for (int i = 0; i < Interview_questions.length-1; i++)
    //                         QuestionWidget(
    //                           index: i,
    //                           question: Interview_questions[i],
    //                           controller: controllers[i],
    //                         ),
    //                       const SizedBox(
    //                         height: 30,
    //                       ),
    //                       Center(
    //                         child: ElevatedButton(
    //                             style: ElevatedButton.styleFrom(
    //                               backgroundColor: Colors.green,
    //                               minimumSize: const Size(120, 60),
    //                             ),
    //                             onPressed: () async {
    //                               for (int i = 0;
    //                                   i < controllers.length-1;
    //                                   i++) {

    //                                 answers.add(controllers[i]
    //                                     .text); // Add user input to answers list
    //                               }
    //                               context.read<ApiBloc>().add(ApiCall(interviewAnswer: answers, interviewQuestions: Interview_questions));
    //                             //   setState(() {

    //                             //     is_retriving = true;
    //                             //   });
    //                             //   Callapi callapi = Callapi();
    //                             //   result = await callapi.fetchData(Interview_questions, answers, (bool isLoading) {
    //                             //     setState(() {
    //                             //       is_retriving = isLoading;
    //                             //     });
    //                             //   });
    //                             //   //double score = callapi.calculateOverallScore(result);
    //                             //   setState(() {
    //                             //     is_retriving = false;
    //                             //   });
    //                             // //Navigator.push(context,MaterialPageRoute(builder: (context)=>dummy(data : result)));
    //                             //   Navigator.push(
    //                             //       context,
    //                             //       MaterialPageRoute(
    //                             //           builder: ((context) =>  Report(result:result,overallscore:0.2))));
    //                             },
    //                             child: is_retriving? CircularProgressIndicator(color: Colors.white,):Text(
    //                               "Submit answers",
    //                               style: TextStyle(
    //                                   fontFamily: "Poppins",
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.w600,
    //                                   color:
    //                                       Color.fromARGB(255, 255, 255, 255)),
    //                             )),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ]),
    //     ),
    //   ),
    // );
  }
}

class QuestionWidget extends StatefulWidget {
  final int index; // Index of the question
  final String question; // Question text
  final TextEditingController controller; // Controller for user input

  const QuestionWidget({
    super.key,
    required this.index,
    required this.question,
    required this.controller,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "${widget.index + 1})  ${widget.question}",
            style: const TextStyle(
                fontFamily: "Poppins", fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        typingfield(
            editor: controllers[widget.index],
            h: 200,
            hinttext: "answer....",
            len: 500),
      ],
    );
  }
}

class typingfield extends StatelessWidget {
  typingfield({
    super.key,
    required this.editor,
    required this.h,
    required this.hinttext,
    required this.len,
  });

  late TextEditingController editor;
  late double h;
  late String hinttext;
  late int len;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
      child: Container(
        height: h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: KMyborder,
          color: Kgreycolor_light,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: TextField(
            controller: editor,
            maxLength: len,
            maxLines: null,
            // Allow unlimited lines in the text field
            decoration: const InputDecoration(
                border: InputBorder.none, // Remove default border
                hintText: 'Here...',
                hintStyle: TextStyle(
                    fontFamily: "inter",
                    fontSize: 10,
                    color: Color.fromARGB(255, 148, 148, 148))),
          ),
        ),
      ),
    );
  }
}
/**/

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
      
      decoration: BoxDecoration(color: Kdestinxwhite,borderRadius:BorderRadius.circular(10),border: Border.all(width: 2,color: Kdestinxblack.withOpacity(0.5)) ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Kdestinxorange,),
            
            Text('Fetching report...'),
          ],
        ),
      ),
    );
  }
}
