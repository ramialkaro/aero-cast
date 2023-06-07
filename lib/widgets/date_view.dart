import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../settings/theme_provider.dart';

class DateView extends StatelessWidget {
  const DateView({Key? key, required this.date}) : super(key: key);

  final int date;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);

    var themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          formattedDate,
          style: TextStyle(
              color: Color(themeProvider.backgroundColor), fontSize: 20),
        ),
      ),
    );
  }
}
