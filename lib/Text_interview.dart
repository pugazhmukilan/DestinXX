import 'package:flutter/material.dart';

import 'Interview.dart';
import "Report.dart";
import 'constants.dart';
List<String> answers = [];
late List<String> Interview_questions;
final List<TextEditingController> controllers = [];

class Textinterview extends StatefulWidget {
  const Textinterview({super.key});

  @override
  State<Textinterview> createState() => _TextinterviewState();
}

class _TextinterviewState extends State<Textinterview> {

   // List of controllers for each question

  @override
  void initState() {
    super.initState();
    //ADDING QUESTION TO THE LIST
    Interview_questions = randomElementsList(HR_question);
    print(Interview_questions);

    //ADDING THE CONTROLLERS FOR EACH ASNWERS FOR THE QUESTION
    for (int i = 0; i < Interview_questions.length; i++) {
      controllers.add(TextEditingController()); // Initialize controllers for each question
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body:Padding(
        padding: const EdgeInsets.all(25.0),
        
        child: Container(
          decoration: BoxDecoration(borderRadius: KMyborder,color: Kmainboard),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[ 
                 Row(
                   children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview()));
                    }, icon:Icon(Icons.arrow_back_ios) ),
                     Expanded(child: Text("Text based Interview", style: Ktitletextstyle)),
                   ],
                 ),
                 Divider(
                            indent: 0,
                            endIndent: 0,
                            color: Kgreylinecolor,
                  ),
      
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < Interview_questions.length; i++)
                              QuestionWidget(
                                index: i,
                                question: Interview_questions[i],
                                controller: controllers[i],
                              ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                                                        
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                                          minimumSize: Size(120, 60),
                                          ),
                                          onPressed: ()async{
                                       for (int i = 0; i < controllers.length; i++) {
                                        print("====================================================================");
                                            print("QUESTION ${i} =========== ${Interview_questions[i]}\n");
                                            print(" =========== ${controllers[i].text}\n");

                                            
                                            answers.add(controllers[i].text); // Add user input to answers list
                                           }
                                                                    
                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Report())));                          
                                        },
                                                                      
                                      child: Text("Submit answers",style: TextStyle(fontFamily: "Inter",
                                          fontSize: 15,fontWeight: FontWeight.w600,
                                          color:const Color.fromARGB(255, 255, 255, 255)),)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                
                ]
            ),
          ),
        ),
      ),
    );
  }
}




class QuestionWidget extends StatefulWidget {
  final int index; // Index of the question
  final String question; // Question text
  final TextEditingController controller; // Controller for user input

  const QuestionWidget({
    required this.index,
    required this.question,
    required this.controller,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.question),
        ),
        
        typingfield(editor: controllers[widget.index], h: 200, hinttext: "answer....", len: 500),

      ],
    );
  }
}


class typingfield extends StatelessWidget {
  typingfield({
    
    required this.editor,
    required this.h,
    required this.hinttext,
    required this.len,
  });

  late TextEditingController editor;
  late  double h;
  late String hinttext;
  late int len;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom:10,right:8,left:8),
      child: Container(
         height:h,
         width: double.infinity,
         decoration: BoxDecoration(borderRadius: KMyborder,color: Kgreycolor_light,),
         
          child: Padding(
            padding: const EdgeInsets.only(left: 15,bottom:5),
            child: TextField(
             controller: editor,
             maxLength: len,
             maxLines:null,
              // Allow unlimited lines in the text field
             decoration: InputDecoration(
               border: InputBorder.none, // Remove default border
               hintText: 'Here...',
             ),
               ),
         ),
       ),
    );
  }
}