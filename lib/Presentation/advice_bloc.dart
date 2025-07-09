import 'package:advice_generator/Domain/usecase.dart';
import 'package:bloc/bloc.dart';

import 'advice_event.dart';
import 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final GetRandomAdvice getRandomAdvice;

  AdviceBloc(this.getRandomAdvice) : super(AdviceInitial()) {
    on<GetAdviceEvent>((event, emit) async {
      emit(AdviceLoading());
      try {
        final advice = await getRandomAdvice();
        emit(AdviceLoaded(advice));
      } catch (_) {
        emit(AdviceError("Failed to fetch advice. Try again!"));
      }
    });
  }
}
