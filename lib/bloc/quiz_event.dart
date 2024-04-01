part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class QuizStarted extends QuizEvent {}

final class NoButtonPressed extends QuizEvent {}

final class YesButtonPressed extends QuizEvent {}

final class RestartButtonPressed extends QuizEvent {}

final class QuizEnded extends QuizEvent {}
