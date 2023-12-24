
import 'package:camera/camera.dart';
import  "package:flutter/material.dart";
import 'package:speech_to_text/speech_to_text.dart' as stt;

import "Report.dart";
import "constants.dart";
import "main.dart";
import "nocamera.dart";
bool ispressed = false;





late CameraController cameraController;
class Startinterview extends StatefulWidget {
  

  @override
  State<Startinterview> createState() => _StartinterviewState();
}

class _StartinterviewState extends State<Startinterview> {

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking.';
  
  @override
  void initState(){
   
    _speech = stt.SpeechToText();
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
   void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print('Speech recognition status: $status');
        },
        onError: (error) => print('Error: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) => setState(() => _text = result.recognizedWords),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }


    


  
  
  @override
  Widget build(BuildContext context) {
    if (cameras.isEmpty){
      
      return Nocamera();
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
                          Navigator.pop(context);

                        }, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 40,),),
                        SizedBox(width: 20,),
                        Text("Interview",style: Ktitletextstyle,),

                      
                      
                      ]),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                      ),

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

                      Text(_isListening ? 'Stop Listening' : 'Start Listening'),

                      
                      SizedBox(
                        height:30
                      ),            //HERE THE VIDEO CONTAINER SHOUL BE THERE
                      Center(
                        child: ElevatedButton(
                                    
                                    style:ispressed == false ?ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 50, 213, 6),
                                    minimumSize: Size(150, 80),
                                    onSurface: Colors.yellow,)
                                    : ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 211, 45, 4),
                                    minimumSize: Size(150, 80),
                                    onSurface: Colors.yellow,),
                                    onPressed: (){
                                   
                                     Navigator.pop(context);
                                     
                                     Navigator.push(context, MaterialPageRoute(builder: ((context) => Report())));
                                     
                                    

                                   

                                    
                                
                                
                                  },
                                  
                                child:ispressed ==false? Text("Start",style: TextStyle(fontFamily: "Inter",
                                  fontSize: 20,fontWeight: FontWeight.w600,
                                  color:Colors.white),):
                                   Text("Stop",style: TextStyle(fontFamily: "Inter",
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