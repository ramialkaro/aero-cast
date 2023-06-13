import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../settings/background_selector.dart';
import '../weather/weather_forecast.dart';
import '../widgets/date_view.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../weather/waether_summary.dart';
import '../weather/weather_compact.dart';
import '../weather/weather_condition.dart';
import '../weather/weather_current_temp.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<MainView> {
  late Future<WeatherModel> weatherDataFuture;

  @override
  void initState() {
    super.initState();
    weatherDataFuture = fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: weatherDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
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
            body: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.black26,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Error',
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
            body: const Center(
              child: Text('Error occurred while fetching data.'),
            ),
          );
        } else if (snapshot.hasData) {
          final WeatherModel weatherData = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "${weatherData.city.name}, ${weatherData.city.country}",
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DateView(date: weatherData.list.first.dt),
                  WeatherCondition(
                    condition: weatherData.list.first.weather.first.main,
                  ),
                  WeatherCurrentTemp(
                    temp: weatherData.list.first.main.temp,
                  ),
                  WaetherSummary(
                    feelsLike: weatherData.list.first.main.feels_like.round(),
                    temp: weatherData.list.first.main.temp.round(),
                    tempMin: weatherData.list.first.main.temp_min.round(),
                    tempMax: weatherData.list.first.main.temp_max.round(),
                  ),
                  WeatherCompact(
                    windSpeed: weatherData.list.first.wind.speed,
                    humidity: weatherData.list.first.main.humidity,
                    visibility: weatherData.list.first.visibility,
                  ),
                  WeatherForecast(forecast: weatherData.list),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'No Data',
                style: GoogleFonts.ledger(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 22,
                ),
              ),
            ),
            body: const Center(
              child: Text('No data available.'),
            ),
          );
        }
      },
    );
  }
}
