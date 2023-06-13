import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/weather_model.dart';
import '../utils/icon_checker.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({Key? key, required this.forecast}) : super(key: key);

  final List<Day> forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
            width: 12,
          ),
          Text(
            AppLocalizations.of(context).forecast,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
            width: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherForecastItem(
                  // DAY - 1
                  temp: forecast.elementAt(5).main.temp.toStringAsFixed(0),
                  icon:
                      getWeatherIcon(forecast.elementAt(5).weather.first.main),
                  date: forecast.elementAt(5).dt),
              WeatherForecastItem(
                  // DAY - 2
                  temp: forecast.elementAt(13).main.temp.toStringAsFixed(0),
                  icon:
                      getWeatherIcon(forecast.elementAt(13).weather.first.main),
                  date: forecast.elementAt(13).dt),
              WeatherForecastItem(
                  // DAY - 3
                  temp: forecast.elementAt(21).main.temp.toStringAsFixed(0),
                  icon:
                      getWeatherIcon(forecast.elementAt(21).weather.first.main),
                  date: forecast.elementAt(21).dt),
              WeatherForecastItem(
                  // DAY - 4
                  temp: forecast.elementAt(29).main.temp.toStringAsFixed(0),
                  icon:
                      getWeatherIcon(forecast.elementAt(21).weather.first.main),
                  date: forecast.elementAt(29).dt),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherForecastItem extends StatelessWidget {
  final String temp;
  final IconData icon;
  final int date;

  const WeatherForecastItem(
      {super.key, required this.temp, required this.icon, required this.date});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    String formattedDate = DateFormat('d MMM').format(now);
    return Container(
      height: 120,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              temp,
              style: const TextStyle(fontSize: 24),
            ),
            Icon(icon, size: 24),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
