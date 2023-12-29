import 'dart:math';

import "package:destin/firebasefunctions.dart";
import "package:destin/loadingscreen.dart";
import "package:destin/quiztypes.dart";
import 'package:flutter/material.dart';

import "Home.dart" ;
import "Interview.dart";
import  "Start_interview.dart";


double screenWidth = 0;
late String UserName ;
late String UserID;
String projectName  = "ProjectX";
Color Kquizlinecolor = Color.fromARGB(255, 219, 219, 219);
Color  Kbackgroundcolor = const Color.fromARGB(255, 29, 29, 29);
Color  Ksidebarcolor =  const Color.fromARGB(255, 29, 29, 29);
Color  Kmainboard = Color.fromARGB(255, 255, 255, 255);
Color Kblacktextcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kgreycolor_dark = Color.fromARGB(255, 161, 161, 161);
Color Kgreycolor_light = const Color.fromARGB(255, 242, 246, 249);
Color Kgreylinecolor = const Color.fromARGB(255, 194, 194, 194);
Color Kgreytextcolor = const Color.fromARGB(255, 186, 171, 171);
Color Kprogressbarbackgroundcolor = Color.fromARGB(255, 230, 230, 230);
TextStyle Ktitletextstyle = const TextStyle(fontFamily: "Inter",fontSize: 30,fontWeight: FontWeight.bold);
TextStyle Kcommontextstyle = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight:FontWeight.w500);
TextStyle Kresumetextstyle = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight:FontWeight.w800,color: Color.fromARGB(255, 104, 103, 103));
TextStyle Kprogressbarnumber = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight: FontWeight.w800,color: Colors.black);
TextStyle Kreporttextstyle = const  TextStyle(fontFamily: "Inter",fontWeight: FontWeight.w400,color: Colors.black,fontSize: 23);
TextStyle Kquizcattext = TextStyle(fontFamily: "Inter",fontSize: 25,fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 92, 92, 92));
//profile image for the user 
//picking the image from the file using the some modules

BorderRadius KMyborder = BorderRadius.circular(10);


List <String> Design_questions=[];
List<String> Management_questions=[];
List<String> Tech_questions=[];
List<String> HR_question = [
  "Can you tell me a little about yourself?",
  "What made you apply for this position?",
  "How did you hear about our company?",
  "What do you know about our company?",
  "Why do you want to work here?",
  "What are your strengths and weaknesses?",
  "Describe a challenging situation you faced at work and how you handled it.",
  "How do you handle stress and pressure?",
  "Can you provide an example of a successful project you worked on?",
  "How do you prioritize your work and manage your time?",
  "What is your management style?",
  "How do you handle conflicts with colleagues?",
  "Where do you see yourself in five years?",
  "What do you consider your greatest professional achievement?",
  "How do you stay updated on industry trends and changes?",
  "Why should we hire you?",
  "What motivates you to do your best work?",
  "How do you handle feedback and criticism?",
  "Can you give an example of a time when you had to adapt to a change at work?",
  "Describe your ideal work environment.",
  "How do you handle tight deadlines?",
  "What skills do you bring to this role that make you a good fit?",
  "How do you stay organized and keep track of tasks?",
  "Can you describe a situation where you demonstrated leadership skills?",
  "How do you handle multiple priorities?",
  "What do you think is the most challenging aspect of this role?",
  "How do you ensure that your work is accurate and error-free?",
  "How do you approach building relationships with colleagues?",
  "Can you share an example of a time when you had to deal with a difficult team member?",
  "How do you contribute to a positive team environment?",
  "What are your salary expectations?",
  "How do you handle tight deadlines and stressful situations?",
  "What strategies do you use for effective communication?",
  "Can you share an experience where you had to solve a complex problem?",
  "How do you handle confidential information and sensitive situations?",
  "How do you ensure diversity and inclusion in the workplace?",
  "What are your favorite HR tools or software?",
  "How do you keep up-to-date with employment laws and regulations?",
  "Can you describe your experience with performance reviews?",
  "How do you handle employee relations issues?",
  "Can you share an example of a time when you had to mediate a conflict between employees?",
  "How do you approach recruitment and talent acquisition?",
  "What role do you think HR plays in employee development?",
  "How do you ensure a fair and unbiased recruitment process?",
  "Can you provide an example of a successful employee engagement initiative you implemented?",
  "How do you handle employee terminations or layoffs?",
  "How do you measure the success of HR programs or initiatives?",
  "Can you share an experience where you had to deal with a challenging employee situation?",
  "How do you stay current with changes in employment law?",
  "Can you share an example of a time when you had to handle a confidential employee matter?"
];

//GENERATING REANDOWM ELEMEWNT FROM THE ORIGINAL LIST TO NEW LIST
List<String> randomElementsList(List<String> inputList) {
  final random = Random();
  final shuffledList = inputList.toList()..shuffle(random); // Shuffle the list
  final uniqueElements = <String>{}; // Set to store unique elements

  // Add elements to the set until it has 10 unique elements or the list is exhausted
  for (var element in shuffledList) {
    if (uniqueElements.length < 10) {
      uniqueElements.add(element);
    } else {
      break; // No need to continue if we already have 10 unique elements
    }
  }

  return uniqueElements.toList(); // Convert the set back to a list
}














class Side_bar_element extends StatelessWidget {

  late String name;
  late String imagelink;
  
  late Function() operation;
  Side_bar_element({required this.name,
   required this .imagelink,
  
   required this.operation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: operation,
        child: Container(
          
          color: Colors.transparent,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              
             Container(
              width:30,
              height:30,
              color: Colors.transparent,
              child: Center(child: Image(image: AssetImage(imagelink)))),
             SizedBox(
              width:50,
             ),
             Text(name,style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Kgreytextcolor,fontFamily: "Inter"))
          ],),
        ),
      ),
    );
  }
}




class Side extends StatefulWidget {
  const Side({super.key});

  @override
  State<Side> createState() => _SideState();
}

class _SideState extends State<Side> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
                height:double.infinity,
                decoration: BoxDecoration(color:Ksidebarcolor,
                borderRadius: KMyborder,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text(projectName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Kgreytextcolor),),
                      
                      
                      Padding(
                        padding: const EdgeInsets.only(left:10,top:15,bottom:15),
                        child: Image.asset("assets/logos/Desktop_logoNtext.png"),
                      ),
                    
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Kgreytextcolor,
                        radius: 40,
                        backgroundImage: AssetImage("assets/icon_assets/UserDefaultIcon.png",),
                      
                      ),
                      SizedBox(
                        height:10,
                      ),
                      Text( UserName,style:TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight: FontWeight.bold,color:Kgreytextcolor)),
                      Text("Free plan",style:TextStyle(fontFamily: "Inter",fontSize: 10,fontWeight: FontWeight.w300,color:Kgreytextcolor)),
                
                      SizedBox(
                        height:40,
                      ),

                      Container(
                        child: Scrollbar(
                          
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Side_bar_element(name: "Dashboard",imagelink:"assets/icon_assets/home_icon.png",operation: (){
                            print("Interview");
                            Navigator.pop(context);//POPPING THE CURRENT PAGE AND NAVIGATING TO NEEW
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                            }),
                                              
                            Side_bar_element(name:"Quizs",imagelink:"assets/icon_assets/dev_icon.png",operation: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => Quiztypes())));
                                                }),
                            Side_bar_element(name:"Interview",imagelink:"assets/icon_assets/tie_side_icon.png",operation: (){
                            print("INterview");
                            setState(() {
                             Navigator.pop(context);
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview()));
                            });
                                                }),
                            Side_bar_element(name:"Resume",imagelink:"assets/icon_assets/resume_icon.png",operation: (){
                            print("Resume");
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingPage()));
                                                }),
                          
                              ],
                            ),
                          ),
                        ),
                      ),
                     SizedBox(height:350
                     ,),
                    
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          
                          
                          GestureDetector(
                        onTap: (){
                          signOut(context);
                        },
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                        
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                
                                Padding(
                                  padding: const EdgeInsets.only(right:10),
                                  child: Text("Sign out",style:TextStyle(fontFamily: "Inter",fontSize: 17,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 93, 93, 93))),
                                ),
                                
                                Image.asset("assets/icon_assets/signout.png"),
                            
                              ],
                            ),
                          ),
                        ),
                        
                     
                       
                     ),


                        ],
                      )    
                        
                    ],
                  ),
                ),
                
              );
  }
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
      backgroundColor: Kmainboard,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage,String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.red),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
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
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            child: Text('OK'),
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
            buttonPadding: EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: Text(
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
},);
}


//this dialogue box is shown when the ppl exit the interview in the middle of the interview
void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "On going interview",
          style: TextStyle(color: Colors.red),
        ),
        content: Column(
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
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              
                            next_button_live = true;
                            question_increment = 0;
                        
              Navigator.of(context).pop();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview())); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            child: Text('Yes'),
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
