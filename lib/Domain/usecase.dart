import 'package:advice_generator/Domain/advice.dart';
import 'package:advice_generator/Domain/repostory.dart';

class GetRandomAdvice {
  final AdviceRepository repository;

  GetRandomAdvice(this.repository);

  Future<Advice> call() async {
    return await repository.getRandomAdvice();
  }
}
