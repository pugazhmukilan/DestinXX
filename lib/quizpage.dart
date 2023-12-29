import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import "quiz.dart";

class LoadingAndQuizPage extends StatefulWidget {
  final String category;
  final String subcategory;

  LoadingAndQuizPage({required this.category, required this.subcategory});

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
              Set<int> selectedIndices = Set<int>();

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
    if (selectedOptionIndex == questions[currentQuestionIndex]['correctIndex']) {
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
        showResults();
      }
    });
  }

  void showResults() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Column(
            children: [
              Text('Your Score: $score / ${questions.length}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetQuiz();
                },
                child: Text('Play Again'),
              ),
            ],
          ),
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
    if (questions == null) {
      return Container(
        child: Text("error"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                questions[currentQuestionIndex]['options'].length,
                (index) => ElevatedButton(
                  onPressed: () {
                    checkAnswer(index);
                  },
                  child: Text(questions[currentQuestionIndex]['options'][index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }
}