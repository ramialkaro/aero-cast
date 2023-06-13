// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/weather_model.dart';

Future<WeatherModel> fetchWeatherData() async {
  var openWeatherApiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
  final respose = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?lat=60.19&lon=24.94&units=metric&appid=$openWeatherApiKey"));

  if (respose.statusCode == 200) {
    final jsonData = json.decode(respose.body);
    final weatherData = WeatherModel.fromJson(jsonData);
    return weatherData;
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
