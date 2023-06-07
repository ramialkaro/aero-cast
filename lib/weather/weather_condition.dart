import 'package:flutter/material.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({Key? key, required this.condition}) : super(key: key);

  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          condition,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
