
import 'package:advice_generator/Domain/advice.dart';

abstract class AdviceRepository {
  Future<Advice> getRandomAdvice();
}
