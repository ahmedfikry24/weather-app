import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class Crud {
  Future<Map<String, dynamic>> getWeather(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=1e998ea76ccd42eab2c214149222311&q=$cityName'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          "the sever has an error with status code ${response.statusCode}");
    }
  }
}
