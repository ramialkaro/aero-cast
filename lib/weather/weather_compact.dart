import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/theme_provider.dart';

class WeatherCompact extends StatefulWidget {
  const WeatherCompact(
      {Key? key,
      required this.humidity,
      required this.visibility,
      required this.windSpeed})
      : super(key: key);

  final double windSpeed;
  final int humidity;
  final int visibility;

  @override
  State<WeatherCompact> createState() => _WeatherCompactState();
}

class _WeatherCompactState extends State<WeatherCompact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherCompactItemInfo(
                icon: Icons.waves,
                value: "${widget.windSpeed} m/s",
                title: AppLocalizations.of(context).wind),
            WeatherCompactItemInfo(
                icon: Icons.water_drop_outlined,
                value: "${widget.humidity} %",
                title: AppLocalizations.of(context).humidity),
            WeatherCompactItemInfo(
                icon: Icons.remove_red_eye_outlined,
                value: "${widget.visibility / 1000}km",
                title: AppLocalizations.of(context).visibility),
          ],
        ),
      ),
    );
  }
}

class WeatherCompactItemInfo extends StatefulWidget {
  final IconData icon;
  final String value;
  final String title;

  const WeatherCompactItemInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  @override
  State<WeatherCompactItemInfo> createState() => _WeatherCompactItemInfoState();
}

class _WeatherCompactItemInfoState extends State<WeatherCompactItemInfo> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Icon(
          widget.icon,
          color: Color(themeProvider.backgroundColor),
          size: 40,
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Text(
          widget.value,
          style: TextStyle(
            color: Color(themeProvider.backgroundColor),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Text(
          widget.title,
          style: TextStyle(
              color: Color(themeProvider.backgroundColor), fontSize: 14),
        ),
      ],
    );
  }
}
