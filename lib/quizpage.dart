import 'dart:convert';
import 'dart:math';

import 'package:destin/quiztypes.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import "quiz.dart";

class LoadingAndQuizPage extends StatefulWidget {
  final String category;
  final String subcategory;

  const LoadingAndQuizPage(
      {super.key, required this.category, required this.subcategory});

  @override
  _LoadingAndQuizPageState createState() => _LoadingAndQuizPageState();
}

class _LoadingAndQuizPageState extends State<LoadingAndQuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();
    loadQuestions().then((loadedQuestions) {
      setState(() {
        questions = loadedQuestions;
      });
    }).catchError((error) {
      print('Error loading questions: $error');
      // Handle error, e.g., show an error message or navigate to an error page.
    });
  }

  Future<List<Map<String, dynamic>>> loadQuestions() async {
    try {
      Map<String, dynamic> jsonData = json.decode(quizData);

      for (var category in jsonData['categories']) {
        if (category['name'] == widget.category) {
          for (var subcategory in category['subcategories']) {
            if (subcategory['name'] == widget.subcategory) {
              List<Map<String, dynamic>> allQuestions =
                  List<Map<String, dynamic>>.from(subcategory['questions']);
              Set<int> selectedIndices = <int>{};

              // Generate 10 unique random indices
              while (selectedIndices.length < 10) {
                int randomIndex = Random().nextInt(allQuestions.length);
                selectedIndices.add(randomIndex);
              }

              // Get the corresponding questions for the selected indices
              List<Map<String, dynamic>> selectedQuestions =
                  selectedIndices.map((index) => allQuestions[index]).toList();

              return selectedQuestions;
            }
          }
        }
      }

      throw ('Questions not found');
    } catch (e) {
      print('Error loading questions: $e');
      throw ('Error loading questions');
    }
  }

  void checkAnswer(int selectedOptionIndex) {
    if (selectedOptionIndex ==
        questions[currentQuestionIndex]['correctIndex']) {
      setState(() {
        score++;
      });
    }

    nextQuestion();
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz completed
        showresults(context);
      }
    });
  }

  
  void showresults(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "QuizCompleted",
            style: TextStyle(color: Colors.red),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "'Your Score: $score / ${questions.length}'",
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetQuiz();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Play Again'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Quiztypes())); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text('Quit'),
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

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showConfirmationDialog(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 40,
                        ),
                      ),
                      Expanded(child: Text("Quiz", style: Ktitletextstyle)),
                    ],
                  ),
                  const Divider(
                    indent: 5,
                    endIndent: 5,
                  ),
                  const SizedBox(height: 30),
                  Image.asset("assets/image_assets/quizimage.png",
                      height: 200, width: 200),
                  Text(
                    "${currentQuestionIndex + 1}) ${questions[currentQuestionIndex]['question']}",
                    style: Kcommontextstyle,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      questions[currentQuestionIndex]['options'].length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 3, right: 3),
                        child: SizedBox(
                          height: 80,
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              checkAnswer(index);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.green,
                              shadowColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.green.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.green.withOpacity(0.12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              textStyle: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            child: Text(
                              questions[currentQuestionIndex]['options'][index],
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }
}

//this dialogue box is shown when the ppl exit the interview in the middle of the interview
void showConfirmationDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "On going Quiz",
          style: TextStyle(color: Colors.red),
        ),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to leave this quiz in the middle?",
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
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Quiztypes())); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('Quit'),
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
