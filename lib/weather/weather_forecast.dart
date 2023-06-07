import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({Key? key}) : super(key: key);

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
            AppLocalizations.of(context)!.forecast,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
            width: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherForecastItem(
                // DAY - 1
                temp: "12",
                icon: Icons.cloud,
                date: 1686079034,
              ),
              WeatherForecastItem(
                // DAY - 2
                temp: "12",
                icon: Icons.cloud,
                date: 1686079034,
              ),
              WeatherForecastItem(
                // DAY - 3
                temp: "12",
                icon: Icons.cloud,
                date: 1686079034,
              ),
              WeatherForecastItem(
                // DAY - 4
                temp: "12",
                icon: Icons.cloud,
                date: 1686079034,
              ),
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
