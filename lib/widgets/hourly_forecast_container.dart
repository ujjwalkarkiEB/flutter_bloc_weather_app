import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.temp,
    required this.icon,
    required this.dayType,
    required this.humidity,
  });
  final double temp;
  final String icon;
  final String dayType;
  final double humidity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                Text('1 PM'),
                Image.network(
                  icon,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                Text('$temp °C'),
                Row(
                  children: [
                    Icon(Icons.water),
                    Text('${humidity.toStringAsFixed(2)}%')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
