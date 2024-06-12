part of 'print_bloc.dart';

@immutable
sealed class PrintState {}

final class PrintInitial extends PrintState {}
final class PrintStarted extends PrintState{}
final class PrintCompleted extends PrintState{}
final class PrintFailed extends PrintState{}
