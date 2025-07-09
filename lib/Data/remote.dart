import 'dart:convert';

import 'package:advice_generator/Data/entity.dart';
import 'package:http/http.dart' as http;

class AdviceRemoteDataSource {
  final http.Client client;

  AdviceRemoteDataSource(this.client);

  Future<AdviceModel> getRandomAdvice() async {
    final response = await client.get(Uri.parse("https://api.adviceslip.com/advice"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AdviceModel.fromJson(data);
    } else {
      throw Exception("Failed to load advice");
    }
  }
}