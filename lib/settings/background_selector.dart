import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'language_selector.dart';
import 'theme_provider.dart';

class BackgroundSelector extends StatelessWidget {
  const BackgroundSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final List<int> backgroundColors = [
      0xffffffff,
      0xff42c6ff,
      0xffffe142,
      0xffff64d4,
      0xff1B9C85,
      0xffF1D4E5,
      0xff8294C4,
      0xffBE5A83,
    ];
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Backgrounds: ",
                  style: GoogleFonts.ledger(
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: LanguageSelector(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              backgroundColors.length,
              (index) => GestureDetector(
                onTap: () {
                  themeProvider.backgroundColor = backgroundColors[index];
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.circle,
                    color: Color(backgroundColors[index]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
