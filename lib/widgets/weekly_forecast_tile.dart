import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class WeeklyAttributeTile extends StatelessWidget {
  const WeeklyAttributeTile(
      {super.key,
      required this.icon,
      required this.dayType,
      required this.humidity,
      required this.maxTemp,
      required this.minTemp,
      required this.date});
  final String icon;
  final String dayType;
  final double humidity;
  final double maxTemp;
  final double minTemp;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('Sunday'),
      trailing: Text(
          '${maxTemp.toStringAsFixed(2)}° / ${minTemp.toStringAsFixed(2)}° C'),
      horizontalTitleGap: 20,
      title: Row(
        children: [
          Image.network(
            icon,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
          Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.water_rounded,
                size: 20,
                color: Colors.blue,
              ),
              Text(
                '${humidity.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
