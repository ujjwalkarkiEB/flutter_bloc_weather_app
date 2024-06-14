import 'package:flutter/material.dart';

class WeeklyAttributeTile extends StatelessWidget {
  const WeeklyAttributeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Text('Sunday'),
      trailing: Text('26° / 13°'),
      title: Row(
        children: [
          Icon(Icons.sunny),
          Row(
            children: [Icon(Icons.water), Text('0%')],
          )
        ],
      ),
    );
  }
}
