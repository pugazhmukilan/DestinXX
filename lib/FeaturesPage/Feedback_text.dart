

String generateFeedback(double overallscore) {
  double score = overallscore * 10;
  String feedback;

  if (score <= 5) {
    feedback = "There are clear areas for improvement. Reflect on the feedback and target specific aspects for enhanced future performance. Dedication and focused effort will lead to progress.";
  } else if (score <= 7) {
    feedback = "Your performance is good, but there are areas needing improvement. Focus on refining your skills and aim to reach a higher level of proficiency.";
  } else if (score <= 9) {
    feedback = "Your performance is good, but there is room for enhancement. Pay attention to details and work on fine-tuning your answers.";
  } else if (score == 10) {
    feedback = "You have demonstrated excellent performance. Continue to maintain this high level and keep challenging yourself.";
  } else {
    feedback = "It seems there might be an error in the score calculation. Please check the score and try again.";
  }

  return feedback;
}