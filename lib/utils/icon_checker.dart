import 'package:flutter/material.dart';

IconData getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case "rain":
      return Icons.water_drop_outlined;
    case "clear":
      return Icons.wb_sunny;
    case "clouds":
      return Icons.cloud;
    case "windy":
      return Icons.cloud_queue;
    case "snow":
      return Icons.snowing;
    case 'extreme':
      return Icons.warning;
    case 'thunderstorm':
      return Icons.thunderstorm;
    default:
      return Icons.sunny;
  }
}
