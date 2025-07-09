import 'package:advice_generator/Domain/advice.dart';

class AdviceModel extends Advice {
  AdviceModel({required super.id, required super.advice});

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      id: json['slip']['id'],
      advice: json['slip']['advice'],
    );
  }
}