import 'package:advice_generator/Domain/advice.dart';

abstract class AdviceState {}

class AdviceInitial extends AdviceState {}

class AdviceLoading extends AdviceState {}

class AdviceLoaded extends AdviceState {
  final Advice advice;

  AdviceLoaded(this.advice);
}

class AdviceError extends AdviceState {
  final String message;

  AdviceError(this.message);
}
