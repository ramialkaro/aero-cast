import 'package:aerocast/weather/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../settings/background_selector.dart';
import '../weather/waether_summary.dart';
import '../weather/weather_compact.dart';
import '../weather/weather_condition.dart';
import '../weather/weather_current_temp.dart';
import '../widgets/date_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Helsinki, FI",
          style: GoogleFonts.ledger(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 40,
            icon: const Icon(Icons.segment),
            color: Colors.black87,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return const SizedBox(
                      height: 200,
                      child: BackgroundSelector(),
                    );
                  }));
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DateView(date: 1686079034),
            WeatherCondition(
              condition: "Clouds",
            ),
            WeatherCurrentTemp(
              temp: 14,
            ),
            WaetherSummary(
              feelsLike: 12,
              temp: 14,
              tempMin: 7,
              tempMax: 15,
            ),
            WeatherCompact(
              windSpeed: 21,
              humidity: 45,
              visibility: 4,
            ),
            WeatherForecast(),
          ],
        ),
      ),
    );
  }
}
