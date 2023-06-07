import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'language_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Wrap(
      spacing: 10.0, // Spacing between the language options
      children: [
        GestureDetector(
          onTap: () {
            languageProvider.language = "en";
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'EN',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            languageProvider.language = "fi";
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            color: Colors.green,
            child: const Center(
              child: Text(
                'FI',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            languageProvider.language = "es";
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            color: Colors.orange,
            child: const Center(
              child: Text(
                'ES',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
