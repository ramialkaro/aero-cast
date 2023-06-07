import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCurrentTemp extends StatefulWidget {
  const WeatherCurrentTemp({Key? key, required this.temp}) : super(key: key);

  final double temp;

  @override
  // ignore: library_private_types_in_public_api
  _WeatherCurrentTempState createState() => _WeatherCurrentTempState();
}

class _WeatherCurrentTempState extends State<WeatherCurrentTemp>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AnimatedDefaultTextStyle(
          style: GoogleFonts.sofiaSans(
            fontSize: 180,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Text(
            "${widget.temp.toStringAsFixed(0)}°", // Convert double to string
            style: GoogleFonts.sofiaSans(
              fontSize: 180,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
