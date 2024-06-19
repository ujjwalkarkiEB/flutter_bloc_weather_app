import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/weather/bloc/weather_bloc.dart';

Future<void> showErrorDialog(BuildContext context, String errorMessage) async {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text('Error!'),
        content: Text(errorMessage),
        actions: <Widget>[
          ElevatedButton(
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<WeatherBloc>().add(WeatherRefreshRequestEvenet());
            },
          ),
        ],
      );
    },
  );
}
