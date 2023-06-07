import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WaetherSummary extends StatelessWidget {
  const WaetherSummary(
      {Key? key,
      required this.feelsLike,
      required this.tempMin,
      required this.temp,
      required this.tempMax})
      : super(key: key);

  final int feelsLike;
  final int temp;
  final int tempMin;
  final int tempMax;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.dailySummary,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppLocalizations.of(context)!
                  .temperatureText(feelsLike, temp, tempMax, tempMin),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
