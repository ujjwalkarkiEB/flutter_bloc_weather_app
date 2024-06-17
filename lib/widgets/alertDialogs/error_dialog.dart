import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
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
            },
          ),
        ],
      );
    },
  );
}
