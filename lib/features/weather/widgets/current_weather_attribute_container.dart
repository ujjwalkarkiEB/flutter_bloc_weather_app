import 'package:flutter/material.dart';

class WeatherAttributesContainer extends StatelessWidget {
  const WeatherAttributesContainer(
      {super.key,
      required this.city,
      required this.temp,
      required this.icon,
      required this.type,
      required this.maxTemp,
      required this.minTemp});

  final String city;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String icon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.19,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${temp.toStringAsFixed(2)} °C',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_upward),
                Text(
                  '${maxTemp.toStringAsFixed(2)}°',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Icon(Icons.arrow_downward),
                Text(
                  '${minTemp.toStringAsFixed(2)}°',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: Colors.grey,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
