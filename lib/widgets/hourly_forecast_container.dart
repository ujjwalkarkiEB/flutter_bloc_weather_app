import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.temp,
    required this.icon,
    required this.dayType,
    required this.humidity,
    required this.time,
  });
  final double temp;
  final String icon;
  final String dayType;
  final double humidity;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 228, 227, 223),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
            ),
            Text(time),
            Expanded(
              child: Image.network(
                icon,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            Text('$temp °C'),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.water_drop),
                  Text('${humidity.toStringAsFixed(2)}%')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
