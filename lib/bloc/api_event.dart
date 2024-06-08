part of 'api_bloc.dart';

@immutable
sealed class ApiEvent {}

final class ApiCall extends ApiEvent{
  final interviewQuestions;
  final interviewAnswer;
  ApiCall({
    required this.interviewAnswer,
    required this.interviewQuestions,
  });
}

