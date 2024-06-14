import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
  });
  // final String city;
  // final double temp;
  // final String icon;
  // final String statusText;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                Text('1 PM'),
                Icon(Icons.sunny),
                Text('26°'),
                Row(
                  children: [Icon(Icons.water), Text('0%')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
