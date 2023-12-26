
import 'package:camera/camera.dart';
import  "package:flutter/material.dart";

import 'Interview.dart';
import "Report.dart";
import "constants.dart";
import "main.dart";
import "nocamera.dart";
bool ispressed = false;
late List<String> Interview_questions;
List<String> answers = [];
bool next_button_live = true;
int question_increment = 0;




late CameraController cameraController;
class Startinterview extends StatefulWidget {
  final String type; // Add this line

  const Startinterview({required this.type, Key? key}) : super(key: key);
  

  @override
  State<Startinterview> createState() => _StartinterviewState(type:type);
}

class _StartinterviewState extends State<Startinterview> {
  late String type;
  _StartinterviewState({required this.type});
  
  
  
  @override
  void initState(){
    if (type =="HR"){
        Interview_questions = randomElementsList(HR_question);
        print(Interview_questions);}
    else if(type == "Management"){
      Interview_questions = randomElementsList(Management_questions);
      print(Interview_questions);

    }
    else if(type == "Technology"){
      Interview_questions = randomElementsList(Tech_questions);
      print(Interview_questions);

    }

    else if(type == "Design"){
          Interview_questions = randomElementsList(Design_questions);
          print(Interview_questions);

        }

   
    
    try{
      dispose();

    }catch(e){

    }
    
    
    super.initState();
    try{
      cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh);
      cameraController.initialize().then((_){
      if (!mounted){
        return;
      }
      setState(() {
        
      });
    }).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case "CameraAccessDenied":
          print("User denied camera access.");
          showErrorDialog(context, "User denied camera access.");
          break;
          default:
          print("handle other errors.");
          showErrorDialog(context, "An error occurred: ${e.code}\nTry restrating the app");
          break;
        }
      }
    });
    }
    catch(e){
      print("no camera is found in the computer, ${e}");
    }
    
    
    }




     @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  //speech to text part
   


    


  
  
  @override
  Widget build(BuildContext context) {
    if (cameras.isEmpty){
      
      return Nocamera();
    }
    if (Interview_questions.isEmpty){
      return Scaffold(
        body: Center(
          child: Container(
            width:double.infinity,
            child: SingleChildScrollView(
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/image_assets/Empty_noquestions.png",height: 400,width:400),
                        SizedBox(
                          height:30,
                        ),
                        Text("No Question found!",style:TextStyle(fontFamily: "Inter1",fontWeight: FontWeight.w500,color: Colors.red,fontSize: 30),textAlign: TextAlign.center,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("No questions have been created for this interview yet wait untill next update",style:Kcommontextstyle,textAlign: TextAlign.center,),
                         SizedBox(
                          height:40,
                         ),
                         
                         ElevatedButton(
                          onPressed: () {
                            // Add your button onPressed logic here
                           Navigator.pop(context);
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview()));
                          },
                          style: ElevatedButton.styleFrom(
                            
                            primary: Colors.black, // background color
                            onPrimary: Colors.white, // text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0), // rounded corners
                            ),
                          ),
                          child: Container(
                            height:50,
                            width:200,
                            child: Center(child: Text('Back'))),
                        ),
                      ],
                    ),
            ),
          ),
        )
      );
    }
    
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
              
              child: Container(
                height: double.infinity,
                
                decoration: BoxDecoration(color: Kmainboard,borderRadius: KMyborder),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                
                    children: [
                      Row(children: [
                        IconButton(onPressed: (){
                          
                          showConfirmationDialog(context);
                         

                        }, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 40,),),
                        SizedBox(width: 20,),
                        Text("Interview",style: Ktitletextstyle,),

                      
                      
                      ]),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                      ),
                      Text(type),

                      //video container
                      if (!cameraController.value.isInitialized)
                      
                      Expanded(
                        child: Container(
                          width:double.infinity,
                          height:double.infinity,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),

                              Padding(
                                padding: const EdgeInsets.only(top:10),
                                child: Text("If it take time try restarting the app",style: Kcommontextstyle,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (cameraController.value.isInitialized)
                      Expanded(
                        child: Center(
                          child: Container(
                            child:CameraPreview(cameraController),
                          ),
                        )),


                      SizedBox(
                        height:20
                      ),
                     Center(child: Text("${question_increment+1}) ${Interview_questions[question_increment]}",style:Kcommontextstyle))    ,                 

                      
                      SizedBox(
                        height:30
                      ),            //HERE THE VIDEO CONTAINER SHOUL BE THERE
                      Center(
                        child: ElevatedButton(
                                    
                                    style:next_button_live == false ?ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 213, 6),
                                    minimumSize: Size(150, 80),
                                    onSurface: Colors.yellow,)
                                    : ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 17, 17, 17),
                                    minimumSize: Size(150, 80),
                                    onSurface: Colors.yellow,),
                                    onPressed: (){
                                      if (next_button_live == false){
                                     Navigator.pop(context);
                                     
                                     Navigator.push(context, MaterialPageRoute(builder: ((context) => Report())));
                                     setState(() {
                                       next_button_live = true;
                                       question_increment =0;
                                     });
                                     
                                     }
                                     
                                     else{
                                      setState(() {
                                        question_increment++;
                                        if (question_increment == 9){
                                          next_button_live = false;
                                        }
                                      });
                                     }
                                    

                                   

                                    
                                
                                
                                  },
                                  
                                child:next_button_live ==false? Text("Finish",style: TextStyle(fontFamily: "Inter",
                                  fontSize: 20,fontWeight: FontWeight.w600,
                                  color:Colors.white),):
                                   Text("Next Question",style: TextStyle(fontFamily: "Inter",
                                  fontSize: 20,fontWeight: FontWeight.w600,
                                  color:Colors.white),)),
                      ),
                              
                    ],
                  ),
                ),
                
              ),
            )));
  }
}




  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }