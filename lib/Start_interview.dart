import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'package:speech_to_text/speech_to_text.dart';
import 'Interview.dart';
import "Report.dart";
import "constants.dart";
import "main.dart";
import "nocamera.dart";
import 'package:speech_to_text/speech_recognition_result.dart';

late bool _speechEnabled;
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
  State<Startinterview> createState() => _StartinterviewState(type: type);
}

class _StartinterviewState extends State<Startinterview> {
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
          CameraController(cameras[0], ResolutionPreset.ultraHigh);
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
  Widget build(BuildContext context) {
    if (cameras.isEmpty) {
      return const Nocamera();
    }
    if (Interview_questions.isEmpty) {
      //This part is for the empty questions section
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

    return Scaffold(
        backgroundColor: Kbackgroundcolor,
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Expanded(
              child: Container(
                height: double.infinity,
                decoration:
                    BoxDecoration(color: Kmainboard, borderRadius: KMyborder),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        IconButton(
                          onPressed: () {
                            showConfirmationDialog(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Interview",
                          style: Ktitletextstyle,
                        ),
                      ]),
                      const Divider(
                        indent: 0,
                        endIndent: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          type,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),

                      //video container
                      if (!cameraController.value.isInitialized)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "If it take time try restarting the app",
                                    style: Kcommontextstyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Center(
                          child: Text(
                              "${question_increment + 1}) ${Interview_questions[question_increment]}",
                              style: Kcommontextstyle)),

                      //Speech to be displayed ------------------------------------------------------------
                      const SizedBox(height: 20),
                      if (cameraController.value.isInitialized)
                        Expanded(
                            child: Center(
                          child: Container(
                            child: CameraPreview(cameraController),
                          ),
                        )),

                      const SizedBox(height: 20),

                      Center(
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
                          style: Kcommontextstyle,
                        ),
                      ),
                      //Questions display area ---------------------------------------------------------------------
                      const SizedBox(
                          height: 30), //HERE THE VIDEO CONTAINER SHOUL BE THERE
                      Center(
                        child: ElevatedButton(
                            style: next_button_live == false
                                ? ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 50, 213, 6),
                                    minimumSize: const Size(150, 80),
                                    //maximumSize: ,
                                    disabledForegroundColor:
                                        Colors.yellow.withOpacity(0.38),
                                    disabledBackgroundColor:
                                        Colors.yellow.withOpacity(0.12),
                                  )
                                : ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 17, 17, 17),
                                    minimumSize: const Size(150, 60),
                                    maximumSize: const Size(200, 70),
                                    disabledForegroundColor:
                                        Colors.yellow.withOpacity(0.38),
                                    disabledBackgroundColor:
                                        Colors.yellow.withOpacity(0.12),
                                  ),
                            onPressed: () {
                              if (next_button_live == false) {
                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Report())));
                                setState(() {
                                  next_button_live = true;
                                  question_increment = 0;
                                });
                              } else {
                                setState(() {
                                  //ALSO HAVE TO SET THE STATE OF THE _uniquesentences TO SENT IT TO THE MODEL INTO THE RESPECTIVE M0DEL AND THEN REFRESH IT AS TO APPEND THE LIST FROM THE STARING.
                                  question_increment++;
                                  if (question_increment == 9) {
                                    next_button_live = false;
                                  }
                                });
                              }
                            },
                            child: next_button_live == false
                                ? const Text(
                                    "Finish",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )
                                : const Text(
                                    "Next Question",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
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
