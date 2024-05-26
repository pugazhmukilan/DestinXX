import 'package:camera/camera.dart';
import 'package:destin/API/api_request.dart';
import 'package:destin/FeaturesPage/Report.dart';
import "package:flutter/material.dart";
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Constants/Questions.dart';
import "../ErrorPages/nocamera.dart";
import "../constants.dart";
import "../main.dart";
import 'Interview.dart';

late bool _speechEnabled;
bool ispressed = false;
late List<String> Interview_questions;
List<String> answers = [];
bool next_button_live = true;
int question_increment = 0;
late Map<String,dynamic> result;

late CameraController cameraController;

class Startinterview extends StatefulWidget {
  final String type; // Add this line

  const Startinterview({required this.type, Key? key}) : super(key: key);

  @override
  State<Startinterview> createState() => _StartinterviewState(type: type);
}

class _StartinterviewState extends State<Startinterview> {
  Map<dynamic, dynamic> dictionary = {};
  int labelCount = 1;
  bool is_retriving = false;
  final SpeechToText _speechToText = SpeechToText();
  List<String> uniqueSentences = [];
  String lastRecognizedWords = '';
  String works_text = '';
  final TextEditingController _textController =
      TextEditingController(); //creating object for the class

  List<String> List_text = [];
  bool _speechEnabled = false;
  String _lastWords = '';
  bool _isListening = false;

  String wordSpoken = "";
  final double _confidenceLevel = 0;

  late String type;
  _StartinterviewState({required this.type});

  @override
  void initState() {
    _initSpeech();
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
    }

    try {
      dispose();
    } catch (e) {}

    super.initState();
    try {
      cameraController =
          CameraController(cameras[1], ResolutionPreset.ultraHigh);
      cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case "CameraAccessDenied":
              print("User denied camera access.");
              showErrorDialog(context, "User denied camera access.");
              break;
            default:
              print("handle other errors.");
              showErrorDialog(context,
                  "An error occurred: ${e.code}\nTry restrating the app");
              break;
          }
        }
      });
    } catch (e) {
      print("no camera is found in the computer, $e");
    }
  }

  void addToDictionary(String text) {
    setState(() {
      dictionary[labelCount] = text;
      labelCount++;
    });
  }
  

//TODO: complete the speech to text and show it using the logern algorithm uasednin the hackthon
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {
      _startListening();
    });
  }

  void _startListening() async {
    if (_isListening) {
      _isListening = true;
      while (_isListening) {
        await _speechToText.listen(
          onResult: _onSpeechResult,
          localeId: 'en-UK',
        );
      }
    }
    setState(() {
      _isListening = true;
      _startListening();
    });
  }

  void _stopListening() async {
    if (_isListening) {
      _isListening = false;
      await _speechToText.stop();
      setState(() {});
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      List_text.add(result.recognizedWords);
      if (result.finalResult) {
        String recognizedWords = result.recognizedWords;

        if (recognizedWords != lastRecognizedWords) {
          if (!uniqueSentences.contains(recognizedWords)) {
            setState(() {
              uniqueSentences.add(recognizedWords);
            });
          }
          lastRecognizedWords = recognizedWords;
        }
      }
      _textController.text = uniqueSentences.join(' ');
      /* _textController.text =
          LinkedHashSet<String>.from(List_text).toList().join(" ");
      _textController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));*/
      _isListening = true;
    });
  }
  


  //speech to text part
  @override
  void dispose(){
    super.dispose();
    cameraController.dispose();
}

  @override
  Widget build(BuildContext context) {
    if (cameras.isEmpty) {
      return const Nocamera();
    }
    if (Interview_questions.isEmpty) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            child: const Icon(Icons.shopping_cart),
          ),
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

    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      
      appBar: AppBar(actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.mic),
        )
      ], title: Text("$type INTERVIEW")),
      body: Stack(
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
                style: next_button_live == false
                    ? ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 50, 213, 6),
                        minimumSize: const Size(150, 80),
                        
                      )
                    : ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
                        minimumSize: const Size(150, 80),
                        
                      ),
                onPressed: () async {
                  if (next_button_live == false) {
                    setState(() {
                      is_retriving=true;
                      });

                    //FECTHING THE INFROMATIO USING THE API CALLS
                    Callapi callapi = Callapi();
                    result = await callapi.fetchData(Interview_questions, answers, (bool isLoading) {
                      setState(() {
                        is_retriving = isLoading;
                      });
                    });
                     //double score = callapi.calculateOverallScore(results);
                    setState(() {
                      
                      is_retriving=false;
                      next_button_live = true;
                      question_increment = 0;
                    });
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Report(
                                result:result,overallscore:0.2))));
                    
                  } else {
                    setState(() {
                      answers.add(uniqueSentences.toString());
                      addToDictionary(uniqueSentences.toString());
                      //print(uniqueSentences);
                      uniqueSentences.clear();
                      //print(uniqueSentences);
                      //Have to send the words that have been saved in the _uniquesentences into the model and clear the List after each question.
                      if (_speechEnabled == true) {}
                      question_increment++;
                      if (question_increment ==7) {
                        //print(dictionary);
                        next_button_live = false;
                      }
                    });
                  }
                },
                child: next_button_live == false
                    ? is_retriving? CircularProgressIndicator(color: Colors.black,): Text(
                        "Finish",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                height: 80,
                width: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(144, 0, 0, 0)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                      child: Text(
                    // If listening is active show the recognized words
                    _speechToText.isListening
                        ? _lastWords
                        // If listening isn't active but could be tell the user
                        // how to start it, otherwise indicate that speech
                        // recognition is not yet ready or not supported on
                        // the target device
                        : _speechEnabled
                            ? 'Start speaking...'
                            : 'Speech not available',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "JetBrainsMono"),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            )),
          ),
          Positioned(
            bottom: 600, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(144, 0, 0, 0)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                      child: Text(
                    Interview_questions[question_increment],
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "JetBrainsMono"),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            )),
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
        title: const Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

