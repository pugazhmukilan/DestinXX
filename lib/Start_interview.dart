
import 'package:camera/camera.dart';
import  "package:flutter/material.dart";
import 'package:speech_to_text/speech_to_text.dart';

import 'Interview.dart';
import "Report.dart";
import "constants.dart";
import "main.dart";
import "nocamera.dart";
late bool _speechEnabled ;
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
  final SpeechToText _speechToText = SpeechToText();
  
  String _wordSpoken = "";
  double _confidenceLevel = 0;
  
  late String type;
  _StartinterviewState({required this.type});
  
  
  
  @override
  void initState(){
    //initSpeech();
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
      cameraController = CameraController(cameras[1], ResolutionPreset.ultraHigh);
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
    initSpeech();
    
    }
//TODO: complete the speech to text and show it using the logern algorithm uasednin the hackthon

   void initSpeech() async {
  print("Speech initialized");

    _speechEnabled = await _speechToText.initialize();
    setState(() {
      _startListening();
    });

}

  void _startListening() async {
    print("going to print the speech");
   
    await _speechToText.listen(onResult: _onspeechResult,listenMode: ListenMode.confirmation,pauseFor: Duration(minutes: 2),partialResults: true);
    setState(() {
      
    });
    
  
    
  }

  void _onspeechResult(result) {
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
      print(_wordSpoken);
      print("islistening ${_speechToText.isListening}");
      
      
    });
  }

  void _stopListening() async {
    print("stopping");
    await _speechToText.stop();
    setState(() {});
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              
            });
            
          },
          child: Icon(Icons.shopping_cart),),
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
                            
                            foregroundColor: Colors.white, backgroundColor: Colors.black, // text color
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
      appBar:AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.mic),
        )],
        
        title:Text("${type} INTERVIEW")),
      body:
                Stack(
                children: [
                  if (cameraController.value.isInitialized)
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
                    ),
                  Positioned(
                    bottom: 20, // Adjust the position as needed
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButton(
                        style:next_button_live == false ?ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 213, 6),
                                  minimumSize: Size(150, 80), disabledForegroundColor: Colors.yellow.withOpacity(0.38), disabledBackgroundColor: Colors.yellow.withOpacity(0.12),)
                                  : ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 17, 17, 17),
                                  minimumSize: Size(150, 80), disabledForegroundColor: Colors.yellow.withOpacity(0.38), disabledBackgroundColor: Colors.yellow.withOpacity(0.12),),
                        onPressed: () {
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
                                      if (_speechEnabled ==true){
                                        _stopListening();
                                        _wordSpoken="";
                                        _startListening();
                                        print("on state");
                                        print(_wordSpoken);
                                                                              
                                                                              }
                                      question_increment++;
                                      if (question_increment == 9){
                                        next_button_live = false;
                                      }
                                    });
                        }
                        },
                        child: next_button_live == false
                            ? Text(
                                "Finish",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Next Question",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),





                  Positioned(
                    bottom: 120, // Adjust the position as needed
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left:20),
                        child: Container(
                          height:100,
                          width:300,
                          
                          child:Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Center(child: Text("${Interview_questions[question_increment]}",style:TextStyle(color:Colors.white,fontFamily: "JetBrainsMono"),textAlign: TextAlign.center,)),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(144, 0, 0, 0)),
                        ),
                      )
                    ),
                  ),




                  
                  Positioned(
                    bottom: 600, // Adjust the position as needed
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left:20),
                        child: Container(
                          height:100,
                          width:300,
                          
                          child:Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Center(child: Text("$_wordSpoken",style:TextStyle(color:Colors.white,fontFamily: "JetBrainsMono"),textAlign: TextAlign.center,)),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(144, 0, 0, 0)),
                        ),
                      )
                    ),
                  ),
                ],
              ),
    );
            
            
            
           

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



     /*SizedBox(
                      height:20
                    ),
                   Center(child: Text("${question_increment+1}) ${Interview_questions[question_increment]}",style:Kcommontextstyle))    ,                 
      
                    
                    SizedBox(
                      height:30
                    ),            //HERE THE VIDEO CONTAINER SHOUL BE THERE
                    Center(
                      child: ElevatedButton(
                                  
                                  style:next_button_live == false ?ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 213, 6),
                                  minimumSize: Size(150, 80), disabledForegroundColor: Colors.yellow.withOpacity(0.38), disabledBackgroundColor: Colors.yellow.withOpacity(0.12),)
                                  : ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 17, 17, 17),
                                  minimumSize: Size(150, 80), disabledForegroundColor: Colors.yellow.withOpacity(0.38), disabledBackgroundColor: Colors.yellow.withOpacity(0.12),),
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
                    ),*/
                            



                            /*if (!cameraController.value.isInitialized)
              
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
              Text("This is the word spoken by you $_wordSpoken"),*/



/*class BottomSheetContent extends StatefulWidget {
  final List<Map<String, dynamic>> cartfooditem;

  BottomSheetContent({required this.cartfooditem});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 25, 5, 20),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                
                
                for (int index = 0; index < widget.cartfooditem.length; index++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Knavycolor),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child:
                                    Text("${widget.cartfooditem[index]["itemName"]}",style: TextStyle(color:Colors.white),),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.cartfooditem[index]["quantity"] =
                                      widget.cartfooditem[index]["quantity"] - 1;
                                  sum = sum-widget.cartfooditem[index]["Price"];
                                  if (widget.cartfooditem[index]["quantity"] == 0) {
                                    widget.cartfooditem.removeAt(index);
                                  }
                                });
                              },
                              icon: Icon(Icons.remove,color: Knavytextcolor),
                            ),
                            Text("${widget.cartfooditem[index]["quantity"]}",style: TextStyle(color:Colors.white),),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.cartfooditem[index]["quantity"] =
                                      widget.cartfooditem[index]["quantity"] + 1;
                                  sum = sum+widget.cartfooditem[index]["Price"];
                                });
                              },
                              icon: Icon(Icons.add,color: Knavytextcolor),
                            ),
                            SizedBox(width: 25),
                            Text("Rs.${cartfooditem[index]["Price"]*cartfooditem[index]["quantity"]}",style: TextStyle(color:Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  for (int i=0;i<alreadyordereditem.length;i++)
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Knavycolor),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                
                                child:
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(2, 15, 2, 15),
                                      child: Text("${alreadyordereditem[i]["itemName"]}",style: TextStyle(color:Colors.white),),
                                    ),
                              ),
                            ),
                           
                            Text("${alreadyordereditem[i]["quantity"]}",style: TextStyle(color:Colors.white),),

                            SizedBox(width: 25),
                            Text("Rs.${alreadyordereditem[i]["price"]*alreadyordereditem[i]["quantity"]}",style: TextStyle(color:Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(child: Text("TOTAL",style:TextStyle(fontFamily: "Inter",fontWeight: FontWeight.w600,fontSize: 20)))),
                      Expanded(
                        flex:3,
                        child: Center(child: Text("Rs.${sum}",style:TextStyle(fontFamily: "Inter",fontWeight: FontWeight.w600,fontSize: 20)))),
                    
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sum=orderedsum;
                        widget.cartfooditem.clear();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text('CLEAR', style: TextStyle(fontFamily: "inter", fontSize: 15, color: Colors.white)),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add your logic for processing the bill
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text("BILL", style: TextStyle(fontFamily: "inter", fontSize: 15, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return BottomSheetContent(cartfooditem: cartfooditem);
    },
  );
}*/