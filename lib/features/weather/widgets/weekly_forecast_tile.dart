import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:gap/gap.dart';

class WeeklyAttributeTile extends StatelessWidget {
  const WeeklyAttributeTile({
    super.key,
    required this.icon,
    required this.dayType,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
    required this.date,
  });

  final String icon;
  final String dayType;
  final double humidity;
  final double maxTemp;
  final double minTemp;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // Format the date to display the day of the week
    String dayOfWeek = DateFormat.EEEE().format(date);

    // Check if the date is today's date
    bool isToday = date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year;

    return ListTile(
      tileColor: isToday ? Colors.grey.withOpacity(0.5) : null,
      leading: Text(
        dayOfWeek,
        style: TextStyle(
          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          color: isToday ? Colors.blue : null,
        ),
      ),
      trailing: Text(
        '${maxTemp.toStringAsFixed(2)}° / ${minTemp.toStringAsFixed(2)}° C',
      ),
      horizontalTitleGap: 20,
      title: Row(
        children: [
          Image.network(
            icon,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
          const Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.water_drop,
                size: 20,
                color: Colors.blue,
              ),
              Text(
                '${humidity.toStringAsFixed(2)}%',
                style: const TextStyle(
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
