part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}

final class ApiFetchingReport extends ApiState{}

final class ApiFetchSuccessful extends ApiState{
  final Map<String ,dynamic> report ;
  ApiFetchSuccessful({
    required this.report,
  });
}

final class ApiFailed extends ApiState{
  String error;
  ApiFailed({
    required this.error
  });
}